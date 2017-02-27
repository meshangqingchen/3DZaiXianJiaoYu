//
//  LCMemberViewController.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//  会员中心

#import "LCMemberViewController.h"
#import "LCMemberViewModel.h"
#import "LCMemberCell.h"
#import "LCMemberTopCell.h"
#import "LCMemberFootView.h"
@interface LCMemberViewController ()
@property(nonatomic,strong) LCMemberViewModel *viewModel;

@end

//static NSString *identifier = @"LCSetingCell"
static  NSString *identifier = @"LCMemberCell";
static  NSString *identifiertop = @"LCMemberTopCell";

@implementation LCMemberViewController
@dynamic viewModel;
- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCMemberCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[LCMemberTopCell class] forCellReuseIdentifier:identifiertop];
    self.tableView.tableFooterView = [[LCMemberFootView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    [super viewDidLoad];
    self.tableView.backgroundColor = [KDColor getC19Color];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ((indexPath.row == 0) & isMember) {
        LCMemberTopCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiertop forIndexPath:indexPath];
        return cell;
    }
    LCMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.row == 0) & isMember) {
        return 164;
    }
    return 44;
}

@end
