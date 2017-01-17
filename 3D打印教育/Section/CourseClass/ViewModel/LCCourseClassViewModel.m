//
//  LCCourseClassViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassViewModel.h"
#import "LCCourseClassModel.h"
#import "LCCourseClassFCellViewModel.h"

#import "LCCourseCollectionViewModel.h"
@implementation LCCourseClassViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setClickHeadView:^(NSString *iid,NSString *title) {
        @strongify(self)
        LCCourseCollectionViewModel *courseClassCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:title}];
        courseClassCollectionVM.typeId = iid;
        [self.navigationStackService  pushViewModel:courseClassCollectionVM animated:YES];
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    LCCourseClassFCellViewModel *fcellVM = self.dataSource[indexpath.section];
    LCCourseClassSCellViewModel *scellVM =  fcellVM.sonList[indexpath.row];
    if (scellVM.iid) {
        LCCourseCollectionViewModel *courseClassCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:scellVM.title}];
        courseClassCollectionVM.typeId = scellVM.iid;
        [self.navigationStackService  pushViewModel:courseClassCollectionVM animated:YES];
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    [self.netApi_Manager planTypeListCompleteHandle:^(id responseObj, NSError *error) {
        LCCourseClassModel *courseClassModel = [LCCourseClassModel parseJSON:responseObj];
        for (int i=0; i<courseClassModel.contents.count; i++) {
            LCCourseClassFCellViewModel *fcellVM = [[LCCourseClassFCellViewModel alloc]initWithModel:courseClassModel.contents[i]];
            fcellVM.clickHeadView = self.clickHeadView;
            [self.mutableDataArr addObject:fcellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}
@end
