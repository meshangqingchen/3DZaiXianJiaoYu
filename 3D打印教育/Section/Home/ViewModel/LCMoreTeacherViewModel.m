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

@implementation LCMoreTeacherViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
}


-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    [self.netApi_Manager teacherListWith:self.curpage completeHandle:^(id responseObj, NSError *error) {
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
