//
//  LCPersonalCenterViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCPersonalCenterViewModel.h"
#import "LCPersonalCenterCellViewModel.h"
@implementation LCPersonalCenterViewModel
-(void)initialize{
    [super initialize];
    
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCPersonalCenterCellViewModel *cellVM0 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"学习笔记",@"imageName":@"xuexibiji"}];
    LCPersonalCenterCellViewModel *cellVM1 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"我的资讯",@"imageName":@"wodezixun"}];
    LCPersonalCenterCellViewModel *cellVM2 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"个人动态",@"imageName":@"gerendongtai"}];
    LCPersonalCenterCellViewModel *cellVM3 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"我的课程",@"imageName":@"wodekecheng"}];
    LCPersonalCenterCellViewModel *cellVM4 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"资讯回复",@"imageName":@"zixunhuifu"}];
    LCPersonalCenterCellViewModel *cellVM5 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"设置",@"imageName":@"seting"}];
    LCPersonalCenterCellViewModel *cellVM6 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"意见反馈",@"imageName":@"yijianfankui"}];
    NSArray *setionArr0 = @[cellVM0,cellVM1,cellVM2];
    NSArray *setionArr1 = @[cellVM3,cellVM4];
    NSArray *setionArr2 = @[cellVM5,cellVM6];
    
    [self.mutableDataArr addObjectsFromArray:@[setionArr0,setionArr1,setionArr2]];//
    self.dataSource = self.mutableDataArr.copy;
}
@end
