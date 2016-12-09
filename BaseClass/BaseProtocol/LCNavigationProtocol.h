//
//  LCNavigationProtocol.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@protocol LCNavigationProtocol <NSObject>
- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewModelAnimated:(BOOL)animated;

/**
 *  pop到倒数第几view controller
 */
- (void)popToBeforeViewModelWithNum:(NSInteger)num animated:(BOOL)animated complete:(void(^)(BOOL finished))block;

- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(void(^)())completion;

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void(^)())completion;

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(BaseViewModel *)viewModel;

@end
