//
//  LCMyCouponModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMyCouponModel.h"

@implementation LCMyCouponModel

@end
@implementation CouponContents
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"discountCouponList" : [Discountcouponlist class], @"cashCouponList" : [Cashcouponlist class]};
}

@end


@implementation Discountcouponlist

@end


@implementation Cashcouponlist

@end


