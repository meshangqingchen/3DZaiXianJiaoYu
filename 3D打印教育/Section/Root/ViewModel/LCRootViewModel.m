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
@property(nonatomic,strong,readwrite) LCMyCourseViewModel *myCourseViewModel;
@property(nonatomic,strong,readwrite) LCNewsViewModel *newsViewModel;
@property(nonatomic,strong,readwrite) LCPersonalCenterViewModel *personalCenterViewModel;
@end

@implementation LCRootViewModel

-(void)initialize{
    [super initialize];
    self.homeViewModel = [[LCHomeViewModel alloc]initWithServices:self.navigationStackService params:nil];
    self.myCourseViewModel = [[LCMyCourseViewModel alloc]initWithServices:self.navigationStackService params:nil];
    self.newsViewModel = [[LCNewsViewModel alloc]initWithServices:self.navigationStackService params:nil];
    self.personalCenterViewModel = [[LCPersonalCenterViewModel alloc]initWithServices:self.navigationStackService params:nil];
}

@end
