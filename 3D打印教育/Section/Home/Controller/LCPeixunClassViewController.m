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
//#import "LCAboutYYWebImage.h"
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
