//
//  LCCounselTeacherCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCounselTeacherCellViewModel.h"
#import "LCCounselTeacherModel.h"
@implementation LCCounselTeacherCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCTeacherModel *teacherModel = model;
        self.nickName = teacherModel.nick_name;
        self.headInageURL = [NSURL URLWithString:teacherModel.avatar];
        self.shortDis = teacherModel.shot_discription;
        self.teacherID = teacherModel.iid;
    }
    return self;
}
@end
