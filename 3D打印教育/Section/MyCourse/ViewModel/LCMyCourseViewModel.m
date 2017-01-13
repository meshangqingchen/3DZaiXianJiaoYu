//
//  LCMyCourseViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMyCourseViewModel.h"
#import "LCMyCourseCellViewModel.h"

@implementation LCMyCourseViewModel
-(void)initialize{
    [super initialize];
    
}
-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    LCMyCourseCellViewModel *myCourseCellVM0 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"3d课程是无敌的3d课程是无敌的3d课程是无敌的"}];
    LCMyCourseCellViewModel *myCourseCellVM1 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"学挖掘机到到蓝翔"}];
    LCMyCourseCellViewModel *myCourseCellVM2 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔"}];
    LCMyCourseCellViewModel *myCourseCellVM3 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"swift一统江湖"}];
    LCMyCourseCellViewModel *myCourseCellVM4 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖"}];
    LCMyCourseCellViewModel *myCourseCellVM5 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"3d课程是无敌的"}];
    
    LCMyCourseCellViewModel *myCourseCellVM6 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"3d课程是无敌的3d课程是无敌的3d课程是无敌的"}];
    LCMyCourseCellViewModel *myCourseCellVM7 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"学挖掘机到到蓝翔"}];
    LCMyCourseCellViewModel *myCourseCellVM8 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔学挖掘机到到蓝翔"}];
    LCMyCourseCellViewModel *myCourseCellVM9 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"swift一统江湖"}];
    LCMyCourseCellViewModel *myCourseCellVM10 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖swift一统江湖"}];
    LCMyCourseCellViewModel *myCourseCellVM11 = [[LCMyCourseCellViewModel alloc]initWithModel:@{@"finished":@"已经完成了1/8",@"title":@"3d课程是无敌的"}];
    
    [self.mutableDataArr addObjectsFromArray:@[myCourseCellVM0,myCourseCellVM1,myCourseCellVM2,myCourseCellVM3,myCourseCellVM4,myCourseCellVM5,myCourseCellVM6,myCourseCellVM7,myCourseCellVM8,myCourseCellVM9,myCourseCellVM10,myCourseCellVM11]];
    self.dataSource = self.mutableDataArr.copy;
}
@end
