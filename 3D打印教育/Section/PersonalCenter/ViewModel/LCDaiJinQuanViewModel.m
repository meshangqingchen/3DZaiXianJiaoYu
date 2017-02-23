//
//  LCDaiJinQuanViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCDaiJinQuanViewModel.h"
#import "LCMyCouponModel.h"
#import "LCCouponCellViewModel.h"
#import "LCCourseCollectionViewModel.h"
@implementation LCDaiJinQuanViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setPushCourseList:^{
        @strongify(self)
        LCCourseCollectionViewModel *courseCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"课程"}];
        [self.navigationStackService pushViewModel:courseCollectionVM animated:YES];
    }];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    [self.netApi_Manager myCouponCompleteHandle:^(id responseObj, NSError *error) {
        MYLog(@"%@",responseObj);
        LCMyCouponModel *couponModel = [LCMyCouponModel parseJSON:responseObj];
        NSArray<Cashcouponlist *> *cashCouponList = couponModel.contents.cashCouponList;
        for (int i = 0; i<cashCouponList.count; i++) {
            LCCouponCellViewModel *couponCellVM = [[LCCouponCellViewModel alloc]initWithModel:cashCouponList[i]];
            couponCellVM.pushCourseList = self.pushCourseList;
            [self.mutableDataArr addObject:couponCellVM];            
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}
@end
