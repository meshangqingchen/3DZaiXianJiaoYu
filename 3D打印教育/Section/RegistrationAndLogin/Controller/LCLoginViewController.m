//
//  LCLoginViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCLoginViewModel.h"
@interface LCLoginViewController ()
@property(nonatomic,strong) LCLoginViewModel *viewModel;
@property(nonatomic,strong) UITextField *phoneNumtextField;
@property(nonatomic,strong) UITextField *passwordTextField;
@property(nonatomic,strong) UIButton *loginBT;
@property(nonatomic,strong) UIButton *forgetPasswordBT;
@property(nonatomic,strong) UIButton *registerBT;
@end

@implementation LCLoginViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setupViews];
}

-(void)setupViews{
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"login_back_image"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIView *topLeneView = [UIView new];
    [self.view addSubview:topLeneView];
    topLeneView.backgroundColor = [KDColor getC8Color];
    [topLeneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(75);
        make.right.mas_equalTo(-75);
        make.top.mas_equalTo(SCREEN_HEIGHT*578/1334);
        make.height.mas_equalTo(0.5);
    }];
    
    self.phoneNumtextField = [UITextField new];
    [self.view addSubview:_phoneNumtextField];
    _phoneNumtextField.keyboardType =  UIKeyboardTypeNumberPad;
    _phoneNumtextField.textColor = [UIColor whiteColor];
    NSString *phoneNumplaceholder= @"手机号";
    NSMutableAttributedString *phoneNumpplaceholderAr = [[NSMutableAttributedString alloc]initWithString:phoneNumplaceholder];
    [phoneNumpplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, phoneNumpplaceholderAr.length)];
    [phoneNumpplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getC0Color] range:NSMakeRange(0, phoneNumpplaceholderAr.length)];
    self.phoneNumtextField.attributedPlaceholder = phoneNumpplaceholderAr;
    [_phoneNumtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(topLeneView.mas_top).mas_equalTo(0);
        make.left.mas_equalTo(250/2);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(25);
    }];
    
    UIImageView *phoneImageView = [UIImageView new];
    [self.view addSubview:phoneImageView];
    phoneImageView.image = [UIImage imageNamed:@"phone_image"];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.phoneNumtextField.mas_left).mas_equalTo(-17);
        make.bottom.mas_equalTo(topLeneView.mas_top).mas_equalTo(-4.5);
        make.width.height.mas_equalTo(16);
    }];
    
    UIView *bottomLeneView = [UIView new];
    [self.view addSubview:bottomLeneView];
    bottomLeneView.backgroundColor = [KDColor getC8Color];
    [bottomLeneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(75);
        make.right.mas_equalTo(-75);
        make.top.mas_equalTo(topLeneView.mas_bottom).mas_equalTo(44);
        make.height.mas_equalTo(0.5);
    }];
    self.passwordTextField = [UITextField new];
    _passwordTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.textColor = [UIColor whiteColor];
    [self.view addSubview:_passwordTextField];
    NSString *passwordplaceholder= @"输入密码";
    NSMutableAttributedString *passwordplaceholderAr = [[NSMutableAttributedString alloc]initWithString:passwordplaceholder];
    [passwordplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, passwordplaceholderAr.length)];
    [passwordplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getC0Color] range:NSMakeRange(0, passwordplaceholderAr.length)];
    self.passwordTextField.attributedPlaceholder = passwordplaceholderAr;
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(bottomLeneView.mas_top).mas_equalTo(0);
        make.left.mas_equalTo(250/2);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(25);
    }];
    UIImageView *lockImageView = [UIImageView new];
    [self.view addSubview:lockImageView];
    lockImageView.image = [UIImage imageNamed:@"lock_image"];
    [lockImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.passwordTextField.mas_left).mas_equalTo(-17);
        make.bottom.mas_equalTo(bottomLeneView.mas_top).mas_equalTo(-4.5);
        make.width.height.mas_equalTo(16);
    }];
    
    self.loginBT = [UIButton new];
    [self.view addSubview:_loginBT];
    [_loginBT setBackgroundImage:[UIImage imageNamed:@"Normal_Login"] forState:UIControlStateNormal];
    [_loginBT setBackgroundImage:[UIImage imageNamed:@"Selected_Login"] forState:UIControlStateSelected];
    [_loginBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(bottomLeneView.mas_bottom).mas_equalTo(44);
    }];
    //登录
    @weakify(self)
    [_loginBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        self.loginBT.selected = !self.loginBT.selected;
        
//        !self.viewModel.goToRootVC ? : self.viewModel.goToRootVC(self.phoneNumtextField.text,self.passwordTextField.text);
        !self.viewModel.login ? : self.viewModel.login(self.phoneNumtextField.text,self.passwordTextField.text);
    }];
    
    self.forgetPasswordBT = [UIButton new];
    [self.view addSubview:_forgetPasswordBT];
    [_forgetPasswordBT setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetPasswordBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    [_forgetPasswordBT setTitleColor:[KDColor getC0Color] forState:UIControlStateNormal];
    _forgetPasswordBT.titleLabel.font = [[KDFont new]getF28Font];
    [_forgetPasswordBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.mas_equalTo(_loginBT.mas_bottom).mas_equalTo(10);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(20);
    }];
    [_forgetPasswordBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        self.forgetPasswordBT.selected = YES;
        self.registerBT.selected = NO;
        !self.viewModel.goToForgotVC ? :self.viewModel.goToForgotVC();
    }];
    
    self.registerBT = [UIButton new];
    [self.view addSubview:_registerBT];
    _registerBT.selected  = YES;
    [_registerBT setTitle:@"注册账号" forState:UIControlStateNormal];
    [_registerBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    [_registerBT setTitleColor:[KDColor getC0Color] forState:UIControlStateNormal];
    _registerBT.titleLabel.font = [[KDFont new]getF28Font];
    [_registerBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-80);
        make.top.mas_equalTo(_loginBT.mas_bottom).mas_equalTo(10);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(20);
    }];
    [_registerBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        self.forgetPasswordBT.selected = NO;
        self.registerBT.selected = YES;
        !self.viewModel.goToRegisterdVC ? :self.viewModel.goToRegisterdVC();
    }];
    
    //返回按钮.........
    UIButton *backBT = [UIButton new];
    [self.view addSubview:backBT];
    [backBT setImage:[UIImage imageNamed:@"logo_back"] forState:UIControlStateNormal];
    [backBT sizeToFit];
    [backBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(34);
    }];
    [backBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.goBackVC ? : self.viewModel.goBackVC();
    }];
}

@end
