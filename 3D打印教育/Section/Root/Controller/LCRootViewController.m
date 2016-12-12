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
#import "LCMyCourseViewController.h"
#import "LCNewsViewController.h"
#import "LCPersonalCenterViewController.h"


@interface LCRootViewController ()<RDVTabBarControllerDelegate>
@property(nonatomic,strong) LCRootViewModel *viewModel;
@property(nonatomic,strong) RDVTabBarController *tabBarController;
@end

@implementation LCRootViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
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
    
    LCMyCourseViewController *myCourseVC = [[LCMyCourseViewController alloc]initWithViewModel:self.viewModel.myCourseViewModel];
    RTRootNavigationController *myCourseNVC = [[RTRootNavigationController alloc]initWithRootViewController:myCourseVC];
    
    LCNewsViewController *newsVC = [[LCNewsViewController alloc]initWithViewModel:self.viewModel.homeViewModel];
    RTRootNavigationController *newsNVC = [[RTRootNavigationController alloc]initWithRootViewController:newsVC];
    
    LCPersonalCenterViewController *personalCenterVC = [[LCPersonalCenterViewController alloc]initWithViewModel:self.viewModel.homeViewModel];
    RTRootNavigationController *personalCenterNVC = [[RTRootNavigationController alloc]initWithRootViewController:personalCenterVC];
    
    [self.tabBarController setViewControllers:@[homeNVC,myCourseNVC,newsNVC,personalCenterNVC]];
    [kSharedAppDelegate.navigationStackService pushNavigationController:homeNVC];
    
}

-(void)customizeTabBarForController{
    NSArray* selecttabBarItemImages = @[@"home_select",@"course_select",@"news_select",@"personal_select"];
    NSArray* nomailtabBarItemImages = @[@"home_nomal",@"course_nomal",@"news_nomal",@"personal_nomal"];
    NSArray *tabBarItemTitles       = @[@"首页",@"我的课程",@"资讯",@"我"];

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
