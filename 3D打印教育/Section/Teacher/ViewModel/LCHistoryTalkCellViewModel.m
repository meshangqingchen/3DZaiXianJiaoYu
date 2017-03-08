//
//  LCHistoryTalkCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCHistoryTalkCellViewModel.h"
#import "LCHistoryTalkTeacherModel.h"
@implementation LCHistoryTalkCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        
        LCHistoryTalkContents *hisTeacherModel = model;
        self.name = hisTeacherModel.nick_name;
        self.avatarURL = [NSURL URLWithString:hisTeacherModel.avatar];
        self.time = hisTeacherModel.time;
        self.lastMG = hisTeacherModel.message;
        self.teacherID = hisTeacherModel.iid;
     }
    return self;
}
@end
