
//  BaseCollectionViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@implementation BaseCollectionViewModel
-(void)initialize{
    [super initialize];
    self.shouldPullToRefresh = NO;
    self.shouldInfiniteScrolling = NO;
    self.mutableDataArr = [NSMutableArray array];
    self.curpage = 1;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void(^)(id responseObj))complete{}
@end
