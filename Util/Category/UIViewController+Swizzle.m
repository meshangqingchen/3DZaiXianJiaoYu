//
//  UIViewController+Swizzle.m
//  PetAnimals
//
//  Created by bigdata on 16/8/12.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "ObjcRuntime.h"
#import "RDVTabBarController.h"
#import "KDRouter.h"


@implementation UIViewController (Swizzle)

- (void)customViewWillAppear:(BOOL)animated{
    if ([[self.navigationController childViewControllers] count] > 1) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
//        MYLog(@"setTabBarHidden:YES --- customviewWillAppear : %@", NSStringFromClass([self class]));
    }
    [self customViewWillAppear:animated];
}

- (void)customViewDidAppear:(BOOL)animated{
    if ([[KDRouter sharedKDRouter].rootViewControllers containsObject:NSStringFromClass([self class])] ) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
//        MYLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    [self customViewDidAppear:animated];
}

+ (void)load{
    swizzleAllViewController();
}
@end

void swizzleAllViewController()
{
    Swizzle([UIViewController class], @selector(viewDidAppear:), @selector(customViewDidAppear:));
    Swizzle([UIViewController class], @selector(viewWillAppear:), @selector(customViewWillAppear:));
}