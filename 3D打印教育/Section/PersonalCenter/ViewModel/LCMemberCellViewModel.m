//
//  LCMemberCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberCellViewModel.h"
#import "LCMembersPriceModel.h"

@implementation LCMemberCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCMemberPriceContents *memberPriceContents = model;
        self.iid = memberPriceContents.iid;
        self.longTime = memberPriceContents.longTime;
        self.name = memberPriceContents.name;
        self.price = memberPriceContents.price;
    }
    return self;
}
@end
