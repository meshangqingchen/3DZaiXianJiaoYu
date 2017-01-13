//
//  LCForgotPasswordViewModel.m
//  无限教育
//
//  Created by 3D on 16/10/25.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCForgotPasswordViewModel.h"
#import "NSObject+Common.h"
#import "RegexUtil.h"
@implementation LCForgotPasswordViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    //获得验证码
    @weakify(self)
    [self setGetPhoneCode:^(NSString *phoneNum) {
        @strongify(self)
//        [self.netApi_Manager getPhoneCordeWith:phoneNum andOperation:@"找回密码" completeHandle:^(id responseObj, NSError *error) {
//            NSDictionary *dic = responseObj;
//            NSString *msg = dic[@"msg"];
//            [NSObject showWarning:msg];
//        }];
    }];
    //设置新密码 (NSString *phoneNum,NSString *passwprd,NSString *repasswprd,NSString *code)
    
    [self setSettingNewPasswprd:^(NSString *phoneNum, NSString *passwprd, NSString *repasswprd, NSString *code) {
       
        if (phoneNum == nil || phoneNum.length == 0) {
            [NSObject showWarning:@"电话号码为空"];
            return ;
        }else if (phoneNum.length != 11){
            [NSObject showWarning:@"电话号码格式错误"];
            return ;
        }else if (![RegexUtil checkTelNumber:phoneNum]){
            [NSObject showWarning:@"电话号码输入错误"];
            return ;
        }
        
        if (![passwprd isEqualToString:repasswprd]) {
            [NSObject showWarning:@"密码不一致"];
            return ;
        }
        
        if (passwprd.length<6 | passwprd.length>18) {
            [NSObject showWarning:@"密码格式不对"];
            return ;
        }
        @strongify(self)
//        [self.netApi_Manager forgotPasswordSettingNewPasswordWithPhone:phoneNum andNewPassword:passwprd andRePassword:repasswprd andCord:code CompleteHandle:^(id responseObj, NSError *error) {
//            NSDictionary *dic = responseObj;
//            NSString *msg = dic[@"msg"];
//            [NSObject showWarning:msg];
//        }];
    }];

}
@end
