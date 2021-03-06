//
//  LCNotarizeOrderModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCNotarizeOrderViewModel.h"
#import "NSObject+Common.h"
#import "KDFileManager.h"

#import "Order.h"
#import "RSADataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "LCVoucherViewModel.h"
@interface LCNotarizeOrderViewModel ()

@end

@implementation LCNotarizeOrderViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setZhifu:^{
        @strongify(self)
        NSString *appID = @"2017011205016142";
        
        NSString *rsa2PrivateKey = LCCRSA2PRIVATEKEY;
        NSString *rsaPrivateKey = @"";
        /*
         *生成订单信息及签名
         */
        //将商品信息赋予AlixPayOrder的成员变量
        Order* order = [Order new];
        
        // NOTE: app_id设置
        order.app_id = appID;
        
        // NOTE: 支付接口名称
        order.method = @"alipay.trade.app.pay";
        
        // NOTE: 参数编码格式
        order.charset = @"utf-8";
        
        // NOTE: 当前时间点
        NSDateFormatter* formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        order.timestamp = [formatter stringFromDate:[NSDate date]];
        
        // NOTE: 支付版本
        order.version = @"1.0";
        
        // NOTE: sign_type 根据商户设置的私钥来决定
        order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
        
        // NOTE: 商品数据
        order.biz_content = [BizContent new];
        order.biz_content.body = self.titleName;
        order.biz_content.subject = @"1";
        order.biz_content.out_trade_no = self.order_sn; //订单ID（由商家自行制定）
        order.biz_content.timeout_express = @"30m"; //超时时间设置
        float price = [self.price floatValue];
        order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", price]; //商品价格
        
        //将商品信息拼接成字符串
        NSString *orderInfo = [order orderInfoEncoded:NO];
        NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
        NSLog(@"orderSpec = %@",orderInfo);
        
        // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
        //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
        NSString *signedString = nil;
        RSADataSigner* signer = [[RSADataSigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
        if ((rsa2PrivateKey.length > 1)) {
            signedString = [signer signString:orderInfo withRSA2:YES];
        } else {
            signedString = [signer signString:orderInfo withRSA2:NO];
        }
        // NOTE: 如果加签成功，则继续执行支付
        if (signedString != nil) {
            //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
            NSString *appScheme = @"LCCWXJY";
            // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
            NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                     orderInfoEncoded, signedString];
            // NOTE: 调用支付结果开始支付
            [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *responseObj) {
                
                NSString *resultStatusSTR =responseObj[@"resultStatus"];
                if ([resultStatusSTR isEqualToString:@"9000"]) {
                    NSString *order_sn = [KDFileManager readUserDataForKey:LCCORDER_SN];
                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                            [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                            MYLog(@"真的错了 调了三次还是错的");
                                        }else{
                                            !kSharedAppDelegate.payForCourseSucced ? : kSharedAppDelegate.payForCourseSucced();
                                            kSharedAppDelegate.payForCourseSucced = nil;
                                        }
                                    }];
                                }else{
                                    !kSharedAppDelegate.payForCourseSucced ? : kSharedAppDelegate.payForCourseSucced();
                                    kSharedAppDelegate.payForCourseSucced = nil;
                                }
                            }];
                        }else{
                            !kSharedAppDelegate.payForCourseSucced ? : kSharedAppDelegate.payForCourseSucced();
                            kSharedAppDelegate.payForCourseSucced = nil;
                        }
                    }];
                }
            }];
        }
    }];
    
    //为课程支付成功 课程支付成功 就返回并 播放第一个 视频
    [kSharedAppDelegate setPayForCourseSucced:^{
        !self.callBackforZifuSucceed ? : self.callBackforZifuSucceed();
        [self.navigationStackService popViewModelAnimated:YES];
    }];
    
    [self setPushSearchVoucher:^(NSString *orderSn ,void (^refreshThePrice)(LCUseCouponModel *model)) {
        @strongify(self)
        LCVoucherViewModel *voucherViewModel = [[LCVoucherViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"我的卡券"}];
        voucherViewModel.orderSn = orderSn;
        voucherViewModel.refreshThePrice = refreshThePrice;
        [self.navigationStackService pushViewModel:voucherViewModel animated:YES];
    }];
}

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.titleName = params[@"titleName"];
        self.price = params[@"price"];
        self.imageURL = params[@"urlStr"];
        self.courseID = params[@"couresID"];
        self.order_sn = params[@"order_sn"];
        self.callBackforZifuSucceed = params[@"callBackBlock"];
    }
    return self;
}

-(void)dealloc{
    MYLog(@"这个释放了");
}
@end
