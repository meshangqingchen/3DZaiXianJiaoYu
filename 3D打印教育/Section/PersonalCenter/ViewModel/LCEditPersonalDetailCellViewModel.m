//
//  LCEditPersonalDetailCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCEditPersonalDetailCellViewModel.h"

@implementation LCEditPersonalDetailCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
//        @{@"leftTitle":@"头像",@"rightTitle":@" ",@"rightImageUrl":@"----"}
        NSDictionary *dic = model;
        self.leftTitle = dic[@"leftTitle"];
        self.rightTitle = dic[@"rightTitle"];
        if (dic[@"rightImageUrl"]) {
            self.headerViewHidden = NO;
            self.rightURL = [NSURL URLWithString:dic[@"rightImageUrl"]];
        }else{
            self.headerViewHidden = YES;
        }
    }
    return self;
}
@end
