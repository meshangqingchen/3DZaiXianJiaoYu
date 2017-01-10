//
//  LCUseVerificationChangePasswordViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUseVerificationChangePasswordViewController.h"
#import "LCUseVerificationChangePasswordViewModel.h"
@interface LCUseVerificationChangePasswordViewController ()
@property(nonatomic,strong) LCUseVerificationChangePasswordViewModel *viewModel;
@property(nonatomic,strong) UITextField *validationTextField;
@property(nonatomic,strong) UITextField *nnewPasswordTextfield;
@property(nonatomic,strong) UITextField *againnewPasswordTextfield;
@property(nonatomic,strong) UIButton *getvalidationBT;
@end

@implementation LCUseVerificationChangePasswordViewController
{
    dispatch_source_t _timer;
}
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [KDColor getC19Color];
    
    
    UIView *topBackView = [UIView new];
    topBackView.backgroundColor = [UIColor yellowColor];
    //    topBackView.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:topBackView];
    [topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(69);
        make.height.mas_equalTo(35);
    }];
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = [KDColor getC7Color];
    [topBackView addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.validationTextField = [UITextField new];
    _validationTextField.backgroundColor = [UIColor redColor];
    [topBackView addSubview:_validationTextField];
    _validationTextField.keyboardType =  UIKeyboardTypeNumberPad;
//    _validationTextField.secureTextEntry = YES;
    NSString *validationPlaceholder= @"请输入原始密码原始密码";
    NSMutableAttributedString *validationPlaceholderAr = [[NSMutableAttributedString alloc]initWithString:validationPlaceholder];
    [validationPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF22Font] range:NSMakeRange(0, validationPlaceholderAr.length)];
    [validationPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, validationPlaceholderAr.length)];
    self.validationTextField.attributedPlaceholder = validationPlaceholderAr;
    [_validationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(25);
    }];
    
    UIButton *getvalidationBT = [UIButton new];
    self.getvalidationBT = getvalidationBT;
    [topBackView addSubview:getvalidationBT];
    getvalidationBT.layer.cornerRadius = 4;
    [getvalidationBT setTitle:@"获得验证码" forState:0];
    [getvalidationBT setTitleColor:[KDColor getC0Color] forState:0];
    getvalidationBT.titleLabel.font = [[KDFont new]getF22Font];
    getvalidationBT.backgroundColor = [KDColor getC21Color];
    [getvalidationBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(25);
    }];
    @weakify(self)
    [getvalidationBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self starTime];
    }];
    
    UIView *middleBackView = [UIView new];
    middleBackView.backgroundColor = [UIColor yellowColor];
    //    topBackView.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:middleBackView];
    [middleBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(topBackView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(35);
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
    [nnewPasswordPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF22Font] range:NSMakeRange(0, nnewPasswordPlaceholderAr.length)];
    [nnewPasswordPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, nnewPasswordPlaceholderAr.length)];
    self.nnewPasswordTextfield.attributedPlaceholder = nnewPasswordPlaceholderAr;
    [_nnewPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(25);
    }];
    
    UIView *bottomBackView = [UIView new];
    bottomBackView.backgroundColor = [UIColor yellowColor];
    //    topBackView.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:bottomBackView];
    [bottomBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(middleBackView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(35);
    }];
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [KDColor getC7Color];
    [bottomBackView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    self.againnewPasswordTextfield = [UITextField new];
    [bottomBackView addSubview:_againnewPasswordTextfield];
    _againnewPasswordTextfield.keyboardType =  UIKeyboardTypeNumberPad;
    _againnewPasswordTextfield.secureTextEntry = YES;
    NSString *againnewPasswordPlaceholder= @"请再一次输入新密码";
    NSMutableAttributedString *againnewPasswordPlaceholderAr = [[NSMutableAttributedString alloc]initWithString:againnewPasswordPlaceholder];
    
    [againnewPasswordPlaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF22Font] range:NSMakeRange(0, againnewPasswordPlaceholderAr.length)];
    [againnewPasswordPlaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, againnewPasswordPlaceholderAr.length)];
    self.againnewPasswordTextfield.attributedPlaceholder = againnewPasswordPlaceholderAr;
    [_againnewPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(25);
    }];
    
    
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
    
    [finishBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        
        //        !self.viewModel.changePassword ? : self.viewModel.changePassword(self.oldPasswordTextfield.text,self.nnewPasswordTextfield.text);
    }];
    
}

-(void)starTime{
    if (_timer != nil) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    __block int timeOut = 59;
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    _timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut<=0) {
            dispatch_source_cancel(timer);
            timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.getvalidationBT.backgroundColor = [KDColor getC21Color];
                [self.getvalidationBT setTitle:@"重新发送" forState:UIControlStateNormal];
                self.getvalidationBT.enabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //                [UIView beginAnimations:nil context:nil];
                //                [UIView setAnimationDuration:1];
                self.getvalidationBT.backgroundColor = [KDColor getC15Color];
                [self.getvalidationBT setTitle:[NSString stringWithFormat:@"重新发送%d S",timeOut] forState:UIControlStateNormal];
                //                [UIView commitAnimations];
                self.getvalidationBT.enabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(timer);
}

@end
