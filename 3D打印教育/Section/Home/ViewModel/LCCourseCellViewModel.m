//
//  LCCourseCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseCellViewModel.h"

@implementation LCCourseCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        NSDictionary *dic = model;
        
        self.title = dic[@"title"];
        self.videoUrl = [NSURL URLWithString:dic[@"url"]];
    }
    return self;
}
@end
