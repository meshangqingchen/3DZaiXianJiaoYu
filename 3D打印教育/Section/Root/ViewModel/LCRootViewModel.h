//
//  LCRootViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"
#import "LCHomeViewModel.h"
#import "LCCourseClassViewModel.h"
#import "LCCounselTeacherViewModel.h"
#import "LCPersonalCenterViewModel.h"

@interface LCRootViewModel : BaseViewModel
@property(nonatomic,strong,readonly) LCHomeViewModel *homeViewModel;

@property(nonatomic,strong,readonly) LCCourseClassViewModel *courseClassViewModel;
@property(nonatomic,strong,readonly) LCCounselTeacherViewModel* counselTeacherViewModel;
@property(nonatomic,strong,readonly) LCPersonalCenterViewModel *personalCenterViewModel;
@end
