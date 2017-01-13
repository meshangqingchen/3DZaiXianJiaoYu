//
//  LCForgotPasswordViewModel.h
//  无限教育
//
//  Created by 3D on 16/10/25.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCForgotPasswordViewModel : BaseViewModel
@property(nonatomic,copy) void (^settingNewPasswprd)(NSString *phoneNum,NSString *passwprd,NSString *repasswprd,NSString *code);
//获取短信验证码
@property(nonatomic,copy) void (^getPhoneCode)(NSString *phoneNum);
@end
