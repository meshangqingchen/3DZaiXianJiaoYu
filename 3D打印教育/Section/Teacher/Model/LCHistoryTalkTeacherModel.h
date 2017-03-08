//
//  LCHistoryTalkTeacherModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCHistoryTalkContents;
@interface LCHistoryTalkTeacherModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCHistoryTalkContents *> *contents;

@end
@interface LCHistoryTalkContents : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *nameCN;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *message;

@end

