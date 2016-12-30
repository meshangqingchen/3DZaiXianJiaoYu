//
//  LCMessageViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCMessageViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^headerViewBindViewModel)(id viewModel);
@property(nonatomic,copy) void (^clickHeaderViewBT)(NSString *userID);//可能不用 用户ID

@end
