//
//  LCJoinCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCJoinCellViewModel.h"
#import "LCJoinCourseModel.h"
@implementation LCJoinCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCJoinCourseContents *joinCourseModel = model;
        self.leftImageURL = [NSURL URLWithString:joinCourseModel.image];
        self.topStr = joinCourseModel.name;
        self.middleStr = [NSString stringWithFormat:@"¥: %@",joinCourseModel.price];
        self.bottomStr = [NSString stringWithFormat:@"参加课程时间: %@",joinCourseModel.created_time];
        self.courseIID = joinCourseModel.iid;
    }
    return self;
}
@end
