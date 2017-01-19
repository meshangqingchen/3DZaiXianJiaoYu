//
//  LCUserTeacherTalkViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCUserTeacherTalkViewModel : BaseTableViewModel
@property(nonatomic,strong) NSURL *teacherImageURL;
@property(nonatomic,strong) NSString *teacherIID;


@property(nonatomic,copy) void(^sendMassage)(NSString *messageString);
@property(nonatomic,copy) void(^sendMassageSessed)();

@end
