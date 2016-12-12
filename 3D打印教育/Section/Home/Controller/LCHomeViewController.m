//
//  LCHomeViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeViewController.h"
#import "LCHomeViewModel.h"
@interface LCHomeViewController ()
@property(nonatomic,strong) LCHomeViewModel *viewModel;
@end

@implementation LCHomeViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
