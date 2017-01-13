//
//  LCLoginViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCLoginViewModel : BaseViewModel
@property(nonatomic,copy) void(^goToForgotVC)();
@property(nonatomic,copy) void(^goToRegisterdVC)();
@property(nonatomic,copy) void (^goBackVC)();

@property(nonatomic,copy) void (^login)(NSString *phoneNum , NSString *password);

@end
