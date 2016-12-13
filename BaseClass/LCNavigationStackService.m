//
//  LCNavigationStackService.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNavigationStackService.h"
#import "KDRouter.h"
#import "LCRootViewController.h"
#import "RTRootNavigationController.h"
@interface LCNavigationStackService () 

@end

@implementation LCNavigationStackService
-(instancetype)init{
    if (self = [super init]) {
        self.navigationControllers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)pushNavigationController:(UINavigationController *)navigationController
{
    if ([self.navigationControllers containsObject:navigationController]) return;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController
{
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}

- (UINavigationController *)topNavigationController
{
    return self.navigationControllers.lastObject;
}

//这个是导航的 真正跳转的方法.
- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated{
    UIViewController *viewController = (UIViewController *)[[KDRouter sharedKDRouter]viewControllerForViewModel:viewModel];
    [self.navigationControllers.lastObject pushViewController:viewController animated:animated];
}

- (void)popViewModelAnimated:(BOOL)animated{
    [self.navigationControllers.lastObject popViewControllerAnimated:animated];
}

/**
 *  pop到倒数第几view controller
 */
- (void)popToBeforeViewModelWithNum:(NSInteger)num animated:(BOOL)animated complete:(void(^)(BOOL finished))block{
    RTRootNavigationController *navigationController = self.navigationControllers.lastObject;
    NSInteger index = navigationController.rt_viewControllers.count-1-1;
    UIViewController *viewController = navigationController.rt_viewControllers[index];
    [navigationController popToViewController:viewController animated:animated complete:block];
}

- (void)popToRootViewModelAnimated:(BOOL)animated{
    [self.navigationControllers.lastObject popToRootViewModelAnimated:animated];
}

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(void(^)())completion{
    UIViewController *viewController = (UIViewController *)[[KDRouter sharedKDRouter]viewControllerForViewModel:viewModel];
    UINavigationController *presentingViewController = self.navigationControllers.lastObject;
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        viewController = [[RTRootNavigationController alloc] initWithRootViewController:viewController];
    }
    [self pushNavigationController:(UINavigationController *)viewController];
    [presentingViewController presentViewController:viewController animated:animated completion:completion];

}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void(^)())completion{
    [self.navigationControllers.lastObject dismissViewModelAnimated:animated completion:completion];
}

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(BaseViewModel *)viewModel{
    [self.navigationControllers removeAllObjects];
    UIViewController *viewController = (UIViewController *)[[KDRouter sharedKDRouter] viewControllerForViewModel:viewModel];
    
    if (![viewController isKindOfClass:[UINavigationController class]] && ![viewController isKindOfClass:[LCRootViewController class]]) {
        viewController = [[RTRootNavigationController alloc]initWithRootViewController:viewController];
        [self pushNavigationController:(UINavigationController *)viewController];
    }
    kSharedAppDelegate.window.rootViewController = viewController;
}

@end

































