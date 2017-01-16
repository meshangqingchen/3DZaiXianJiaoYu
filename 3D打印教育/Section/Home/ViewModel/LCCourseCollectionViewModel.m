//
//  LCCourseCollectionViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseCollectionViewModel.h"
#import "LCCourseListModel.h"
#import "LCCourseCollectionCellViewModel.h"
@implementation LCCourseCollectionViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    [self.netApi_Manager courseListWithtypeId:self.typeId andCurpage:curpage completeHandle:^(id responseObj, NSError *error) {
        LCCourseListModel *courseListModel = [LCCourseListModel parseJSON:responseObj];
        for (int i =0; i<courseListModel.contents.count; i++) {
            LCCourseCollectionCellViewModel *cellVM = [[LCCourseCollectionCellViewModel alloc]initWithModel:courseListModel.contents[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
        complete(responseObj);
    }];
    
}



@end
