//
//  LCMoreTeacherViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMoreTeacherViewController.h"
#import "LCMoreTeacherViewModel.h"
#import "LCTeacherCell.h"
@interface LCMoreTeacherViewController ()
@property(nonatomic,strong) LCMoreTeacherViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCTeacherCell";

@implementation LCMoreTeacherViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    backImageView.image = [UIImage imageNamed:@"teacher_back_image"];
    [self.view addSubview:backImageView];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCTeacherCell class] forCellReuseIdentifier:identifier];
    self.tableView.tableFooterView = [UIView new];
    
    [super viewDidLoad];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.topVerticalLineView.hidden = YES;
    }
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCTeacherCellViewModel *cellViewM = self.viewModel.dataSource[indexPath.row];
    return cellViewM.teacherCellTotal_h;
}


@end
