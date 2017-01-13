//
//  LCAssessListModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/11.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LCAssessList;
@interface LCAssessListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCAssessList *> *contents;


@end

@interface LCAssessList : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *user_type;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *descrip;

@property (nonatomic, copy) NSString *plan_id;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *user_nickName;

@end

