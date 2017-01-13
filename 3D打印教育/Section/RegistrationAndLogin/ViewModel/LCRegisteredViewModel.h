//
//  LCRegisteredViewModel.h
//  无限教育
//
//  Created by 3D on 16/10/25.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCRegisteredViewModel : BaseViewModel
//下一步
@property(nonatomic,copy) void (^registAccount)(NSString *phoneNum,NSString *passwprd,NSString *repasswprd,NSString *nickName,NSString *code);
//获取短信验证码
@property(nonatomic,copy) void (^getPhoneCode)(NSString *phoneNum);

@end
