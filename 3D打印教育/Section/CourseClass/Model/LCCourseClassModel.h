//
//  LCCourseClassModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCCourseClassContents,LCCourseClassSonlist;
@interface LCCourseClassModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCCourseClassContents *> *contents;

@end
@interface LCCourseClassContents : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, strong) NSArray<LCCourseClassSonlist *> *sonList;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *pid;

@property (nonatomic, copy) NSString *path;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *name;

@end

@interface LCCourseClassSonlist : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *pid;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *path;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *name;

@end

