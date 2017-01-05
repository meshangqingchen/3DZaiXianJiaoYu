//
//  LCMyCourseViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMyCourseViewController.h"
#import "LCMyCourseViewModel.h"

#import "LCMyCourseCell.h"
@interface LCMyCourseViewController ()
@property(nonatomic,strong) LCMyCourseViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCMyCourseCell";

@implementation LCMyCourseViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+44, SCREEN_WIDTH, SCREEN_HEIGHT-64-49-44) style:UITableViewStylePlain];
    self.tableView.rowHeight = 90;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCMyCourseCell class] forCellReuseIdentifier:identifier];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 39)];
    backView.backgroundColor = [KDColor getC5Color];
    [headerView addSubview:backView];
    
    UILabel *downloadCourse = [UILabel new];
    downloadCourse.text =@"已下载课程";
    downloadCourse.font = [[KDFont sharedKDFont]getF28Font];
    downloadCourse.textColor = [KDColor getX0Color];
    [backView addSubview:downloadCourse];
    [downloadCourse mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
    
    UIButton *bt = [UIButton new];
    [bt setImage:[UIImage imageNamed:@"danjiantou"] forState:0];
    bt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backView addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    
    [self.view addSubview:headerView];
    [super viewDidLoad];
    
    
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCMyCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}



@end
