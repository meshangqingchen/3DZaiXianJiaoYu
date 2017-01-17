//
//  LCEditPersonalDetailViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"
#import "LCUserModel.h"
@interface LCEditPersonalDetailViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^changeHeadImage)(UIImage * headImage);//上传头像
@property(nonatomic,copy) void (^selectSex)(NSString  *sexStr);  //编辑性别
@property(nonatomic,strong) LCUser *selfCreatUser;
@end
