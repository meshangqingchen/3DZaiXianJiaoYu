//
//  LCNavigationStackService.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNavigationStackService.h"

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
@end
