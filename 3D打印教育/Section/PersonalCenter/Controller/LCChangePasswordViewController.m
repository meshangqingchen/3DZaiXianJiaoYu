//
//  LCChangePasswordViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCChangePasswordViewController.h"
#import "LCChangePasswordViewModel.h"

#import "LCChangePasswordCell.h"


@interface LCChangePasswordViewController ()
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCChangePasswordViewModel *viewModel;

@end

static NSString *identifier = @"LCChangePasswordCell";
static NSString *identifierHeader = @"UITableViewHeaderFooterView";


@implementation LCChangePasswordViewController
@dynamic tableView,viewModel;

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC19Color];
    self.tableView.rowHeight = 35;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCChangePasswordCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:identifierHeader];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    
    [super viewDidLoad];
 }



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCChangePasswordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
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
