//
//  LCHomeViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeViewController.h"
#import "LCHomeViewModel.h"
#import "LCTextFiled.h"
@interface LCHomeViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) LCHomeViewModel *viewModel;
@property(nonatomic,strong) LCTextFiled *tf;
@end

@implementation LCHomeViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    _tf = [[LCTextFiled alloc]initWithFrame:SEARCHTEXTFIELD_FREAM];
    _tf.delegate = self;
    _tf.layer.cornerRadius = 15;
    _tf.backgroundColor = [KDColor getC1Color];
    _tf.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fangdajing"]];
    _tf.leftViewMode = UITextFieldViewModeAlways;
    _tf.text = @"搜索想要的内容";
    _tf.textColor = [KDColor getC0Color];
    _tf.font = [[KDFont sharedKDFont] getF28Font];
    [self.navigationController.navigationBar addSubview:_tf];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"asd");
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
