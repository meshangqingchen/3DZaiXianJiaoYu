//
//  LCMoreTeacherViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMoreTeacherViewModel.h"
#import "LCCounselTeacherModel.h"
#import "LCTeacherCellViewModel.h"
#import "LCTeacherDetailViewModel.h"//老师详情

@implementation LCMoreTeacherViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    LCTeacherCellViewModel *cellVM = self.dataSource[indexpath.row];
    LCTeacherDetailViewModel *teacherDeatilVM = [[LCTeacherDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"讲师详情"}];
    teacherDeatilVM.teacherID = cellVM.teacherID;
    teacherDeatilVM.frome = hiddenFromTYP;
    [self.navigationStackService pushViewModel:teacherDeatilVM animated:YES];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    [self.netApi_Manager teacherListWith:curpage completeHandle:^(id responseObj, NSError *error) {
        LCCounselTeacherModel *counselTeacherModel = [LCCounselTeacherModel parseJSON:responseObj];
        for (int i=0; i<counselTeacherModel.contents.count; i++) {
            LCTeacherCellViewModel *cellVM = [[LCTeacherCellViewModel alloc]initWithModel:counselTeacherModel.contents[i]];
            [self.mutableDataArr addObject:cellVM];

        }
        self.dataSource = self.mutableDataArr.copy;
        complete(responseObj);
    }];
}

@end
