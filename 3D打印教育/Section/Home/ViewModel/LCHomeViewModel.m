//
//  LCHomeViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.

#import "LCHomeViewModel.h"
#import "LCHomeCollectionSectionModel.h"
#import "LCHomeCollectionCellModel.h"
#import "LCVideoDetailViewModel.h"
@implementation LCHomeViewModel
-(void)initialize{

}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    LCVideoDetailViewModel *videoDetailVM = [[LCVideoDetailViewModel alloc]initWithServices:self.navigationStackService params:nil];
    [self.navigationStackService pushViewModel:videoDetailVM animated:YES];
}
-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void(^)(id responseObj))complete{
    
    LCHomeCollectionCellModel *cellmodel = [[LCHomeCollectionCellModel alloc]initWithModel:nil];
    cellmodel.imgURL = nil;
    cellmodel.title = @"飞机模型操作";
    
    LCHomeCollectionSectionModel *sectionModel = [[LCHomeCollectionSectionModel alloc]initWithModel:nil];
 
    sectionModel.sectionTyp = LCBigImage;
    sectionModel.sectionTitle = @"免费好课";
    sectionModel.data = @[cellmodel,cellmodel,cellmodel,cellmodel];
    
    LCHomeCollectionSectionModel *sectionModel2 = [[LCHomeCollectionSectionModel alloc]initWithModel:nil];
   
    sectionModel2.sectionTyp = LCBigImageAddText;
    sectionModel2.sectionTitle = @"畅销好可";
    sectionModel2.data = @[cellmodel,cellmodel,cellmodel,cellmodel];
    
    LCHomeCollectionSectionModel *sectionModel3 = [[LCHomeCollectionSectionModel alloc]initWithModel:nil];
    /*
     LCNormail,
     LCBigImageAddText,
     LCBigImage
     */
    sectionModel3.sectionTyp = LCBigImage;
    sectionModel3.sectionTitle = @"免费好课";
    sectionModel3.data = @[cellmodel,cellmodel,cellmodel,cellmodel];
    
    self.mutableDataArr = @[sectionModel,sectionModel2,sectionModel3].mutableCopy;
    self.dataSource = self.mutableDataArr.copy;

}
@end
