//
//  LCHomeViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.

#import "LCHomeViewModel.h"
#import "LCHomeCollectionSectionModel.h"
#import "LCHomeCollectionCellModel.h"
#import "LCHomeCollectionBananaViewModel.h"
#import "LCVideoDetailViewModel.h"


#import "LCHomeModel.h"
@implementation LCHomeViewModel
-(void)initialize{
    [super initialize];
    
    [self setClickBanner:^(NSInteger carouselTyp, NSString *iid) {
        //根据typ 和 id 要转界面
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    LCHomeCollectionSectionModel *sectionModel = self.dataSource[indexpath.section];
    LCHomeCollectionCellModel *cellViewModel = sectionModel.data[indexpath.row];
    LCVideoDetailViewModel *videoDetailVM = [[LCVideoDetailViewModel alloc]initWithServices:self.navigationStackService params:nil];
    videoDetailVM.planID = cellViewModel.idd;
    [self.navigationStackService pushViewModel:videoDetailVM animated:YES];
}
-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void(^)(id responseObj))complete{
    
    [self.netApi_Manager homeJsonCompleteHandle:^(id responseObj, NSError *error) {
        LCHomeModel *homeModel = [LCHomeModel parseJSON:responseObj];
        NSArray *homeCarousellistArr =  homeModel.contents.carouselList;
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i=0; i<homeCarousellistArr.count; i++) {
            LCHomeCollectionBananaViewModel *homeCarousellistVM = [[LCHomeCollectionBananaViewModel alloc]initWithModel:homeCarousellistArr[i]];
            homeCarousellistVM.clickBanner = self.clickBanner;
            [tempArr addObject:homeCarousellistVM];
        }
        self.homeBannerDataArr = tempArr.copy;
        
        for (int i=0; i<homeModel.contents.plan.count; i++) {
            LCHomeCollectionSectionModel *sectionModel = [[LCHomeCollectionSectionModel alloc]initWithModel:homeModel.contents.plan[i]];
            [self.mutableDataArr addObject:sectionModel];
            self.dataSource = self.mutableDataArr.copy;
        }
    }];
}
@end
