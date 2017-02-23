//
//  LCCouponCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCouponCellViewModel.h"
#import "LCMyCouponModel.h"
/*
 @property (nonatomic, copy) NSString *coupon_discount;
 
 @property (nonatomic, copy) NSString *coupon_rule;
 
 @property (nonatomic, copy) NSString *end_time;
 
 @property (nonatomic, copy) NSString *coupon_name;
 
 @property(nonatomic,assign) YouHuiQuan *youHuiQianType;
 */
@implementation LCCouponCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        if ([model isKindOfClass:[Discountcouponlist class]]) {
            Discountcouponlist *discountcouponModel = model;
            self.youHuiQianType = ZheKouQuan;
            self.coupon_discount = discountcouponModel.coupon_discount;
            self.coupon_rule = discountcouponModel.coupon_rule;
            self.end_time = discountcouponModel.end_time;
            self.coupon_name = discountcouponModel.coupon_name;
        }
        if ([model isKindOfClass:[Cashcouponlist class]]) {
            Cashcouponlist *cashCouponModel = model;
            self.youHuiQianType = XianJinQuan;
            self.coupon_discount = cashCouponModel.coupon_discount;
            self.coupon_rule = cashCouponModel.coupon_rule;
            self.end_time = cashCouponModel.end_time;
            self.coupon_name = cashCouponModel.coupon_name;
        }
    }
    return self;
}
@end
