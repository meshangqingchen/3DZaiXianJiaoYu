//
//  LCZheKouQuanViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCZheKouQuanViewModel.h"
#import "LCMyCouponModel.h"
#import "LCCouponCellViewModel.h"
@implementation LCZheKouQuanViewModel
-(void)initialize{
    [super initialize];
    
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    [self.netApi_Manager myCouponCompleteHandle:^(id responseObj, NSError *error) {
        MYLog(@"%@",responseObj);
        LCMyCouponModel *couponModel = [LCMyCouponModel parseJSON:responseObj];
        NSArray<Discountcouponlist *> *discountCouponList = couponModel.contents.discountCouponList;
        for (int i = 0; i<discountCouponList.count; i++) {
            LCCouponCellViewModel *couponCellVM = [[LCCouponCellViewModel alloc]initWithModel:discountCouponList[i]];
            [self.mutableDataArr addObject:couponCellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}

@end
