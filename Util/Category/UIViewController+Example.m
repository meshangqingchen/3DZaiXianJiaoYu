//
//  UIViewController+Example.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/12.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "UIViewController+Example.h"
#import <objc/runtime.h>

@implementation UIViewController (Example)

#pragma mark - swizzle
+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method1, method2);
}

- (void)deallocSwizzle
{
//    NSLog(@"%@被销毁了", self);
    
    [self deallocSwizzle];
}

static char MethodKey;
- (void)setMethod:(NSString *)method
{
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)method
{
    return objc_getAssociatedObject(self, &MethodKey);
}

//获取当前控制器
+ (UIViewController *)hsm_currentViewController
{
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    return [self hsm_topViewControllerForViewController:rootViewController];
}

+ (UIViewController *)hsm_topViewControllerForViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self hsm_topViewControllerForViewController:navigationController.visibleViewController];
    }
    
    if (rootViewController.presentedViewController) {
        return [self hsm_topViewControllerForViewController:rootViewController.presentedViewController];
    }
    return rootViewController;
}

@end
