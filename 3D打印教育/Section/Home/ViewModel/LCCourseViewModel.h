//
//  LCCourseViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCCourseViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^fromVideoVMGetData)(id model);
@property(nonatomic,copy) void (^selectVideoCell)(id model);//事件
@end
