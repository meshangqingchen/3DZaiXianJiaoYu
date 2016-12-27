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
@interface LCCourseDownLoadViewController ()
@property(nonatomic,strong) LCCourseDownLoadViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCCourseDownLoadCell";

@implementation LCCourseDownLoadViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.rowHeight = 40;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCCourseDownLoadCell class] forCellReuseIdentifier:identifier];
    
    [super viewDidLoad];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCCourseDownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
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
