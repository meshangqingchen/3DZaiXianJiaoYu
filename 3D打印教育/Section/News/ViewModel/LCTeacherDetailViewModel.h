//
//  LCTeacherDetailViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCTeacherDetailViewModel : BaseViewModel
@property(nonatomic,strong) NSString *teacherID;
@property(nonatomic,copy) void (^networkRequests)(NSString *teacherID);
@property(nonatomic,copy) void (^bingViewModel)(id viewModel);

@property(nonatomic,copy) void (^pushTackWithTeacher)(id viewModel); //跳转到和老师对话界面
@property(nonatomic,copy) void (^pushZhiFuForZiXun)(id viewModel);    //跳转到后买资讯 认订单界面

@end
