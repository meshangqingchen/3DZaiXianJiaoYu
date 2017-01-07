//
//  LCPersonalCenterHeaderViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPersonalCenterHeaderViewModel.h"

@implementation LCPersonalCenterHeaderViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        NSDictionary *dic = model;
        //@{@"nickName":@"登录/注册",@"headerImageURL":@"---",@"signatureLB":@"",@"ifneedLog":@1}
        self.headerImageURL = [NSURL URLWithString:dic[@"headerImageURL"]];
        self.topTitle = dic[@"topTitle"];
        self.signature = dic[@"signature"];
        if ([dic[@"ifneedLog"] isEqualToNumber:@0]) {
            self.ifNeedLog = NO; //不需要登录
        }else{
            self.ifNeedLog = YES;
        }
    }
    return self;
}
@end
