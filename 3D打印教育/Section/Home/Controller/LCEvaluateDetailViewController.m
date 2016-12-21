//
//  LCEvaluateDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/19.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateDetailViewController.h"
#import "LCEvaluateDetailViewModel.h"
#import "LCDetailEvaluateCell.h"
#import "LCEvaluateDetailCellViewModel.h"

@interface LCEvaluateDetailViewController ()
@property(nonatomic,strong) LCEvaluateDetailViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCDetailEvaluateCell";

@implementation LCEvaluateDetailViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCDetailEvaluateCell class] forCellReuseIdentifier:identifier];
    
    [super viewDidLoad];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCDetailEvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCEvaluateDetailCellViewModel *evaDetailCellVM = self.viewModel.dataSource[indexPath.row];
    return evaDetailCellVM.cell_H;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
