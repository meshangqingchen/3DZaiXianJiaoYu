//
//  LCCollectCourseModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCCollectCourseContents,LCCollectCourseList;
@interface LCCollectCourseModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCCollectCourseContents *contents;

@end
@interface LCCollectCourseContents : NSObject

@property (nonatomic, strong) NSArray<LCCollectCourseList *> *list;

@end

@interface LCCollectCourseList : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *teacher_name;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *created_time;

@end

