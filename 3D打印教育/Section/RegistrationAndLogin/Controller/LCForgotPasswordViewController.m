//
//  LCForgotPasswordViewController.m
//  无限教育
//
//  Created by 3D on 16/10/25.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCForgotPasswordViewController.h"
#import "LCForgotPasswordViewModel.h"
#import "UIView+HUD.h"
#import "RegexUtil.h"
@interface LCForgotPasswordViewController ()
@property(nonatomic,strong) UITextField *phoneNumTextField;
@property(nonatomic,strong) UITextField *passwordTextField;
@property(nonatomic,strong) UITextField *repasswordTextField;

@property(nonatomic,strong) UITextField *validationTextField;

@property(nonatomic,strong) UIButton *getvalidationBT;
@property(nonatomic,strong) LCForgotPasswordViewModel* viewModel;
@end

@implementation LCForgotPasswordViewController
{
    dispatch_source_t _timer;
}
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //top line
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = [KDColor getX0Color];
    [self.view addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    self.phoneNumTextField = [UITextField new];
    [self.view addSubview:_phoneNumTextField];
    _phoneNumTextField.keyboardType =  UIKeyboardTypeNumberPad;
    NSString *phoneNumplaceholder= @"请输入注册时的手机号";
    NSMutableAttributedString *phoneNumplaceholderAr = [[NSMutableAttributedString alloc]initWithString:phoneNumplaceholder];
    [phoneNumplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, phoneNumplaceholderAr.length)];
    [phoneNumplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, phoneNumplaceholderAr.length)];
    self.phoneNumTextField.attributedPlaceholder = phoneNumplaceholderAr;
    [_phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(topLineView.mas_bottom).mas_equalTo(-9);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
    }];
    
    //middle top line
    UIView *middleToplineView = [UIView new];
    middleToplineView.backgroundColor = [KDColor getX0Color];
    [self.view addSubview:middleToplineView];
    [middleToplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(topLineView.mas_bottom).mas_equalTo(44);
        make.height.mas_equalTo(0.5);
    }];
    self.passwordTextField = [UITextField new];
    [self.view addSubview:_passwordTextField];
    _passwordTextField.keyboardType =  UIKeyboardTypeDefault;
    _passwordTextField.secureTextEntry = YES;
    NSString *passwordplaceholder= @"新密码: 6-18位,区分大小写";
    NSMutableAttributedString *passwordplaceholderAr = [[NSMutableAttributedString alloc]initWithString:passwordplaceholder];
    [passwordplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, passwordplaceholderAr.length)];
    [passwordplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, passwordplaceholderAr.length)];
    self.passwordTextField.attributedPlaceholder = passwordplaceholderAr;
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(middleToplineView.mas_bottom).mas_equalTo(-9);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
    }];
    
    //middle line
    UIView *middle = [UIView new];
    middle.backgroundColor = [KDColor getX0Color];
    [self.view addSubview:middle];
    [middle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(middleToplineView.mas_bottom).mas_equalTo(44);
        make.height.mas_equalTo(0.5);
    }];
    self.repasswordTextField = [UITextField new];
    [self.view addSubview:_repasswordTextField];
    _repasswordTextField.keyboardType =  UIKeyboardTypeDefault;
    _repasswordTextField.secureTextEntry = YES;
    NSString *renicknameplaceholder= @"请再次输入新密码";
    NSMutableAttributedString *renicknameplaceholderAr = [[NSMutableAttributedString alloc]initWithString:renicknameplaceholder];
    [renicknameplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, renicknameplaceholder.length)];
    [renicknameplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, renicknameplaceholder.length)];
    self.repasswordTextField.attributedPlaceholder = renicknameplaceholderAr;
    [_repasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(middle.mas_bottom).mas_equalTo(-9);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
    }];
    
    
    

    //bottom line
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = [KDColor getX0Color];
    [self.view addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(middle.mas_bottom).mas_equalTo(44);
        make.height.mas_equalTo(0.5);
    }];
    
    self.validationTextField = [UITextField new];
    [self.view addSubview:_validationTextField];
    _validationTextField.keyboardType =  UIKeyboardTypeNumberPad;
    NSString *validationlaceholder= @"请输入验证码";
    NSMutableAttributedString *validationplaceholderAr = [[NSMutableAttributedString alloc]initWithString:validationlaceholder];
    [validationplaceholderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, validationplaceholderAr.length)];
    [validationplaceholderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, validationplaceholderAr.length)];
    self.validationTextField.attributedPlaceholder = validationplaceholderAr;
    [_validationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(bottomLine.mas_bottom).mas_equalTo(-9);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
    }];
    
    UIButton *getvalidationBT = [UIButton new];
    self.getvalidationBT = getvalidationBT;
    [self.view addSubview:getvalidationBT];
    getvalidationBT.layer.cornerRadius = 4;
    [getvalidationBT setTitle:@"获得验证码" forState:0];
    [getvalidationBT setTitleColor:[KDColor getC0Color] forState:0];
    getvalidationBT.titleLabel.font = [[KDFont new]getF28Font];
    getvalidationBT.backgroundColor = [KDColor getC21Color];
    [getvalidationBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(bottomLine.mas_top).mas_equalTo(-5);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(34);
    }];
    @weakify(self)
    [getvalidationBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        if (self.phoneNumTextField.text == nil || self.phoneNumTextField.text.length == 0) {
            [self.view showWarning:@"电话号码为空"];
        }else if (self.phoneNumTextField.text.length != 11){
            [self.view showWarning:@"电话号码格式错误"];
        }else if (![RegexUtil checkTelNumber:self.phoneNumTextField.text]){
            [self.view showWarning:@"电话号码输入错误"];
        }else{
            [self starTime];
            !self.viewModel.getPhoneCode ? : self.viewModel.getPhoneCode(self.phoneNumTextField.text);
            MYLog(@"%@获取验证码",self);
        }
        
    }];
    
    UIButton *nextStepBT = [UIButton new];
    [self.view addSubview:nextStepBT];
    nextStepBT.layer.cornerRadius = 4;
    nextStepBT.backgroundColor = [KDColor getX1Color];
    [nextStepBT setTitle:@"下一步" forState:0];
    [nextStepBT setTitleColor:[KDColor getC0Color] forState:0];
    [nextStepBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(bottomLine.mas_bottom).mas_equalTo(44);
        make.height.mas_equalTo(39);
    }];
    [nextStepBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        MYLog(@"%@下一步",self);
       
        !self.viewModel.settingNewPasswprd ? : self.viewModel.settingNewPasswprd(self.phoneNumTextField.text,self.passwordTextField.text,self.repasswordTextField.text,self.validationTextField.text);
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


-(void)dealloc{
    MYLog(@"++++++");
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
