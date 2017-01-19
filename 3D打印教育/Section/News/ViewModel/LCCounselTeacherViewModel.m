//
//  LCCounselTeacherViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCounselTeacherViewModel.h"
#import "LCCounselTeacherModel.h"
#import "LCCounselTeacherCellViewModel.h"

#import "LCTeacherDetailViewModel.h"

@implementation LCCounselTeacherViewModel
-(void)initialize{
    [super initialize];
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
    
}


-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
   
    LCCounselTeacherCellViewModel *cellVM = self.dataSource[indexpath.row];
    LCTeacherDetailViewModel *teacherDeatilVM = [[LCTeacherDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"讲师详情"}];
    teacherDeatilVM.teacherID = cellVM.teacherID;
    [self.navigationStackService pushViewModel:teacherDeatilVM animated:YES];
}


-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    [self.netApi_Manager teacherListWith:self.curpage completeHandle:^(id responseObj, NSError *error) {
        LCCounselTeacherModel *counselTeacherModel = [LCCounselTeacherModel parseJSON:responseObj];
        for (int i=0; i<counselTeacherModel.contents.count; i++) {
            LCCounselTeacherCellViewModel *cellVM = [[LCCounselTeacherCellViewModel alloc]initWithModel:counselTeacherModel.contents[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
        complete(responseObj);
    }];
}

@end
