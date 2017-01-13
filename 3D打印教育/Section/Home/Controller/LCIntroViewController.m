//
//  LCIntroViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCIntroViewController.h"
#import "LCIntroViewModel.h"
#import "LCIntroView.h"
@interface LCIntroViewController ()
@property(nonatomic,strong) LCIntroViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scroView;
@property(nonatomic,strong) LCIntroView *introView;
@end

@implementation LCIntroViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [KDColor getC6Color];
    
    self.scroView = [UIScrollView new];
    _scroView.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:_scroView];
    [_scroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
    }];
    
    _introView = [[LCIntroView alloc]init];
    _introView.backgroundColor = [KDColor getC0Color];
    [_scroView addSubview:_introView];
    [_introView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    
    @weakify(self)
    [self.viewModel setBindViewModel:^(id viewModel) {
        @strongify(self)
        [self.introView bindViewModel:viewModel];
    }];
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
