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
@interface LCPersonalCenterViewController ()
@property(nonatomic,strong) LCPersonalCenterViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCPersonalCenterCell";

@implementation LCPersonalCenterViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.rowHeight = 35;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCPersonalCenterCell class] forCellReuseIdentifier:identifier];
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
    LCPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSArray *setionArr = self.viewModel.dataSource[indexPath.section];
    [cell bindViewModel:setionArr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}


@end
