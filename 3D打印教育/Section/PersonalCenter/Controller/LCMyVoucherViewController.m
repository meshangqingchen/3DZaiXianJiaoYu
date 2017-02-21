//
//  LCMyVoucherViewController.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMyVoucherViewController.h"
#import "LCVoucherViewModel.h"

#import "LCDaiJinQuanViewController.h"
#import "LCDaiJinQuanViewModel.h"

#import "LCZheKouQuanViewController.h"
#import "LCZheKouQuanViewModel.h"
@interface LCMyVoucherViewController ()
@property(nonatomic,strong) LCVoucherViewModel *viewModel;
@end

@implementation LCMyVoucherViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
}

-(instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super initWithViewModel:viewModel]) {
        self.viewControllerClasses = @[[LCDaiJinQuanViewController class],[LCZheKouQuanViewController class]];
        self.titles = @[@"代金券",@"折扣券"];
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
        
//        //设置红圈上标
//        self.menuView.dataSource = self;
    }
    return self;
}

- (NSMutableArray *)getKeys
{
    return [@[@"viewModel", @"viewModel"] mutableCopy];
}

- (NSMutableArray *)getValues{
    LCDaiJinQuanViewModel *DIViewModel = [[LCDaiJinQuanViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    LCZheKouQuanViewModel *ZKViewModel = [[LCZheKouQuanViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    return [@[DIViewModel,ZKViewModel] mutableCopy];
}

-(void)dealloc{
    
    NSLog(@"======");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
