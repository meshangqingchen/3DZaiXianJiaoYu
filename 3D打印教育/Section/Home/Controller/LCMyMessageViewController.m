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
        self.itemsMargins = @[@35,@50,@50,@35];
        self.viewFrame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        self.keys = [self getKeys];
        self.values = [self getValues];
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


@end
