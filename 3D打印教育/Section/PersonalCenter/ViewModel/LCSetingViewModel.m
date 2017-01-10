//
//  LCSetingViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSetingViewModel.h"
#import "LCSetingCellViewModel.h"

#import "LCChangePasswordViewModel.h" //修改密码
@implementation LCSetingViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    if (indexpath.section == 0 &indexpath.row == 0) {
        LCChangePasswordViewModel *changePasswordVM = [[LCChangePasswordViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"修改密码"}];
        [self.navigationStackService pushViewModel:changePasswordVM animated:YES];
    }else if (indexpath.section == 0&indexpath.row == 2){
    
    }else if (indexpath.section == 0 & indexpath.row == 3){
    
    }else if (indexpath.section == 1 & indexpath.row == 0){
    
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCSetingCellViewModel *cellVM0 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"修改密码",@"middleTitle":@"",@"rightType":@"jiantou"}];
    LCSetingCellViewModel *cellVM1 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"安允许2G/3?G/4G网络观看视频",@"middleTitle":@"",@"rightType":@"kaiguan"}];
    LCSetingCellViewModel *cellVM2 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"清除缓存",@"middleTitle":@"",@"rightType":@"shuzi"}];
    LCSetingCellViewModel *cellVM3 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"关于",@"middleTitle":@"",@"rightType":@"jiantou"}];
    LCSetingCellViewModel *cellVM4 = [[LCSetingCellViewModel alloc]initWithModel:@{@"leftTitle":@"",@"middleTitle":@"退出登录",@"rightType":@"kong"}];
    NSArray *setionArr0 = @[cellVM0,cellVM1,cellVM2,cellVM3];
    NSArray *setionArr1 = @[cellVM4];
    
    [self.mutableDataArr addObjectsFromArray:@[setionArr0,setionArr1]];
    self.dataSource = self.mutableDataArr.copy;
}
@end
