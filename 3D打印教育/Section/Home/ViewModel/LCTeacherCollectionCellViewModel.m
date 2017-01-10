//
//  LCTeacherCollectionCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeacherCollectionCellViewModel.h"
#import "LCHomeModel.h"
@implementation LCTeacherCollectionCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCHomeTeacherlist *teacherList = model;
        
        self.name = teacherList.nick_name;
        self.headImageURL = [NSURL URLWithString:teacherList.avatar];
        self.introduce = teacherList.position;
        self.textViewText = teacherList.shot_discription;
        self.teacherID = teacherList.iid;
        
    }
    return self;
}
@end
