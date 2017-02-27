//
//  LCMyCouponModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CouponContents,Discountcouponlist,Cashcouponlist;
@interface LCMyCouponModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) CouponContents *contents;

@end
@interface CouponContents : NSObject

@property (nonatomic, strong) NSArray<Discountcouponlist *> *discountCouponList;

@property (nonatomic, strong) NSArray<Cashcouponlist *> *cashCouponList;

@end

@interface Discountcouponlist : NSObject

@property (nonatomic, copy) NSString *coupon_discount;

@property (nonatomic, copy) NSString *coupon_rule;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, copy) NSString *coupon_name;

@property (nonatomic, copy) NSString *coupon_id;

@end

@interface Cashcouponlist : NSObject

@property (nonatomic, copy) NSString *coupon_discount;

@property (nonatomic, copy) NSString *coupon_rule;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, copy) NSString *coupon_name;

@property (nonatomic, copy) NSString *coupon_id;

@end

