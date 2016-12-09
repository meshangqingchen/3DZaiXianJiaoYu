//
//  LCNavigationStackService.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNavigationStackService.h"
#import "LCNavigationProtocol.h"
@interface LCNavigationStackService () <LCNavigationProtocol>

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

}

- (void)popViewModelAnimated:(BOOL)animated{

}

/**
 *  pop到倒数第几view controller
 */
- (void)popToBeforeViewModelWithNum:(NSInteger)num animated:(BOOL)animated complete:(void(^)(BOOL finished))block{

}

- (void)popToRootViewModelAnimated:(BOOL)animated{

}

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(void(^)())completion{

}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void(^)())completion{

}

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(BaseViewModel *)viewModel{

}

@end
