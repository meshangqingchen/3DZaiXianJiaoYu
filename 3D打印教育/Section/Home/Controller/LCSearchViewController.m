//
//  LCSearchViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSearchViewController.h"
#import "LCSearchViewModel.h"
#import "LCTextFiled.h"
#import "UINavigationItem+CustomItem.h"
@interface LCSearchViewController ()
@property(nonatomic,strong) LCSearchViewModel *viewModel;
@property(nonatomic,strong) LCTextFiled *tf;
@end

@implementation LCSearchViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    _tf = [[LCTextFiled alloc]initWithFrame:CGRectMake(30, 7, SEARCHTEXTFIELD_W - 15, 30)];
//    _tf.delegate = self;
    _tf.layer.cornerRadius = 15;
    _tf.backgroundColor = [KDColor getC1Color];
    _tf.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fangdajing"]];
    _tf.leftViewMode = UITextFieldViewModeAlways;

    _tf.textColor = [KDColor getC0Color];
    _tf.font = [[KDFont sharedKDFont] getF28Font];
    NSString *placeholderString = @"搜一搜";
    
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:placeholderString];
    [placeholder addAttribute:NSFontAttributeName value:[[KDFont sharedKDFont] getF28Font] range:NSMakeRange(0, placeholderString.length)];
    [placeholder addAttribute:NSForegroundColorAttributeName value:[KDColor getC0Color] range:NSMakeRange(0,placeholderString.length)];
    _tf.attributedPlaceholder = placeholder;

    [self.navigationController.navigationBar addSubview:_tf];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    
    
    CustomBarItem *rightItem = [self.navigationItem setItemWithTitle:@"搜索" textColor:[UIColor whiteColor] fontSize:15 itemType:right];
    @weakify(self)
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)

    }];
}

@end
