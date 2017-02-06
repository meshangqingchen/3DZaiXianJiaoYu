//
//  LCRootViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCRootViewController.h"
#import "LCRootViewModel.h"
//TabBar控制器
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
//导航控制器
#import "RTRootNavigationController.h"
//四个模块控制器
#import "LCHomeViewController.h"
#import "LCCourseClassViewController.h"
#import "LCCounselTeacherViewController.h"
#import "LCPersonalCenterViewController.h"

#import "LCNavigationStackService.h"//栈实例

@interface LCRootViewController ()<RDVTabBarControllerDelegate>
@property(nonatomic,strong) LCRootViewModel *viewModel;
@property(nonatomic,strong) RDVTabBarController *tabBarController;
@end

@implementation LCRootViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController = [[RDVTabBarController alloc]init];
    self.tabBarController.delegate = self;
    self.tabBarController.view.frame = self.view.bounds;
    self.tabBarController.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    [self setupViewControllers];
    [self customizeTabBarForController];
}

-(void)setupViewControllers{
    LCHomeViewController *homeVC = [[LCHomeViewController alloc]initWithViewModel:self.viewModel.homeViewModel];
    RTRootNavigationController *homeNVC = [[RTRootNavigationController alloc]initWithRootViewController:homeVC];
    
    LCCourseClassViewController *courseClassVC = [[LCCourseClassViewController alloc]initWithViewModel:self.viewModel.courseClassViewModel];
    RTRootNavigationController *courseClassNVC = [[RTRootNavigationController alloc]initWithRootViewController:courseClassVC];
    
    LCCounselTeacherViewController *counselTeacherViewVC = [[LCCounselTeacherViewController alloc]initWithViewModel:self.viewModel.counselTeacherViewModel];
    RTRootNavigationController *counselTeacherViewNVC = [[RTRootNavigationController alloc]initWithRootViewController:counselTeacherViewVC];
    
    LCPersonalCenterViewController *personalCenterVC = [[LCPersonalCenterViewController alloc]initWithViewModel:self.viewModel.personalCenterViewModel];
    RTRootNavigationController *personalCenterNVC = [[RTRootNavigationController alloc]initWithRootViewController:personalCenterVC];
    
    [self.tabBarController setViewControllers:@[homeNVC,courseClassNVC,counselTeacherViewNVC,personalCenterNVC]];
    [kSharedAppDelegate.navigationStackService pushNavigationController:homeNVC];
    
}

-(void)customizeTabBarForController{
    NSArray* selecttabBarItemImages = @[@"home_select",@"course_select",@"news_select",@"personal_select"];
    NSArray* nomailtabBarItemImages = @[@"home_nomal",@"course_nomal",@"news_nomal",@"personal_nomal"];
    NSArray *tabBarItemTitles       = @[@"首页",@"课程分类",@"专家咨询",@"我"];

    NSArray *items = [[self.tabBarController tabBar] items];
    int index = 0;
    for (RDVTabBarItem *item in items) {
        [item setBackgroundSelectedImage:[UIImage imageNamed:@"tabBar_background"] withUnselectedImage:[UIImage imageNamed:@"tabBar_background"]];
        item.titlePositionAdjustment = UIOffsetMake(0, 5);
        UIImage *selectImage = [UIImage imageNamed:selecttabBarItemImages[index]];
        UIImage *nomailImage = [UIImage imageNamed:nomailtabBarItemImages[index]];
        [item setFinishedSelectedImage:selectImage withFinishedUnselectedImage:nomailImage];
        
        [item setTitle:tabBarItemTitles[index]];
        index++;
    }
}

-(void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    [(LCNavigationStackService *)self.viewModel.navigationStackService popNavigationController];
    [(LCNavigationStackService *)self.viewModel.navigationStackService pushNavigationController:(id)viewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
