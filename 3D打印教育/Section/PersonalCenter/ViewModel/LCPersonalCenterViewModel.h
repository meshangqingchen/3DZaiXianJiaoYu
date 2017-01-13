//
//  LCPersonalCenterViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCPersonalCenterViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^bindViewModel)(id viewModel);//给headerView赋值;
@property(nonatomic,copy) void (^goToLoginVC)(); //登录
@property(nonatomic,copy) void (^pushToEditDataVM)(id viewModel); //编辑个人资料

@property(nonatomic,copy) void (^networkRequestPersonalCenter)();

@end
