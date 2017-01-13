//
//  LCIntroViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCIntroViewModel.h"
#import "LCHomeDetailModel.h"
#import "LCIntroViewViewModel.h"
@implementation LCIntroViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setFromVideoVMGetData:^(id model) {
        @strongify(self)
        
        LCHomeDetailModel *homeDetailModel = model;
        LCIntroViewViewModel *introViewViewModel = [[LCIntroViewViewModel alloc]initWithModel:homeDetailModel];
        //拿到数据传给 控制器
        !self.bindViewModel ? : self.bindViewModel(introViewViewModel);
    }];
}
@end
