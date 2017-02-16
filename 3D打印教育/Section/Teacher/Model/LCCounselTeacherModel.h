//
//  LCCounselTeacherModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LCTeacherModel;
@interface LCCounselTeacherModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCTeacherModel *> *contents;


@end

@interface LCTeacherModel : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, copy) NSString *shot_discription;

@end

