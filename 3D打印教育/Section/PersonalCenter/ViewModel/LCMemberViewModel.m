//
//  LCMemberViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberViewModel.h"
#import "LCMemberTopCellViewModel.h"
#import "LCMemberCellViewModel.h"
#import "LCMembersPriceModel.h"
#import "NSObject+Property.h"
#import "LCMembersPriceModel.h"
#import "NSObject+Common.h"


#import "Order.h"
#import "RSADataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "KDFileManager.h"
/*
 
 
 
 
 */



@implementation LCMemberViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setBuyMembersCreatOrder:^(NSString *memberCarID,NSString *price) {
        @strongify(self)
        [self showProgress];
        [self.netApi_Manager buyMemberWithMemberCarID:memberCarID CompleteHandle:^(id responseObj, NSError *error) {
            [self hideProgress];
            NSString *memberOrder = nil;
            NSNumber *status = responseObj[@"status"];
            NSString *msg = responseObj[@"msg"];
            
            [responseObj enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSLog(@"key = %@",key);
                NSLog(@"obj = %@",NSStringFromClass([obj class]));
            }];
            
            if ([status isEqualToNumber:@0]) {
                [NSObject showWarning:msg];
                return ;
            }
            memberOrder = responseObj[@"contents"];
            [KDFileManager saveUserData:memberOrder forKey:LCCORDER_SN];
            //"NSObject+Common.h
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
            order.biz_content.body = @"购买会员";
            order.biz_content.subject = @"1";
            order.biz_content.out_trade_no = memberOrder; //订单ID（由商家自行制定）
            order.biz_content.timeout_express = @"30m"; //超时时间设置
            float priceE = [price floatValue];
            order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", priceE]; //商品价格
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
                        //成功了就....
                        [self.netApi_Manager paySucceedWithMemberOrder_sn:memberOrder completeHandle:^(id responseObj, NSError *error) {
                            NSNumber *status = responseObj[@"status"];
                            NSString *contents = responseObj[@"contents"];
                            if ([status isEqualToNumber:@1]) {
                                kSharedAppDelegate.payForMemberCarSucced(contents);
                            }else{
                                [self.netApi_Manager paySucceedWithMemberOrder_sn:memberOrder completeHandle:^(id responseObj, NSError *error) {
                                    NSNumber *status = responseObj[@"status"];
                                    if ([status isEqualToNumber:@1]) {
                                        kSharedAppDelegate.payForMemberCarSucced(contents);
                                    }else{
                                        [self.netApi_Manager paySucceedWithMemberOrder_sn:memberOrder completeHandle:^(id responseObj, NSError *error) {
                                            NSNumber *status = responseObj[@"status"];
                                            if ([status isEqualToNumber:@1]) {
                                                kSharedAppDelegate.payForMemberCarSucced(contents);
                                            }else{
                                                NSLog(@"无能无力里了");
                                            }
                                        }];
                                    }
                                }];
                            }
                        }];
                    }
                }];
            }
        }];
    }];
    
    [kSharedAppDelegate setPayForMemberCarSucced:^(NSString *storpTime) {
        
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    [self.netApi_Manager memberCardCompleteHandle:^(id responseObj, NSError *error) {
        
        LCMembersPriceModel *membersPriceModel = [LCMembersPriceModel parseJSON:responseObj];
        NSArray <LCMemberPriceContents *> *contents = membersPriceModel.contents;
        
        for (int i = 0; i<contents.count; i++) {
            LCMemberCellViewModel *cellVM = [[LCMemberCellViewModel alloc]initWithModel:contents[i]];
            cellVM.buyMembersCreatOrder = self.buyMembersCreatOrder;
            [self.mutableDataArr addObject:cellVM];
        }
        LCMemberTopCellViewModel *topCellVM = [LCMemberTopCellViewModel new];
        if (isMember) {
            [self.mutableDataArr insertObject:topCellVM atIndex:0];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}

@end
