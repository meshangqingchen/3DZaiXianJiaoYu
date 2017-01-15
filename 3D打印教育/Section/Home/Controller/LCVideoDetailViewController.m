//
//  LCVideoDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailViewController.h"
#import "LCVideoDetailViewModel.h"
#import "LCVideoDetailViewViewModel.h"

#import "LCIntroViewModel.h"
#import "LCCourseViewModel.h"
#import "LCEvaluateViewModel.h"

#import "LCIntroViewController.h"
#import "LCCourseViewController.h"
#import "LCEvaluateViewController.h"
//下面的tabbar
#import "LCVideoDetailTabBar.h"
#import "LCDetailEvaluateInputAccessoryView.h"
@interface LCVideoDetailViewController ()
@property(nonatomic,strong) LCVideoDetailViewModel *viewModel;
@property(nonatomic,strong) LCDetailEvaluateInputAccessoryView *lcInputAccessoryView;
@property(nonatomic,strong) UIView *backView;

@property(nonatomic,strong) LCIntroViewModel *IntroViewModel;
@property(nonatomic,strong) LCCourseViewModel *courseViewModel;
@end

@implementation LCVideoDetailViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    /*
     视频view
     */
    UIView *videoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIDEO_H)];
    videoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:videoView];
    
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_backView];
    _backView.backgroundColor = [KDColor getC10Color];
    _backView.hidden = YES;

    self.lcInputAccessoryView = [[LCDetailEvaluateInputAccessoryView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 276/2+30)];
    [self.view addSubview:_lcInputAccessoryView];
    @weakify(self)
    [self.viewModel setPopLcInputAccessoryView:^(NSString *videoID) {
        @strongify(self)
        [self.lcInputAccessoryView.textView becomeFirstResponder];
    }];
    [self.lcInputAccessoryView.fasongBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.sendPingLun ? : self.viewModel.sendPingLun(self.viewModel.planID,self.lcInputAccessoryView.textView.text,self.lcInputAccessoryView.starView.count);
        [self.lcInputAccessoryView.textView resignFirstResponder];
    }];
    
    LCVideoDetailTabBar *tabbarView = [[LCVideoDetailTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    tabbarView.backgroundColor = [KDColor getC5Color];
    [self.view addSubview:tabbarView];
    
    //给tabBar传输数据 判断是否 用户收藏了
    [self.viewModel setBindViewModel:^(LCVideoDetailViewViewModel *videoDetailVideModel) {
        [tabbarView bindViewModel:videoDetailVideModel];
    }];
    
    [self.viewModel setChuanShuData:^(id model) {
        @strongify(self)
        !self.IntroViewModel.fromVideoVMGetData ? : self.IntroViewModel.fromVideoVMGetData(model);
        !self.courseViewModel.fromVideoVMGetData ? : self.courseViewModel.fromVideoVMGetData(model);
    }];
    
    //网络请求
    !self.viewModel.networkRequests ? : self.viewModel.networkRequests(self.viewModel.planID);
    
}

-(instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super initWithViewModel:viewModel]) {
        self.viewControllerClasses = @[[LCIntroViewController class],[LCCourseViewController class],[LCEvaluateViewController class]];
        self.titles = @[@"简介",@"课程",@"评论"];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuBGColor = [KDColor getC5Color];
        self.menuHeight = 39;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 17;
        self.titleColorNormal = [KDColor getC2Color];
        self.titleColorSelected = [KDColor getX1Color];
        self.itemsMargins = @[@35,@50,@50,@35];
        self.viewFrame = CGRectMake(0, VIDEO_H, SCREEN_WIDTH, SCREEN_HEIGHT-VIDEO_H-49);
        self.keys = [self getKeys];
        self.values = [self getValues];
    }
    return self;
}

- (NSMutableArray *)getKeys
{
    return [@[@"viewModel", @"viewModel",@"viewModel"] mutableCopy];
}

- (NSMutableArray *)getValues{
    //简介VM
    LCIntroViewModel *IntroViewModel = [[LCIntroViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    self.IntroViewModel = IntroViewModel;
    //课程VM
    LCCourseViewModel *courseViewModel = [[LCCourseViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    self.courseViewModel = courseViewModel;
    
    LCEvaluateViewModel *evaluateViewModel = [[LCEvaluateViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    return [@[IntroViewModel,courseViewModel,evaluateViewModel] mutableCopy];
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
    _backView.hidden = NO;
}

-(void)closeKeyboard:(NSNotification *)notification
{
    _backView.hidden = YES;
}

-(void)changeKeyboard:(NSNotification *)notification
{
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
            self.lcInputAccessoryView.top = keyBoard_Y-(276/2+30);
        }
    } completion:nil];
}


@end
