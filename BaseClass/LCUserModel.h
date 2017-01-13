//
//  LCUserModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/12.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCUserContents;
@interface LCUserModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCUserContents *contents;

@end
@interface LCUserContents : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *user_name;

@end

