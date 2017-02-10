//
//  LCSearchViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSearchViewModel.h"
#import "LCCourseListModel.h"
#import "LCCourseCollectionCellViewModel.h"
#import "LCVideoDetailViewModel.h"

@interface LCSearchViewModel ()
@property(nonatomic,strong) NSString *keyWord;

@end

@implementation LCSearchViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    self.shouldInfiniteScrolling = YES;
    
    @weakify(self)
    [self setSearchKeyWord:^(NSString *keyWord) {
        @strongify(self)
        self.keyWord = keyWord;
        self.curpage = 1;
        [self.mutableDataArr removeAllObjects];
        [self.netApi_Manager courseKeyWord:keyWord AndCurpage:1 completeHandle:^(id responseObj, NSError *error) {
            LCCourseListModel *courseListModel = [LCCourseListModel parseJSON:responseObj];
            for (int i =0; i<courseListModel.contents.count; i++) {
                LCCourseCollectionCellViewModel *cellVM = [[LCCourseCollectionCellViewModel alloc]initWithModel:courseListModel.contents[i]];
                [self.mutableDataArr addObject:cellVM];
            }
            self.dataSource = self.mutableDataArr.copy;
        }];
    }];
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
    if (_keyWord == nil | _keyWord.length == 0) {
        return;
    }
    [self.netApi_Manager courseKeyWord:_keyWord AndCurpage:curpage completeHandle:^(id responseObj, NSError *error) {
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
