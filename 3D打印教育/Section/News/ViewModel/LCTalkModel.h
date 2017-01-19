//
//  LCTalkModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/19.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCTalkContents,LCTalkTeacher,LCTalkUser,LCTalkList;
@interface LCTalkModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCTalkContents *contents;

@end
@interface LCTalkContents : NSObject

@property (nonatomic, strong) LCTalkTeacher *teacher;

@property (nonatomic, strong) LCTalkUser *user;

@property (nonatomic, strong) NSArray<LCTalkList *> *list;

@end

@interface LCTalkTeacher : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *nameCN;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *avatar;

@end

@interface LCTalkUser : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *nick_name;

@end

@interface LCTalkList : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *send_type;

@property (nonatomic, copy) NSString *teacher_id;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, copy) NSString *plan_id;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *created_time;

@end

