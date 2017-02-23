//
//  LCDaiJinQuanViewController.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCDaiJinQuanViewController.h"
#import "LCDaiJinQuanViewModel.h"

#import "LCPublicVoucherCell.h"
@interface LCDaiJinQuanViewController ()
@property(nonatomic,strong) LCDaiJinQuanViewModel *viewModel;
@end

static NSString * const identiFier = @"LCPublicVoucherCell";

@implementation LCDaiJinQuanViewController
@dynamic viewModel;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-39) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCPublicVoucherCell class] forCellReuseIdentifier:identiFier];
    self.tableView.rowHeight = 95;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [super viewDidLoad];
    self.tableView.backgroundColor = [KDColor getC9Color];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCPublicVoucherCell *cell = [tableView dequeueReusableCellWithIdentifier:identiFier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
