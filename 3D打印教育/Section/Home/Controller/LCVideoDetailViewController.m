//
//  LCVideoDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailViewController.h"
#import "LCVideoDetailViewModel.h"

#import "LCIntroViewModel.h"
#import "LCCourseViewModel.h"
#import "LCEvaluateViewModel.h"

#import "LCIntroViewController.h"
#import "LCCourseViewController.h"
#import "LCEvaluateViewController.h"
//下面的tabbar
#import "LCVideoDetailTabBar.h"
@interface LCVideoDetailViewController ()
@property(nonatomic,strong) LCVideoDetailViewModel *viewModel;
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
    
    LCVideoDetailTabBar *tabbarView = [[LCVideoDetailTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    tabbarView.backgroundColor = [KDColor getC5Color];
    [self.view addSubview:tabbarView];
    
    
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
/*
 #import "LCIntroViewModel.h"
 #import "LCCourseViewModel.h"
 #import "LCEvaluateViewModel.h"
 */
    LCIntroViewModel *IntroViewModel = [[LCIntroViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    LCCourseViewModel *courseViewModel = [[LCCourseViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    LCEvaluateViewModel *evaluateViewModel = [[LCEvaluateViewModel alloc]initWithServices:self.viewModel.navigationStackService params:nil];
    return [@[IntroViewModel,courseViewModel,evaluateViewModel] mutableCopy];
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
