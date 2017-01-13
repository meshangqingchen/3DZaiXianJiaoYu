//
//  LCIntroViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCIntroViewModel : BaseViewModel
//@property(nonatomic,copy) void (^networkRequests)(NSString *videoID);
@property(nonatomic,copy) void (^bindViewModel)(id viewModel);

@property(nonatomic,copy) void (^fromVideoVMGetData)(id model);

@end
