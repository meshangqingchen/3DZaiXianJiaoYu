//
//  BaseCollectionViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "BaseCollectionViewModel.h"
@interface BaseCollectionViewController ()
@property(nonatomic,strong,readonly) BaseCollectionViewModel *viewModel;
@end

@implementation BaseCollectionViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
