//
//  LCPeiXunClassDetailViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPeiXunClassDetailViewModel.h"
#import "LCBaoMingViewModel.h"
@implementation LCPeiXunClassDetailViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setBaoMing:^{
        /*
         @property(nonatomic,strong) NSString *name;
         @property(nonatomic,strong) NSString *long_time;
         @property(nonatomic,strong) NSString *descrip;
         @property(nonatomic,strong) NSString *classIID;
         @property (nonatomic, copy) NSString *price;
         @property (nonatomic, copy) NSString *online_price;*/
        @strongify(self)
        LCBaoMingViewModel *baomingVM = [[LCBaoMingViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"在线报名"}];
        baomingVM.topTitle = [NSString stringWithFormat:@"%@(%@元/%@天)",self.name,self.price,self.long_time];
        baomingVM.long_time = self.long_time;
        baomingVM.price = self.price;
        baomingVM.classIID = self.classIID;
        baomingVM.online_price = self.online_price;
        baomingVM.baomingTyp = jiChuPeiXun;

        [self.navigationStackService pushViewModel:baomingVM animated:YES];

    }];
}
@end
