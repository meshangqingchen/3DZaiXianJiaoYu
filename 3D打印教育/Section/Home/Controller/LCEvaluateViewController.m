//
//  LCEvaluateViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateViewController.h"
#import "LCEvaluateViewModel.h"
@interface LCEvaluateViewController ()
@property(nonatomic,strong) LCEvaluateViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation LCEvaluateViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
    }];
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC6Color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
