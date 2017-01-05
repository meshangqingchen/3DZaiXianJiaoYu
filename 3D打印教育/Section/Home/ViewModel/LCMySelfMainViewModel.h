//
//  LCMySelfMainViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//  个人主页

#import "BaseTableViewModel.h"

@interface LCMySelfMainViewModel : BaseTableViewModel

@property(nonatomic,copy) void (^bindViewModel)(id viewModel);
@end
