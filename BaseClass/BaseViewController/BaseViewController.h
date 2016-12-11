//
//  BaseViewController.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"
@interface BaseViewController : UIViewController
@property (nonatomic, strong, readonly) BaseViewModel *viewModel;
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;
- (void)bindViewModel;

@end
