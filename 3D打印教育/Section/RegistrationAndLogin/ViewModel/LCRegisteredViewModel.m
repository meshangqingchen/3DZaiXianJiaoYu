//
//  LCRegisteredViewModel.m
//  无限教育
//
//  Created by 3D on 16/10/25.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCRegisteredViewModel.h"
#import "NSObject+Common.h"
@implementation LCRegisteredViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    //注册
    @weakify(self)
    [self setRegistAccount:^(NSString *phoneNum,NSString *passwprd,NSString *repasswprd,NSString *nickName,NSString *code) {
        @strongify(self)
        
        if (![passwprd isEqualToString:repasswprd]) {
            [NSObject showWarning:@"密码不一致"];
            return ;
        }
        
        if (passwprd.length<6 | passwprd.length>18) {
            [NSObject showWarning:@"密码格式不对"];
            return ;
        }
        
        [self.netApi_Manager registeredWith:phoneNum andPassword:passwprd andRePassword:repasswprd andNickname:nickName andVerification:code completeHandle:^(id responseObj, NSError *error) {
            
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
            
            if ([msg isEqualToString:@"注册成功"]) {
                [self.navigationStackService popViewModelAnimated:YES];
            }
        }];
    }];
    
    //获得验证码
    [self setGetPhoneCode:^(NSString *phoneNum) {
        @strongify(self)
        [self.netApi_Manager getPhoneCordeWith:phoneNum andOperation:@"注册" completeHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
        }];
    }];
}
@end
