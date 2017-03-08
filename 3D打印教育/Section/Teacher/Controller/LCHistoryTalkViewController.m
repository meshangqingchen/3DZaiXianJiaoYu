//
//  LCHistoryTalkViewController.m
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCHistoryTalkViewController.h"
#import "LCHistoryTalkViewModel.h"
#import "LCHistoryTeacherCell.h"
@interface LCHistoryTalkViewController ()

@property(nonatomic,strong) LCHistoryTalkViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;

@end

static NSString *identifier = @"LCHistoryTeacherCell";

@implementation LCHistoryTalkViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 90;
    self.tableView.backgroundColor = [KDColor getC19Color];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCHistoryTeacherCell class] forCellReuseIdentifier:identifier];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCHistoryTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
