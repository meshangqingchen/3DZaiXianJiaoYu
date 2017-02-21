//
//  LCZheKouQuanViewController.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCZheKouQuanViewController.h"
#import "LCZheKouQuanViewModel.h"

#import "LCPublicVoucherCell.h"
@interface LCZheKouQuanViewController ()
@property(nonatomic,strong) LCZheKouQuanViewModel *viewModel;
@end

static NSString * const identiFier = @"LCPublicVoucherCell";

@implementation LCZheKouQuanViewController
@dynamic viewModel;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-39) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCPublicVoucherCell class] forCellReuseIdentifier:identiFier];
    self.tableView.rowHeight = 95;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [super viewDidLoad];
    self.tableView.backgroundColor = [KDColor getC9Color];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCPublicVoucherCell *cell = [tableView dequeueReusableCellWithIdentifier:identiFier forIndexPath:indexPath];
    
    return cell;
}


@end
