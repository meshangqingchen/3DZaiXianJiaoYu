//
//  LCPersonalCenterViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCPersonalCenterViewController.h"
#import "LCPersonalCenterViewModel.h"

#import "LCPersonalCenterCell.h"
#import "LCPersonalCenterHeaderView.h"
@interface LCPersonalCenterViewController ()
@property(nonatomic,strong) LCPersonalCenterViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCPersonalCenterCell";
static NSString *identifierHeader = @"UITableViewHeaderFooterView";

@implementation LCPersonalCenterViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC19Color];
    self.tableView.rowHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCPersonalCenterCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:identifierHeader];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    LCPersonalCenterHeaderView *headerView = [[LCPersonalCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    self.tableView.tableHeaderView = headerView;
    [self.viewModel setBindViewModel:^(id model) {
        [headerView bindViewModel:model];
    }];
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    !self.viewModel.networkRequestPersonalCenter ? : self.viewModel.networkRequestPersonalCenter();
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *setionArr = self.viewModel.dataSource[section];
    return setionArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSArray *setionArr = self.viewModel.dataSource[indexPath.section];
    [cell bindViewModel:setionArr[indexPath.row]];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifierHeader];
    header.contentView.backgroundColor = [KDColor getC19Color];
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

@end
