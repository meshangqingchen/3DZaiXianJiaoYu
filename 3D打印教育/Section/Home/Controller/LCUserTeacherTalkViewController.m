//
//  LCUserTeacherTalkViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCUserTeacherTalkViewController.h"
#import "LCUserTeacherTalkViewModel.h"

#import "LCFromUserCell.h"
#import "LCFromTeacherCell.h"
#import "LCUserTeacherTalkCellViewModel.h"

#import "LCUserTeacherTalkBottomView.h"

@interface LCUserTeacherTalkViewController ()<YYTextViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCUserTeacherTalkViewModel *viewModel;
@property(nonatomic,strong) LCUserTeacherTalkBottomView *bottomView;
@end

static NSString *identifierUser = @"LCFromUserCell";
static NSString *identifierTeacher = @"LCFromTeacherCell";

@implementation LCUserTeacherTalkViewController
@dynamic tableView,viewModel;

- (void)viewDidLoad {

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC9Color];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LCFromUserCell class] forCellReuseIdentifier:identifierUser];
    [self.tableView registerClass:[LCFromTeacherCell class] forCellReuseIdentifier:identifierTeacher];
   
    
    UILabel *bottomLB = [UILabel new];
    bottomLB.text = @"老师收到消息后,会及时作出回复";
    bottomLB.textAlignment = NSTextAlignmentCenter;
    bottomLB.textColor = [KDColor getC3Color];
    bottomLB.font = [[KDFont sharedKDFont]getF22Font];
    bottomLB.backgroundColor = [KDColor getC14Color];
    bottomLB.layer.cornerRadius = 4;
    bottomLB.layer.masksToBounds = YES;
    [self.view addSubview:bottomLB];
    [bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-59);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(200);
    }];
    
    LCUserTeacherTalkBottomView *bottomView = [LCUserTeacherTalkBottomView new];
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    
    @weakify(self)
    [bottomView.fasongBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
//        bottomView.backgroundColor = [UIColor yellowColor];
        self.view.backgroundColor = [UIColor yellowColor];
    }];
    
    
    
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //添加对键盘弹起的监听
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    //添加对键盘收起的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    [center addObserver:self selector:@selector(changeKeyboard:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)openKeyboard:(NSNotification *)notification
{
   
}

-(void)closeKeyboard:(NSNotification *)notification
{

}

-(void)changeKeyboard:(NSNotification *)notification
{
    MYLog(@"=====%@",notification.userInfo);
    NSLog(@"====");
    //键盘高度
    CGFloat keyBoard_H = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyBoard_H);
    }];
    
    
//    - (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
    
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCUserTeacherTalkCellViewModel *cellVM = self.viewModel.dataSource[indexPath.row];
    if (cellVM.fromWho == fromUser) {
        LCFromUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierUser forIndexPath:indexPath];
        [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
        return cell;
 
    }else{
        LCFromTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierTeacher forIndexPath:indexPath];
        [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCUserTeacherTalkCellViewModel *cellVM = self.viewModel.dataSource[indexPath.row];
    return cellVM.cell_H;
}
@end
