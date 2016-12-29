//
//  LCCourseDownLoadViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseDownLoadViewController.h"
#import "LCCourseDownLoadViewModel.h"

#import "LCCourseDownLoadCell.h"
#import "LCCourseDownLoadHeaderView.h"

@interface LCCourseDownLoadViewController ()
@property(nonatomic,strong) LCCourseDownLoadViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UILabel *freeLB;
@end

static NSString *identifier = @"LCCourseDownLoadCell";

@implementation LCCourseDownLoadViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    [self.view addSubview:topView];
    UILabel *LB = [UILabel new];
    [topView addSubview:LB];
    LB.text = @"课程下载管理";
    LB.textColor = [KDColor getC3Color];
    LB.font = [[KDFont sharedKDFont]getF30Font];
    [LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
    
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float freespace =   [[fattributes objectForKey:NSFileSystemFreeSize] floatValue];
    float free_m =  freespace / 1024 / 1024 / 1024;

    UILabel *LB1 = [UILabel new];
    self.freeLB = LB1;
    [topView addSubview:LB1];
    LB1.text = [NSString stringWithFormat:@"可用空间%.2fG",free_m];
    LB1.textColor = [KDColor getX0Color];
    LB1.font = [[KDFont sharedKDFont]getF30Font];
    [LB1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LB.mas_right).mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC7Color];
    [topView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *bt = [UIButton new];
    [topView addSubview:bt];
    bt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [bt setImage:[UIImage imageNamed:@"danjiantou"] forState:0];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(50);
        make.top.bottom.mas_equalTo(0);
    }];
    @weakify(self)
    [bt addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        MYLog(@"跳转界面");
    }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40, SCREEN_WIDTH, SCREEN_HEIGHT - 64-40) style:UITableViewStylePlain];
    self.tableView.rowHeight = 40;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCCourseDownLoadCell class] forCellReuseIdentifier:identifier];
    self.tableView.tableFooterView = [UIView new];
    LCCourseDownLoadHeaderView *headerView = [[LCCourseDownLoadHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    self.tableView.tableHeaderView = headerView;
    [self.viewModel setHeaderViewBindViewModel:^(id viewModel) {
        headerView.titleLB.text = @"给headerView的title赋值";
    }];
    
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float freespace =   [[fattributes objectForKey:NSFileSystemFreeSize] floatValue];
    float free_m =  freespace / 1024 / 1024 / 1024;
    self.freeLB.text = [NSString stringWithFormat:@"可用空间%.2fG",free_m];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCCourseDownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

@end
