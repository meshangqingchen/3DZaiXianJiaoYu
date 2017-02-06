//
//  LCCollectOJoinRViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCollectOJoinRViewController.h"
#import "LCCollectOJoinRViewModel.h"
#import "LCCollectOrJoinCourseCell.h"
@interface LCCollectOJoinRViewController ()
@property(nonatomic,strong) LCCollectOJoinRViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCCollectOrJoinCourseCell";

@implementation LCCollectOJoinRViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 95;
    self.tableView.backgroundColor = [KDColor getC19Color];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCCollectOrJoinCourseCell class] forCellReuseIdentifier:identifier];
    
    [super viewDidLoad];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;//self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCCollectOrJoinCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}
@end
