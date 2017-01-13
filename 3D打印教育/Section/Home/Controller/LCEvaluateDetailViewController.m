//
//  LCEvaluateDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/19.
//  Copyright © 2016年 3D. All rights reserved.
//  评论详情 没用了....

#import "LCEvaluateDetailViewController.h"
#import "LCEvaluateDetailViewModel.h"
#import "LCDetailEvaluateCell.h"
#import "LCEvaluateDetailCellViewModel.h"

#import "LCDetailEvaluateHeaderView.h"
#import "LCDetailEvaluateHeaderViewModel.h"

#import "LCDetailEvaluateBottomView.h"
#import "LCDetailEvaluateInputAccessoryView.h"

#import "UINavigationItem+CustomItem.h"
@interface LCEvaluateDetailViewController ()
@property(nonatomic,strong) LCEvaluateDetailViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCDetailEvaluateInputAccessoryView *lcInputAccessoryView;
@property(nonatomic,strong) LCDetailEvaluateBottomView *bottomView;
@property(nonatomic,strong) UIView *backView;

@end

static NSString *identifier = @"LCDetailEvaluateCell";

@implementation LCEvaluateDetailViewController
@dynamic viewModel,tableView;

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCDetailEvaluateCell class] forCellReuseIdentifier:identifier];
    
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_backView];
    _backView.backgroundColor = [KDColor getC10Color];
    _backView.hidden = YES;
    
    
    
    self.lcInputAccessoryView = [[LCDetailEvaluateInputAccessoryView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 276/2)];
    [self.view addSubview:_lcInputAccessoryView];
    
    self.bottomView = [[LCDetailEvaluateBottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    [self.view addSubview:_bottomView];
    
    
    @weakify(self)
    [self.bottomView.pinlunBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.lcInputAccessoryView.textView becomeFirstResponder];
    }];
    
    
    
    //给头赋值数据
    [self.viewModel setHeaderViewBindViewModel:^(id viewModel) {
        LCDetailEvaluateHeaderViewModel *headerVM = viewModel;
        LCDetailEvaluateHeaderView *headerView = [LCDetailEvaluateHeaderView new];
        headerView.size = CGSizeMake(SCREEN_WIDTH, headerVM.headerView_H);
        @strongify(self)
        [headerView bindViewModel:viewModel];
        self.tableView.tableHeaderView = headerView;
    }];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //添加对键盘弹起的监听
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    //添加对键盘收起的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    [center addObserver:self selector:@selector(changeKeyboard:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UIImage *have_image = [UIImage imageNamed:@"have_message"];
    
    CustomBarItem *rightItem = [[UINavigationItem alloc]setItemWithImage:@"have_message" size:have_image.size itemType:right];
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        //        [self.view endEditing:YES];
        //        [self.viewModel.navigationStackService popViewModelAnimated:YES];
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)openKeyboard:(NSNotification *)notification
{
    _backView.hidden = NO;
}

-(void)closeKeyboard:(NSNotification *)notification
{
    _backView.hidden = YES;
}

-(void)changeKeyboard:(NSNotification *)notification
{
    MYLog(@"=====%@",notification.userInfo);
    NSLog(@"====");
    //键盘高度
    CGFloat keyBoard_Y = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        if (keyBoard_Y == SCREEN_HEIGHT) {
            self.lcInputAccessoryView.top = keyBoard_Y;
        }else{
            self.lcInputAccessoryView.top = keyBoard_Y-276/2;
        }
    } completion:nil];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCDetailEvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCEvaluateDetailCellViewModel *evaDetailCellVM = self.viewModel.dataSource[indexPath.row];
    return evaDetailCellVM.cell_H;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
