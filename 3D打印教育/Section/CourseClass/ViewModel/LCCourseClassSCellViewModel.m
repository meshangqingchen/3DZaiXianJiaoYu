//
//  LCCourseClassSCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassSCellViewModel.h"
#import "LCCourseClassModel.h"
@implementation LCCourseClassSCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCCourseClassSonlist *sonlist = model;
        self.title = sonlist.name;
        self.iid = sonlist.iid;
    }
    return self;
}
@end
