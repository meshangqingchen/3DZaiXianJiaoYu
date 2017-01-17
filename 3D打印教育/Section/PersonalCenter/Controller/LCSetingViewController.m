//
//  LCSetingViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSetingViewController.h"
#import "LCSetingViewModel.h"

#import "LCSetingCell.h"
@interface LCSetingViewController ()
@property(nonatomic,strong) LCSetingViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCSetingCell";
static NSString *identifierHeader = @"UITableViewHeaderFooterView";

@implementation LCSetingViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC19Color];
    self.tableView.rowHeight = 35;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCSetingCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:identifierHeader];
    
    
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    [super viewDidLoad];

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *setionArr = self.viewModel.dataSource[section];
    return setionArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSArray *setionArr = self.viewModel.dataSource[indexPath.section];
    [cell bindViewModel:setionArr[indexPath.row] AndIndexPath:indexPath];
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
    return 15;
}


@end
