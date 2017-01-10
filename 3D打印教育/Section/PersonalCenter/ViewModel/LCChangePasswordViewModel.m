//
//  LCChangePasswordViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCChangePasswordViewModel.h"
#import "LCUseOldPaswordChangePaswordViewModel.h"
#import "LCUseVerificationChangePasswordViewModel.h"
@implementation LCChangePasswordViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    if (indexpath.row == 0) {
        LCUseOldPaswordChangePaswordViewModel *useOldPaswordChangePaswordViewModel = [[LCUseOldPaswordChangePaswordViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"使用旧密码更换"}];
        [self.navigationStackService pushViewModel:useOldPaswordChangePaswordViewModel animated:YES];
    }else if (indexpath.row == 1){
        LCUseVerificationChangePasswordViewModel *useVerificationChangePasswordViewModel = [[LCUseVerificationChangePasswordViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"使用验证码更换"}];
        [self.navigationStackService pushViewModel:useVerificationChangePasswordViewModel animated:YES];
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    NSDictionary *dic =  @{@"leftTitle":@"使用当前密码验证"};
    NSDictionary *dic2 = @{@"leftTitle":@"使用手机号验证"};
    [self.mutableDataArr addObjectsFromArray:@[dic,dic2]];
    self.dataSource = self.mutableDataArr.copy;
}
@end
