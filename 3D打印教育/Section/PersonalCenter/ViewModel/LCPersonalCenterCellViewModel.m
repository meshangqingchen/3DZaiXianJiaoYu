//
//  LCPersonalCenterCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPersonalCenterCellViewModel.h"

@implementation LCPersonalCenterCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        //@{@"titleName":@"个人动态",@"imageName":@"gerendongtai"}
        NSDictionary *dic = model;
        self.titleName = dic[@"titleName"];
        self.imageName = dic[@"imageName"];
    }
    return self;
}
@end
