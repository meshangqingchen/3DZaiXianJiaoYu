//
//  LCMySelfMainViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMySelfMainViewController.h"
#import "LCMySelfMainViewModel.h"

#import "LCMySelfMainCell.h"
#import "LCMySelfMainCellViewModel.h"
#import "LCMySelfMainHeaderView.h"

@interface LCMySelfMainViewController ()
@property(nonatomic,strong) LCMySelfMainViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCMySelfMainCell";

@implementation LCMySelfMainViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    LCMySelfMainHeaderView *headerView = [[LCMySelfMainHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/75*39)];
    self.tableView.tableHeaderView = headerView;
    [self.tableView registerClass:[LCMySelfMainCell class] forCellReuseIdentifier:identifier];
//    @weakify(self)
    [self.viewModel setBindViewModel:^(id model) {
        [headerView bindViewModel:@"我是nickName"];
    }];
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCMySelfMainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCMySelfMainCellViewModel *cellVM = self.viewModel.dataSource[indexPath.row];
    return cellVM.cell_H;
}


@end
