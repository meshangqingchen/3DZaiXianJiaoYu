//
//  AppDelegate.h
//  3D打印教育
//
//  Created by 3D on 16/12/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCNavigationStackService.h"
#import <AFNetworkReachabilityManager.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong,readonly) LCNavigationStackService *navigationStackService;
@property(nonatomic,assign,readonly) AFNetworkReachabilityStatus networkStatus;


@property(nonatomic,strong) void (^payForZixunSucceed)();
@property(nonatomic,strong) void (^payForCourseSucced)();
@property(nonatomic,strong) void (^payForMemberCarSucced)(NSString *stopTime);
@end

