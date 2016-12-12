//
//  LCRootViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"
#import "LCHomeViewModel.h"
#import "LCMyCourseViewModel.h"
#import "LCNewsViewModel.h"
#import "LCPersonalCenterViewModel.h"
@interface LCRootViewModel : BaseViewModel
@property(nonatomic,strong,readonly) LCHomeViewModel *homeViewModel;
@property(nonatomic,strong,readonly) LCMyCourseViewModel *myCourseViewModel;
@property(nonatomic,strong,readonly) LCNewsViewModel *newsViewModel;
@property(nonatomic,strong,readonly) LCPersonalCenterViewModel *personalCenterViewModel;
@end
