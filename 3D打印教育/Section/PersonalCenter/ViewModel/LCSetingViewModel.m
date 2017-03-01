//
//  LCSetingViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSetingViewModel.h"
#import "LCSetingCellViewModel.h"
#import "KDFileManager.h"

#import "LCChangePasswordViewModel.h" //修改密码
#import "WAboutUsViewModel.h"        // 关于我们
#import "NSObject+Common.h"
#import "KDFileManager.h"
@implementation LCSetingViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    if (indexpath.section == 0 &indexpath.row == 0) {
        LCChangePasswordViewModel *changePasswordVM = [[LCChangePasswordViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"修改密码"}];
        [self.navigationStackService pushViewModel:changePasswordVM animated:YES];
    }else if (indexpath.section == 0 & indexpath.row == 2){

        [KDFileManager clearFolderOfContent:[KDFileManager getCachePath] CompleteHandle:^{
            self.dataSource = self.mutableDataArr.copy;
        }];
        
        
    }else if (indexpath.section == 0 & indexpath.row == 3){
        WAboutUsViewModel *aboutUS = [[WAboutUsViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"关于我们"}];
        [self.navigationStackService pushViewModel:aboutUS animated:YES];
    }else if (indexpath.section == 1 & indexpath.row == 0){
        
        //推出登录
        NSString *temporary = LCENCRYPTKEY;
        LCENCRYPTKEY = nil;
        [self.netApi_Manager logOutWithCompleteHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic = responseObj;
            if ([dic[@"status"] isEqualToNumber:@1]) {
                [self.navigationStackService popViewModelAnimated:YES];
                LCENCRYPTKEY = nil;
                [KDFileManager removeUserDataForkey:LCCLOIN_AUTO]; 
            }else{
                LCENCRYPTKEY = temporary;
            }
            [NSObject showWarning:dic[@"msg"]];
        }];
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    LCSetingCellViewModel *cellVM0 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"修改密码",@"middleTitle":@"",@"rightType":@"jiantou"}];
    LCSetingCellViewModel *cellVM1 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"安允许2G/3?G/4G网络观看视频",@"middleTitle":@"",@"rightType":@"kaiguan"}];
    LCSetingCellViewModel *cellVM2 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"清除缓存",@"middleTitle":@"",@"rightType":@"shuzi"}];
    LCSetingCellViewModel *cellVM3 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"关于",@"middleTitle":@"",@"rightType":@"jiantou"}];
 
    LCSetingCellViewModel *cellVM4 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"",@"middleTitle":@"退出登录",@"rightType":@"kong"}];
    NSArray *setionArr0 = @[cellVM0,cellVM1,cellVM2,cellVM3];
    NSArray *setionArr1 = @[cellVM4];
    
    [self.mutableDataArr addObjectsFromArray:@[setionArr0,setionArr1]];
    if (self.status != 1) {
        [self.mutableDataArr removeLastObject];
    }
    self.dataSource = self.mutableDataArr.copy;
}
@end
