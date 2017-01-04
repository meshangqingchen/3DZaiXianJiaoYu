//
//  LCUserTeacherTalkViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCUserTeacherTalkViewModel.h"
#import "LCUserTeacherTalkCellViewModel.h"
@implementation LCUserTeacherTalkViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
   
    LCUserTeacherTalkCellViewModel *userTeacherCellVM0 = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":@"我是",@"fromWho":@1}];
    
    LCUserTeacherTalkCellViewModel *userTeacherCellVM1 = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":@"我是一名老师老师老师老师我是一名老师老师老师老师我是一名老师老师老师老师我是一名老师老师老师老师",@"fromWho":@0}];
    
    LCUserTeacherTalkCellViewModel *userTeacherCellVM2 = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":@"我是一名学生学生学生我是一名学生学生学生我是一名学生学生学生我是一名学生学生学生",@"fromWho":@1}];
    
    LCUserTeacherTalkCellViewModel *userTeacherCellVM3 = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":@"我是一名学生",@"fromWho":@1}];
     LCUserTeacherTalkCellViewModel *userTeacherCellVM4 = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":@"我是一名老师我是一名老师我是一名老师我是一名老师我是一名老师我是一名老师我是一名老师",@"fromWho":@0}];
    [self.mutableDataArr addObjectsFromArray:@[userTeacherCellVM0,userTeacherCellVM1,userTeacherCellVM2,userTeacherCellVM3,userTeacherCellVM4]];
    
    self.dataSource = self.mutableDataArr.copy;
}
@end
