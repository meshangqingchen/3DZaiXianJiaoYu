//
//  LCRootViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCRootViewModel.h"

@interface LCRootViewModel ()
@property(nonatomic,strong,readwrite) LCHomeViewModel *homeViewModel;
@property(nonatomic,strong,readwrite) LCCourseClassViewModel *courseClassViewModel;
//@property(nonatomic,strong,readwrite) LCNewsViewModel *newsViewModel;
@property(nonatomic,strong,readwrite) LCCounselTeacherViewModel* counselTeacherViewModel;
@property(nonatomic,strong,readwrite) LCPersonalCenterViewModel *personalCenterViewModel;
@end

@implementation LCRootViewModel

-(void)initialize{
    [super initialize];
    self.homeViewModel = [[LCHomeViewModel alloc]initWithServices:self.navigationStackService params:nil];
    self.courseClassViewModel = [[LCCourseClassViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"课程分类"}];
    self.counselTeacherViewModel =[[LCCounselTeacherViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"专家咨询"}];
    
    self.personalCenterViewModel = [[LCPersonalCenterViewModel alloc]initWithServices:self.navigationStackService params:nil];
}

@end
