//
//  LCJoinCourseModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCJoinCourseContents;
@interface LCJoinCourseModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCJoinCourseContents *> *contents;

@end
@interface LCJoinCourseContents : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *created_time;

@end

