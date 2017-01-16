//
//  LCCounselTeacherViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCounselTeacherViewController.h"
#import "LCCounselTeacherViewModel.h"
#import "LCCounseTeacherCell.h"

@interface LCCounselTeacherViewController ()
@property(nonatomic,strong) LCCounselTeacherViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCCounseTeacherCell";


@implementation LCCounselTeacherViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 90;
    self.tableView.backgroundColor = [KDColor getC19Color];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCCounseTeacherCell class] forCellReuseIdentifier:identifier];

    [super viewDidLoad];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCCounseTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}


@end
