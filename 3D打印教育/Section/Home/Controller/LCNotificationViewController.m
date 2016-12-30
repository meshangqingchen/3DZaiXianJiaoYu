//
//  LCNotificationViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNotificationViewController.h"
#import "LCNotificationViewModel.h"

#import "LCNotificationCell.h"
#import "LCNotificationCellViewModel.h"
#import "LCMessageAndNotificationHeaderView.h"
@interface LCNotificationViewController ()
@property(nonatomic,strong) LCNotificationViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCNotificationCell";

@implementation LCNotificationViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT-64-3) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCNotificationCell class] forCellReuseIdentifier:identifier];
    //    self.tableView
    LCMessageAndNotificationHeaderView *headerView = [[LCMessageAndNotificationHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48)];
    [headerView.tagBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
    }];
    self.tableView.tableHeaderView = headerView;
    [self.viewModel setHeaderViewBindViewModel:^(id model) {
        [headerView bindViewModel:model];
    }];

    [super viewDidLoad];

    self.view.backgroundColor = [KDColor getC6Color];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCNotificationCellViewModel *notificationCellVM = self.viewModel.dataSource[indexPath.row];
    return notificationCellVM.cell_H;
}

@end
