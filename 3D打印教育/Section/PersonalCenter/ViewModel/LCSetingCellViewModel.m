//
//  LCSetingCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSetingCellViewModel.h"

@implementation LCSetingCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
//        @{@"leftTitle":@"退出",@"middleTitle":@"",@"rightType":@"kong"}
        NSDictionary *dic = model;
        self.leftTitle = dic[@"leftTitle"];
        self.middleTitle = dic[@"middleTitle"];
        NSString *type = dic[@"rightType"];
       
        if ([type isEqualToString:@"jiantou"]) {
            self.rightTyp = jiantou;
        }else if ([type isEqualToString:@"kaiguan"]){
            self.rightTyp = kaiguan;
        }else if ([type isEqualToString:@"shuzi"]){
            self.rightTyp = shuzi;
        }else if ([type isEqualToString:@"kong"]){
            self.rightTyp = kong;
        }
    }
    return self;
}
@end
