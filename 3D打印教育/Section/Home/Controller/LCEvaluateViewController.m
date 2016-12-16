//
//  LCEvaluateViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateViewController.h"
#import "LCEvaluateViewModel.h"
#import "LCVideoDetailEvaluateCell.h"

#import "LCEvaluateCellViewModel.h"
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
    
    [self.tableView registerClass:[LCVideoDetailEvaluateCell class] forCellReuseIdentifier:@"cell"];
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC6Color];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCVideoDetailEvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCEvaluateCellViewModel *CellviewModel = self.viewModel.dataSource[indexPath.row];
    return CellviewModel.cell_H;
}
@end
