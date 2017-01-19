//
//  LCTeacherDetailModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCTeacherDetailContents;
@interface LCTeacherDetailModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCTeacherDetailContents *contents;

@end
@interface LCTeacherDetailContents : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *nameCN;

@property (nonatomic, assign) BOOL is_problem;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *discription;

@property (nonatomic, copy) NSString *shot_discription;

@end

