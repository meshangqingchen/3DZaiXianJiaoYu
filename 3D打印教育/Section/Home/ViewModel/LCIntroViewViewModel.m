//
//  LCIntroViewViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/11.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCIntroViewViewModel.h"
#import "LCHomeDetailModel.h"
@implementation LCIntroViewViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCHomeDetailModel *homeDetailModel = model;

        self.favCount = homeDetailModel.contents.fav_count;
        self.teacherHeaderURL = [NSURL URLWithString:homeDetailModel.contents.teacher.avatar];
        self.teacherShaortDiscriptions = homeDetailModel.contents.teacher.shot_discription;
        self.courseNamel = homeDetailModel.contents.name;
        self.courseDisCription = homeDetailModel.contents.des;
    }
    return self;
}
@end
