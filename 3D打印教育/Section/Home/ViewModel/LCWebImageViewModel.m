//
//  LCWebImageViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCWebImageViewModel.h"
#import "LCBaoMingViewModel.h"


@implementation LCWebImageViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setBaoMing:^{
        @strongify(self)
        LCBaoMingViewModel *baomingVM = [[LCBaoMingViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"在线报名"}];
        baomingVM.topTitle = @"谢菲尔德大学3D打印硕士留学申请";
        baomingVM.baomingTyp = shuoShi;
        [self.navigationStackService pushViewModel:baomingVM animated:YES];
    }];
}

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.className = params[@"className"];
        self.webURl = params[@"webURL"];
    }
    return self;
}
@end
