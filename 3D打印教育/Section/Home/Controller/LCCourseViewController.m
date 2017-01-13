//
//  LCCourseViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseViewController.h"
#import "LCCourseViewModel.h"

#import "LCCourseCell.h"
#import "LCCourseSectionHeaderView.h"

#import "LCCourseCellViewModel.h"
//#import "LCCourseCellSonViewModel.h"
@interface LCCourseViewController ()
@property(nonatomic,strong) LCCourseViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCCourseCell";
//static NSString *headerIdentifier = @"LCCourseSectionHeaderView";

@implementation LCCourseViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 95;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
    }];
    
    [self.tableView registerClass:[LCCourseCell class] forCellReuseIdentifier:identifier];
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC6Color];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    LCCourseCellViewModel *cellViewModel = self.viewModel.dataSource[indexPath.row];
    [cell bindViewModel:cellViewModel];
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
