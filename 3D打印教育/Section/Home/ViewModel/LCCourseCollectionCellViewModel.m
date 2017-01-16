//
//  LCCourseCollectionCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseCollectionCellViewModel.h"
#import "LCCourseListModel.h"
@implementation LCCourseCollectionCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCCourseModel *courseModel = model;
        self.title = courseModel.name;
        self.iid = courseModel.iid;
        self.imageURL = [NSURL URLWithString:courseModel.image];
    }
    return self;
}
@end
