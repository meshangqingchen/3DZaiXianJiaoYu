//
//  LCLoginViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCLoginViewModel.h"
#import "LCRegisteredViewModel.h"
#import "LCForgotPasswordViewModel.h"
#import "KDFileManager.h"
#import "NSObject+Common.h"
@implementation LCLoginViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setGoBackVC:^{
        @strongify(self)
        [self.navigationStackService dismissViewModelAnimated:YES completion:nil];
    }];
    
    [self setGoToForgotVC:^{
        @strongify(self)
        LCForgotPasswordViewModel *forgotPasswordViewModel = [[LCForgotPasswordViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"修改密码"}];
        [self.navigationStackService pushViewModel:forgotPasswordViewModel animated:YES];
    }];
    
    [self setGoToRegisterdVC:^{
        @strongify(self)
        LCRegisteredViewModel *registeredViewModel = [[LCRegisteredViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"注册"}];
        [self.navigationStackService pushViewModel:registeredViewModel animated:YES];
    }];
    
    [self setLogin:^(NSString *phoneNum , NSString *password) {
        @strongify(self)
        [self.netApi_Manager loginWith:phoneNum andPassword:password completeHandle:^(id responseObj, NSError *error) {
            NSDictionary *jsonDic     = responseObj;
            MYLog(@"%@",jsonDic);
            NSNumber *statusNum = jsonDic[@"status"];
            NSString *msg = jsonDic[@"msg"];
            if ([statusNum isEqualToNumber:@1]) {
                NSDictionary *contents    = jsonDic[@"contents"];
                MYLog(@"contents = %@",contents);
                NSString *login_autoValue      = contents[@"login_auto"];
                MYLog(@"%@",login_autoValue);
                NSString *keyValue             = contents[@"key"];
                MYLog(@"%@",keyValue);
                NSNumber *isTeacher           = contents[@"is_teacher"];
               
                NSString *activeCouponMessage = contents[@"activeCouponMessage"];
                MYLog(@"activeCouponMessage = %@",activeCouponMessage);
                NSString *registerCouponMessage = contents[@"registerCouponMessage"];
                MYLog(@"registerCouponMessage = %@",registerCouponMessage);
               
                if (activeCouponMessage.length != 0 & activeCouponMessage != nil) {
                    [KDFileManager saveUserData:activeCouponMessage forKey:LCACTIVEMSG];
                }
                
                if (registerCouponMessage.length != 0 & registerCouponMessage != nil) {
                    [KDFileManager saveUserData:registerCouponMessage forKey:LCNEWUSERMSG];
                }
                
                [KDFileManager saveUserData:login_autoValue forKey:LCCLOIN_AUTO];
                LCENCRYPTKEY = keyValue;
                [self.navigationStackService dismissViewModelAnimated:YES completion:nil];
            }else{
                [NSObject showWarning:msg];
            }
        }];
    }];
}

@end
