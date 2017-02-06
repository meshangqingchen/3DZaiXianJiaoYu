//
//  LCUseOldPaswordChangePaswordViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUseOldPaswordChangePaswordViewController.h"
#import "LCUseOldPaswordChangePaswordViewModel.h"
@interface LCUseOldPaswordChangePaswordViewController ()
@property(nonatomic,strong) LCUseOldPaswordChangePaswordViewModel *viewModel;
@property(nonatomic,strong) UITextField *oldPasswordTextfield;
@property(nonatomic,strong) UITextField *nnewPasswordTextfield;
@property(nonatomic,strong) UITextField *againnewPasswordTextfield;
@end

@implementation LCUseOldPaswordChangePaswordViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [KDColor getC19Color];
    
    
    UIView *topBackView = [UIView new];
    [self.view addSubview:topBackView];
    [topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(69);
        make.height.mas_equalTo(44);
    }];
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = [KDColor getC7Color];
    [topBackView addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.oldPasswordTextfield = [UITextField new];
    [topBackView addSubview:_oldPasswordTextfield];
    _oldPasswordTextfield.keyboardType =  UIKeyboardTypeNumberPad;
    _oldPasswordTextfield.secureTextEntry = YES;
    _oldPasswordTextfield.font = [[KDFont sharedKDFont]getF28Font];
    NSString *oldPasswordPlaceholder= @"请输入原始密码原始密码";
    NSMutableAttributedString *oldPasswordPlaceholderAr = [[NSMutableAttributedString alloc]initWithString:oldPasswordPlaceholder];
    [oldPasswordPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont sharedKDFont]getF28Font] range:NSMakeRange(0, oldPasswordPlaceholderAr.length)];
    [oldPasswordPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, oldPasswordPlaceholderAr.length)];
    self.oldPasswordTextfield.attributedPlaceholder = oldPasswordPlaceholderAr;
    [_oldPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(2);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(25);
    }];
    
    UIView *middleBackView = [UIView new];
    [self.view addSubview:middleBackView];
    [middleBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(topBackView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *middleLineView = [UIView new];
    middleLineView.backgroundColor = [KDColor getC7Color];
    [middleBackView addSubview:middleLineView];
    [middleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.nnewPasswordTextfield = [UITextField new];
    [middleBackView addSubview:_nnewPasswordTextfield];
    _nnewPasswordTextfield.keyboardType =  UIKeyboardTypeNumberPad;
    _nnewPasswordTextfield.secureTextEntry = YES;
    NSString *nnewPasswordPlaceholder= @"请输入新密码";
    NSMutableAttributedString *nnewPasswordPlaceholderAr = [[NSMutableAttributedString alloc]initWithString:nnewPasswordPlaceholder];
    [nnewPasswordPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF28Font] range:NSMakeRange(0, nnewPasswordPlaceholderAr.length)];
    [nnewPasswordPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, nnewPasswordPlaceholderAr.length)];
    self.nnewPasswordTextfield.attributedPlaceholder = nnewPasswordPlaceholderAr;
    [_nnewPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(2);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(25);
    }];
    
    UIView *bottomBackView = [UIView new];
    [self.view addSubview:bottomBackView];
    [bottomBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(middleBackView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [KDColor getC7Color];
    [bottomBackView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];

    UIView *bottomLineView1 = [UIView new];
    bottomLineView1.backgroundColor = [KDColor getC7Color];
    [bottomBackView addSubview:bottomLineView1];
    [bottomLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.againnewPasswordTextfield = [UITextField new];
    [bottomBackView addSubview:_againnewPasswordTextfield];
    _againnewPasswordTextfield.keyboardType =  UIKeyboardTypeNumberPad;
    _againnewPasswordTextfield.secureTextEntry = YES;
    NSString *againnewPasswordPlaceholder= @"请再一次输入新密码";
    NSMutableAttributedString *againnewPasswordPlaceholderAr = [[NSMutableAttributedString alloc]initWithString:againnewPasswordPlaceholder];
    
    [againnewPasswordPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF28Font] range:NSMakeRange(0, againnewPasswordPlaceholderAr.length)];
    [againnewPasswordPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, againnewPasswordPlaceholderAr.length)];
    self.againnewPasswordTextfield.attributedPlaceholder = againnewPasswordPlaceholderAr;
    [_againnewPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(2);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(25);
    }];

    
    
    
//
//    
    UIButton *finishBT = [UIButton new];
    [self.view addSubview:finishBT];
    finishBT.layer.cornerRadius = 4;
    finishBT.backgroundColor = [KDColor getX1Color];
    [finishBT setTitle:@"完成" forState:0];
    [finishBT setTitleColor:[KDColor getC0Color] forState:0];
    [finishBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(bottomBackView.mas_bottom).mas_offset(35);
        make.height.mas_equalTo(40);
    }];
    @weakify(self)
    [finishBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        
        !self.viewModel.changePassword ? : self.viewModel.changePassword(self.oldPasswordTextfield.text,self.nnewPasswordTextfield.text,self.againnewPasswordTextfield.text);
    }];
    
}

@end
