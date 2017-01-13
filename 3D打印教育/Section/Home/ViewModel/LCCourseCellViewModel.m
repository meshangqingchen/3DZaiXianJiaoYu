//
//  LCCourseCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseCellViewModel.h"
#import "LCHomeDetailModel.h"
@implementation LCCourseCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCVideoDetailVideolist *videoList = model;

        self.idd = videoList.iid;
        self.title = videoList.name;
        self.imageURL = [NSURL URLWithString:videoList.img];
        self.videoURL = [NSURL URLWithString:videoList.url];
        self.creatTime = videoList.created_time;
    
    }
    return self;
}
@end
