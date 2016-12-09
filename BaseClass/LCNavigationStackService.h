//
//  LCNavigationStackService.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCNavigationStackService : NSObject
/// Pushes the navigation controller.
///
/// navigationController - the navigation controller
- (void)pushNavigationController:(UINavigationController *)navigationController;

/// Pops the top navigation controller in the stack.
///
/// Returns the popped navigation controller.
- (UINavigationController *)popNavigationController;

/// Retrieves the top navigation controller in the stack.
///
/// Returns the top navigation controller in the stack.
- (UINavigationController *)topNavigationController;

@property (nonatomic, strong) NSMutableArray *navigationControllers;
@end
