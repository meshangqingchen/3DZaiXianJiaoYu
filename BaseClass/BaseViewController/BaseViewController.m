//
//  BaseViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong, readwrite) BaseViewModel *viewModel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super init]) {
        self.viewModel = viewModel;
        if (self.viewModel.title) {
            self.title = self.viewModel.title;
        }
    }
    return self;
}

- (void)bindViewModel{
//父类去实现
}

@end
