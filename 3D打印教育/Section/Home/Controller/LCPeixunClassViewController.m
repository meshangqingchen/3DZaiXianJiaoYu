//
//  LCPeixunClassViewController.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPeixunClassViewController.h"
#import "LCPiexunClassViewModel.h"
#import "LCPeixunClassCell.h"
#import "UINavigationItem+CustomItem.h"
#import "LCZaiXianZiXunViewModel.h"
@interface LCPeixunClassViewController ()
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCPiexunClassViewModel *viewModel;
@end

static NSString * const identifier = @"LCPeixunClassCell";

@implementation LCPeixunClassViewController
@dynamic tableView,viewModel;
- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCPeixunClassCell class] forCellReuseIdentifier:identifier];
    self.tableView.rowHeight = 135;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = [self creatheaderView];
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    CustomBarItem *rightItem = [self.navigationItem setItemWithTitle:@"资讯" textColor:[KDColor getC0Color] fontSize:15 itemType:right];
    
    CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"zixunkefu" size:CGSizeMake(22, 22) itemType:right];
    [rightItem  addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        LCZaiXianZiXunViewModel *zixunVM = [[LCZaiXianZiXunViewModel alloc]initWithServices:self.viewModel.navigationStackService params:@{KEY_TITLE:@"在线资讯"}];
        [self.viewModel.navigationStackService pushViewModel:zixunVM animated:YES];
    }];
}

-(UIView *)creatheaderView{
    UIView *hview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/75*30)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/75*30)];
    imageView.image = [UIImage imageNamed:@"PeixunTou"];
    [hview addSubview:imageView];
    return hview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCPeixunClassCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}
@end
