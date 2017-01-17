//
//  LCUseOldPaswordChangePaswordViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUseOldPaswordChangePaswordViewModel.h"
#import "NSObject+Common.h"
@implementation LCUseOldPaswordChangePaswordViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setChangePassword:^(NSString *oldPassword,NSString *newPassword,NSString *anewPassword) {
        @strongify(self)
//       [self.netApi_Manager changePasswordWithOldPassword:oldPassword andNewsPassword:newPassword CompleteHandle:^(id responseObj, NSError *error) {
//       }];
        [self.netApi_Manager changePasswordWithOldPassword:oldPassword andNewsPassword:newPassword andAgainNewsPassword:anewPassword CompleteHandle:^(id responseObj, NSError *error) {
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
}
@end
