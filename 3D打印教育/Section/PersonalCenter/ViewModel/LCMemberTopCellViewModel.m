//
//  LCMemberTopCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberTopCellViewModel.h"
#import "NSString+PJR.h"
@implementation LCMemberTopCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self =  [super init]) {
        NSString *time = model;
        self.stopTime = [NSString getDataStrWithIntStr:time];
    }
    return self;
}
@end
