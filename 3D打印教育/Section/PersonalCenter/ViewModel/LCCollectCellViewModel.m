//
//  LCCollectCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCollectCellViewModel.h"
#import "LCCollectCourseModel.h"
@implementation LCCollectCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCCollectCourseList *collectCourseModel = model;
        self.leftImageURL = [NSURL URLWithString:collectCourseModel.image];
        self.topStr = collectCourseModel.name;
        self.middleStr = [NSString stringWithFormat:@"讲师: %@",collectCourseModel.teacher_name];
        self.bottomStr = [NSString stringWithFormat:@"收藏时间: %@",collectCourseModel.created_time];
        self.courseIID = collectCourseModel.iid;
    }
    return self;
}
@end
