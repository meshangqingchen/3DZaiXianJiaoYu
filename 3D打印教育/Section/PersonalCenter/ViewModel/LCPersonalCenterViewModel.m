//
//  LCPersonalCenterViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCPersonalCenterViewModel.h"
#import "LCPersonalCenterCellViewModel.h"     //cellVM
#import "LCPersonalCenterHeaderViewModel.h"   //headerVM
#import "LCLoginViewModel.h"   //登录VM
#import "LCSetingViewModel.h"  //设置VM
@implementation LCPersonalCenterViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setGoToLoginVC:^{
        @strongify(self)
        LCLoginViewModel *loginVM = [[LCLoginViewModel alloc]initWithServices:self.navigationStackService params:nil];
        [self.navigationStackService presentViewModel:loginVM animated:YES completion:nil];
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    NSArray *setionArr = self.dataSource[indexpath.section];
    LCPersonalCenterCellViewModel *cellVM = setionArr[indexpath.row];
    //消息、课程、收藏、设置、意见反馈
    if ([cellVM.titleName isEqualToString:@"消息"]) {
        
    }else if ([cellVM.titleName isEqualToString:@"课程"]){
    
    }else if ([cellVM.titleName isEqualToString:@"收藏"]){
    
    }else if ([cellVM.titleName isEqualToString:@"设置"]){
        LCSetingViewModel *setIngVM = [[LCSetingViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"设置"}];
        [self.navigationStackService pushViewModel:setIngVM animated:YES];
    }else if ([cellVM.titleName isEqualToString:@"意见反馈"]){
    
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    
    int x = arc4random() % 2;
    NSDictionary *dic = nil;
    //这里自动登录
//    if (x) {
//     dic = @{@"topTitle":@"我是nickName",@"headerImageURL":@"---",@"signature":@"我的一个签名给我一个梦醒",
//                              @"ifneedLog":@0};
//    }else{
     dic = @{@"topTitle":@"登录/注册",
                              @"headerImageURL":@"---",
                              @"signature":@"",
                              @"ifneedLog":@1};
//    }
    
    LCPersonalCenterHeaderViewModel *headerVM = [[LCPersonalCenterHeaderViewModel alloc]initWithModel:dic];
    headerVM.goToLoginVC = self.goToLoginVC;
    !self.bindViewModel ? :self.bindViewModel(headerVM);

    //消息、课程、收藏、设置、意见反馈
    LCPersonalCenterCellViewModel *cellVM0 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"消息",@"imageName":@"xiaoxitixing"}];
    LCPersonalCenterCellViewModel *cellVM1 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"课程",@"imageName":@"wodekecheng"}];
    LCPersonalCenterCellViewModel *cellVM2 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"收藏",@"imageName":@"shoucang"}];
    LCPersonalCenterCellViewModel *cellVM3 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"设置",@"imageName":@"seting"}];
    LCPersonalCenterCellViewModel *cellVM4 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"意见反馈",@"imageName":@"yijianfankui"}];
    NSArray *setionArr0 = @[cellVM0,cellVM1];
    NSArray *setionArr1 = @[cellVM2,cellVM3,cellVM4];
    [self.mutableDataArr addObjectsFromArray:@[setionArr0,setionArr1]];//
    self.dataSource = self.mutableDataArr.copy;
}
@end
