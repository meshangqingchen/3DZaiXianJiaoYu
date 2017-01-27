//
//  LCUserTeacherTalkViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//
#import <IQKeyboardManager.h>
#import "LCUserTeacherTalkViewController.h"
#import "LCUserTeacherTalkViewModel.h"

#import "LCFromUserCell.h"
#import "LCFromTeacherCell.h"
#import "LCUserTeacherTalkCellViewModel.h"

#import "LCUserTeacherTalkBottomView.h"

@interface LCUserTeacherTalkViewController ()
<
YYTextViewDelegate,
UIGestureRecognizerDelegate //结局手势冲突
>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) LCUserTeacherTalkViewModel *viewModel;
@property(nonatomic,strong) LCUserTeacherTalkBottomView *bottomView;
@end

static NSString *identifierUser = @"LCFromUserCell";
static NSString *identifierTeacher = @"LCFromTeacherCell";

@implementation LCUserTeacherTalkViewController
@dynamic tableView,viewModel;

- (void)viewDidLoad {

    
    LCUserTeacherTalkBottomView *bottomView = [LCUserTeacherTalkBottomView new];
    bottomView.textView.delegate = self;
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
    }];
    @weakify(bottomView)
    [bottomView.fasongBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(bottomView)
        !self.viewModel.sendMassage ? : self.viewModel.sendMassage(bottomView.textView.text);
        bottomView.textView.text = nil;
    }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC9Color];
    [self.tableView registerClass:[LCFromUserCell class] forCellReuseIdentifier:identifierUser];
    [self.tableView registerClass:[LCFromTeacherCell class] forCellReuseIdentifier:identifierTeacher];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(64);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    
    self.tableView.tableFooterView = [UIView new];
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    panGR.delegate = self;
    [self.tableView addGestureRecognizer:panGR];
    
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
    
    @weakify(self)
    [self.viewModel setSendMassageSessed:^{
        @strongify(self)
        [self scrollToBottom];
    }];
    
    [super viewDidLoad];
}

-(void)scrollToBottom{
    if (self.viewModel.dataSource.count == 0) {
        return;
    }
    NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:self.viewModel.dataSource.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndex atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

-(void)pan:(UIPanGestureRecognizer *)gr
{
    // location:绝对位置,所有点都相对于self.view的左顶点的距离
    // translation：位移(位置的偏移量，所有点都相对于动作起点的距离)
//    CGPoint location = [gr locationInView:self.view];
    CGPoint translation = [gr translationInView:self.view];
    MYLog(@"%f",translation.y);
    if (translation.y >= 100) {
        [self.bottomView.textView resignFirstResponder];
    }
    
    if (translation.y <= -100){
        [self.bottomView.textView becomeFirstResponder];
    }
}
// 滑动手势 协议方法UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return YES;
    }
    return NO;
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
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.viewModel.dataSource.count-1 inSection:0];
//    CGRect cellRect = [self.tableView rectForRowAtIndexPath:indexPath];
    
    MYLog(@"=====%@",notification.userInfo);
    NSLog(@"====");
    //键盘的额Y坐标
    CGFloat keyBoardEND_Y = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-(SCREEN_HEIGHT-keyBoardEND_Y));
    }];
    
    CGFloat keyBoardBegin_Y= [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].origin.y;
    CGFloat change_Y = keyBoardBegin_Y - keyBoardEND_Y;
    NSLog(@"=========== %f",change_Y);
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view layoutIfNeeded];
//        self.tableView.contentOffset = CGPointMake(0, self.tableView.contentOffset.y + change_Y);
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

//改变textView的高度
- (void)textViewDidChange:(YYTextView *)textView{
    if (textView.textLayout.textBoundingSize.height > 35 & textView.textLayout.textBoundingSize.height < 80) {
        [self.bottomView.textView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo((textView.textLayout.textBoundingSize.height));
        }];
    }
    if ([textView.text isEqualToString:@""] || textView.text == nil) {
        [self.bottomView.textView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(35);
        }];
        self.bottomView.fasongBT.backgroundColor = [KDColor getC15Color];
    }else{
        self.bottomView.fasongBT.backgroundColor = [KDColor getC17Color];
    }
}


@end
