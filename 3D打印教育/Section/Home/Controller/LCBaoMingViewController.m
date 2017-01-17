//
//  LCBaoMingViewController.m
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBaoMingViewController.h"
#import "LCBaoMingViewModel.h"
#import "LCBaoMingLBCell.h"
#import "LCBaoMingTFCell.h"
#import "LCBaoMingFooterView.h"
#import "UINavigationItem+CustomItem.h"
@interface LCBaoMingViewController ()

@property(nonatomic,strong) LCBaoMingViewModel  *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCBaoMingFooterView *baoMingFotterView;
@end

static NSString *LCBaoMingLBCellIdf = @"LCBaoMingLBCell";
static NSString *LCBaoMingTFCellIdf = @"LCBaoMingTFCell";
@implementation LCBaoMingViewController

@dynamic viewModel,tableView;

- (void)viewDidLoad {


    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    
    self.tableView.rowHeight = 145/2;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCBaoMingLBCell class] forCellReuseIdentifier:LCBaoMingLBCellIdf];
    [self.tableView registerClass:[LCBaoMingTFCell class] forCellReuseIdentifier:LCBaoMingTFCellIdf];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.baoMingFotterView;
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CustomBarItem *rightBarItem = [self.navigationItem setItemWithTitle:@"提交" textColor:[KDColor getC0Color] fontSize:15 itemType:right];
    @weakify(self)
    [rightBarItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        [self.view endEditing:YES];
        [self.viewModel networkPresent];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0 | indexPath.row == 2 | indexPath.row == 6 | indexPath.row == 3) {
        LCBaoMingLBCell *cell = [tableView dequeueReusableCellWithIdentifier:LCBaoMingLBCellIdf forIndexPath:indexPath];
        [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
        return cell;
    }
    
    LCBaoMingTFCell *cell = [tableView dequeueReusableCellWithIdentifier:LCBaoMingTFCellIdf forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    
    cell.TextFiledDidEndDding = self.viewModel.TextFiledDidEndDding;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
}

- (LCBaoMingFooterView *)baoMingFotterView {
	if(_baoMingFotterView == nil) {
		_baoMingFotterView = [[LCBaoMingFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
        _baoMingFotterView.TextViewDidEndDding = self.viewModel.TextViewDidEndDding;
	}
	return _baoMingFotterView;
}

@end
