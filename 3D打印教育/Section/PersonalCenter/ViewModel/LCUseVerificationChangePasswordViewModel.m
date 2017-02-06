//
//  LCUseVerificationChangePasswordViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUseVerificationChangePasswordViewModel.h"
#import "NSObject+Common.h"
@implementation LCUseVerificationChangePasswordViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setChangePassword:^(NSString *code,NSString *newPassword,NSString *anewPassword) {
       @strongify(self)
        [self.netApi_Manager changePasswordWithCode:code andNewsPassword:newPassword andAgainNewsPassword:anewPassword CompleteHandle:^(id responseObj, NSError *error) {
            if (![newPassword isEqualToString:anewPassword]) {
                [NSObject showWarning:@"两次输入密码不一致"];
                return ;
            }
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
            if ([dic[@"status"] isEqualToNumber:@1]) {
                [self.navigationStackService popViewModelAnimated:YES];
            }
        }];
    }];
    
    [self setGetVerificationCode:^{
        @strongify(self)
        [self.netApi_Manager getPhoneCordeWithCompleteHandle:^(id responseObj, NSError *error) {
        }];
    }];
}
@end
