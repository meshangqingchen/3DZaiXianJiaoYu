//
//  LCUseOldPaswordChangePaswordViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCUseOldPaswordChangePaswordViewModel : BaseViewModel
@property(nonatomic,copy) void (^changePassword)(NSString *oldPassword,NSString *newPassword,NSString *anewPassword);
@end
