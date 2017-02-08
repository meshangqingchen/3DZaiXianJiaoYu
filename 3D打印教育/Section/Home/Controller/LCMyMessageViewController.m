//
//  LCMyMessageViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMyMessageViewController.h"
#import "LCMyMessageViewModel.h"

#import "LCMessageViewController.h"
#import "LCNotificationViewController.h"

#import "LCMessageViewModel.h"
#import "LCNotificationViewModel.h"
@interface LCMyMessageViewController ()
@property(nonatomic,strong) LCMyMessageViewModel *viewModel;
@end

@implementation LCMyMessageViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *tempView = [UIView new];
    [self.view addSubview:tempView];
    tempView.backgroundColor = [UIColor whiteColor];
    [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.top.mas_offset(64);
    }];
    
    UIImage *zanwushujuImage = [UIImage imageNamed:@"zanwushuju"];
    UIImageView *imageView = [UIImageView new];
    imageView.image = zanwushujuImage;
    [tempView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-60);
        make.size.mas_equalTo(zanwushujuImage.size);
    }];
    
    UILabel *label = [UILabel new];
    label.font = [[KDFont sharedKDFont] getF34Font];
    label.textColor = [KDColor getC3Color];
    label.text = @"暂无消息";
    [tempView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_bottom).mas_offset(10);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super initWithViewModel:viewModel]) {
        self.viewControllerClasses = @[[LCMessageViewController class],[LCNotificationViewController class]];
        self.titles = @[@"消息",@"通知"];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuBGColor = [KDColor getC5Color];
        self.menuHeight = 39;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 17;
        self.titleColorNormal = [KDColor getC2Color];
        self.titleColorSelected = [KDColor getX1Color];
        self.progressWidth = 100;
        self.viewFrame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        self.keys = [self getKeys];
        self.values = [self getValues];
        
        //设置红圈上标
        self.menuView.dataSource = self;
    }
    return self;
}

- (NSMutableArray *)getKeys
{
    return [@[@"viewModel", @"viewModel"] mutableCopy];
}

- (NSMutableArray *)getValues{
    LCMessageViewModel *IntroViewModel = [[LCMessageViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    LCNotificationViewModel *courseViewModel = [[LCNotificationViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    return [@[IntroViewModel,courseViewModel] mutableCopy];
}

//- (UIView *)menuView:(WMMenuView *)menu badgeViewAtIndex:(NSInteger)index;

- (UIView *)menuView:(WMMenuView *)menu badgeViewAtIndex:(NSInteger)index{
    UIImageView *redPointImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"red_point"]];
    redPointImageV.frame = CGRectMake(45, 7, 7, 7);
    return redPointImageV;
}
@end
