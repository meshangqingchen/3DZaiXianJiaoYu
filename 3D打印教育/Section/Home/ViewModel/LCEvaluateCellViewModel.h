//
//  LCEvaluateCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/15.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCSonEvaluateCellViewModel.h"
@interface LCEvaluateCellViewModel : NSObject
@property(nonatomic,strong) NSURL    *userHeaderURL;
@property(nonatomic,strong) NSString *creatTime;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) int grade;
@property(nonatomic,strong) YYTextLayout *evaTextLayout;
@property(nonatomic,assign) CGFloat evaluate_H;//评论高度
@property(nonatomic,assign) CGFloat cell_H;//cell总高度
//@property(nonatomic,strong) NSArray <LCSonEvaluateCellViewModel *>*sonEvaluateArr;
//事件
//@property(nonatomic,copy) void(^huifu)(NSString *evaluateID);
//@property(nonatomic,copy) void(^headerImageViewClick)(NSString *evaluateUserID);

-(instancetype)initWithModel:(id)model;
//-(instancetype)initWithEvaluteStr:(NSString *)evaluate and:(NSArray *)arr;
@end
