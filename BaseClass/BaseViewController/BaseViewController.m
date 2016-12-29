//
//  BaseViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationItem+CustomItem.h"
@interface BaseViewController ()
@property (nonatomic, strong, readwrite) BaseViewModel *viewModel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super init]) {
        self.viewModel = viewModel;
        if (self.viewModel.title) {
            self.title = self.viewModel.title;
        }
    }
    return self;
}

- (void)bindViewModel{
//父类去实现
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.viewModel.shouldNavBackItem) {
        CustomBarItem *leftItem = [self.navigationItem setItemWithImage:@"Myself_back_image" size:CGSizeMake(20, 26) itemType:left];
        [leftItem setOffset:-6];
        @weakify(self)
        [leftItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
            @strongify(self)
            [self.view endEditing:YES];
            [self.viewModel.navigationStackService popViewModelAnimated:YES];
        }];
    }
    
}
@end
