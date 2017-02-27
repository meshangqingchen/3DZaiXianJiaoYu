//
//  LCMembersPriceModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/27.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCMemberPriceContents;
@interface LCMembersPriceModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCMemberPriceContents *> *contents;

@end
@interface LCMemberPriceContents : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *longTime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@end

