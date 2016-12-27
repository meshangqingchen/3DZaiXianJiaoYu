//
//  LCCourseCellSonViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseCellSonViewModel.h"

@implementation LCCourseCellSonViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        //@{@"title":@"第一个分区的第一个视频",@"url":@"!区___"}
        NSDictionary *dic = model;
        self.title = dic[@"title"];
        self.videoURL = [NSURL URLWithString:dic[@"url"]];
    }
    return self;
}
@end
