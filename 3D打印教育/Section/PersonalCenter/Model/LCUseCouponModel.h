//
//  LCUseCouponModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/24.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCUseCouponContents;
@interface LCUseCouponModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCUseCouponContents *contents;

@end
@interface LCUseCouponContents : NSObject

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *order_sn;

@property (nonatomic, copy) NSString *discount;

@end

