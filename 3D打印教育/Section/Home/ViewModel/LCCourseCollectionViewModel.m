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

#import "LCVideoDetailViewModel.h"          //课程的detail

@implementation LCCourseCollectionViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    
    LCCourseCollectionCellViewModel *cellVM = self.dataSource[indexpath.row];
    LCVideoDetailViewModel *videoDetailVM = [[LCVideoDetailViewModel alloc]initWithServices:self.navigationStackService params:nil];
    videoDetailVM.planID = cellVM.iid;
    videoDetailVM.imageUrl = cellVM.imageURL;
    videoDetailVM.titleti = cellVM.title;
    [self.navigationStackService pushViewModel:videoDetailVM animated:YES];
}


-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    if (self.typeId==nil | self.typeId.length == 0) {
        [self.netApi_Manager moreCourseListAndCurpage:curpage completeHandle:^(id responseObj, NSError *error) {
            
            LCCourseListModel *courseListModel = [LCCourseListModel parseJSON:responseObj];
            for (int i =0; i<courseListModel.contents.count; i++) {
                LCCourseCollectionCellViewModel *cellVM = [[LCCourseCollectionCellViewModel alloc]initWithModel:courseListModel.contents[i]];
                [self.mutableDataArr addObject:cellVM];
            }
            self.dataSource = self.mutableDataArr.copy;
            complete(responseObj);
        }];
    }else{
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
}
@end
