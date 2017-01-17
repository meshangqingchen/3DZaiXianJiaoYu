//
//  LCCourseClassFCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassFCellViewModel.h"
#import "LCCourseClassModel.h"
@implementation LCCourseClassFCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCCourseClassContents *courseClassFModel = model;
        self.iid = courseClassFModel.iid;
        self.leftTitle = courseClassFModel.name;
        self.imageURL = [NSURL URLWithString:courseClassFModel.img];
        NSMutableArray *mutableArray = [NSMutableArray new];
        for (int i=0; i<courseClassFModel.sonList.count; i++) {
            LCCourseClassSonlist *sonList = courseClassFModel.sonList[i];
            LCCourseClassSCellViewModel *sonListVM = [[LCCourseClassSCellViewModel alloc]initWithModel:sonList];
            [mutableArray addObject:sonListVM];
        }
        if (mutableArray.count%2) {
            LCCourseClassSCellViewModel *sonListVM  = [[LCCourseClassSCellViewModel alloc]initWithModel:nil];
            [mutableArray addObject:sonListVM];
        }
        self.sonList = mutableArray.copy;
    }
    return self;
}
@end
