//
//  LCNotarizeOrderModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"
#import "LCUseCouponModel.h"
@interface LCNotarizeOrderViewModel : BaseViewModel
@property(nonatomic,strong) NSURL *imageURL;
@property(nonatomic,strong) NSString *titleName;
@property(nonatomic,strong) NSString *courseID;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *order_sn;

@property(nonatomic,copy) void (^zhifu)();
@property(nonatomic,copy) void (^callBackforZifuSucceed)();//支付成功回调
@property(nonatomic,copy) void (^pushSearchVoucher)(NSString *orderSn ,void (^refreshThePrice)(LCUseCouponModel *model));
@property(nonatomic,copy) void (^refreshThePrice)(LCUseCouponModel *model);

@end
