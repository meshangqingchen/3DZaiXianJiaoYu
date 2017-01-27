//
//  LCUserTeacherTalkViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCUserTeacherTalkViewModel : BaseTableViewModel
//老师得teacherID 和 teacherImageURL是传过来的.
@property(nonatomic,strong) NSURL *teacherImageURL;
@property(nonatomic,strong) NSString *teacherIID;
//userImageURL是通过接口网络得到的.
@property(nonatomic,strong) NSURL *userHeadImageURL;


@property(nonatomic,copy) void(^sendMassage)(NSString *messageString);
@property(nonatomic,copy) void(^sendMassageSessed)();

@end
