//
//  LCMyCourseCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMyCourseCellViewModel.h"

@implementation LCMyCourseCellViewModel

-(instancetype)initWithModel:(id)viewModel{
    if (self = [super init]) {
        NSDictionary *dic = viewModel;
        self.title = dic[@"title"];
        self.finishStr = dic[@"finished"];
    }
    return self;
}
@end
