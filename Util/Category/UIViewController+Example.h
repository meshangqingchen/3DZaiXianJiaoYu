//
//  UIViewController+Example.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/12.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Example)
@property (copy, nonatomic) NSString *method;
+ (UIViewController *)hsm_currentViewController;
@end
