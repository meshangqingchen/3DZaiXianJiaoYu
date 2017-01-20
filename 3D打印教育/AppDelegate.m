//
//  AppDelegate.m
//  3D打印教育
//
//  Created by 3D on 16/12/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "AppDelegate.h"
#import <PLeakSniffer/PLeakSniffer.h>
#import <UIKit+AFNetworking.h>
#import <IQKeyboardManager.h>
#import <AlipaySDK/AlipaySDK.h>
#import "KDFileManager.h"

#import "BaseViewModel.h"
#import "LCRootViewModel.h"
#import "LaunchViewController.h"
#import "KDNetAPIManager_User.h"
#import "LCUserTeacherTalkViewController.h"

@interface AppDelegate ()
@property(nonatomic,strong,readwrite) LCNavigationStackService *navigationStackService;
@property(nonatomic,assign,readwrite) AFNetworkReachabilityStatus networkStatus;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureKeyboardManager];
    [self configureReachability];
    [self configureAppearance];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [LaunchViewController new];
    [self.window makeKeyAndVisible];
    
    
    [KDFileManager removeUserDataForkey:LCENCRYPTKey];
    if ([KDFileManager readUserDataForKey:LCCLOIN_AUTO]) {
        [[KDNetAPIManager_User sharedKDNetAPIManager_User]loginWithAuto:[KDFileManager readUserDataForKey:LCCLOIN_AUTO] completeHandle:^(id responseObj, NSError *error) {
            NSNumber *status = responseObj[@"status"];
            if ([status isEqualToNumber:@1]) {
                //如果状态是1 就代表自动登录成功了
                NSDictionary *contents = responseObj[@"contents"];
                NSString     *encryptKey = contents[@"key"];
                [KDFileManager saveUserData:encryptKey forKey:LCENCRYPTKey];
            }
            
            self.navigationStackService = [[LCNavigationStackService alloc]init];
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [self.navigationStackService resetRootViewModel:[self createRootViewModel]];
            [self.window makeKeyAndVisible];
        }];
    }else{
        self.navigationStackService = [[LCNavigationStackService alloc]init];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [self.navigationStackService resetRootViewModel:[self createRootViewModel]];
        [self.window makeKeyAndVisible];
    }
    return YES;
}

- (void)configureKeyboardManager
{
    IQKeyboardManager.sharedManager.enableAutoToolbar = NO;
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
    [[[IQKeyboardManager sharedManager] disabledTouchResignedClasses] addObject:[LCUserTeacherTalkViewController class]];
}

- (void)configureReachability
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    //网络状态监测
    @weakify(self)
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        MYLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        @strongify(self);
        self.networkStatus = status;
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)configureAppearance {
    // 0x2F434F
    [UINavigationBar appearance].barTintColor = [KDColor getX1Color];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlackOpaque;
//    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].translucent = NO;
//    [UISegmentedControl appearance].tintColor = [UIColor whiteColor];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (BaseViewModel *)createRootViewModel
{
    return [[LCRootViewModel alloc] initWithServices:self.navigationStackService params:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            NSNumber *resultStatusNUM =resultDic[@"resultStatus"];
            NSString *resultStatusSTR =resultDic[@"resultStatus"];
            if ([resultStatusSTR isEqualToString:@"9000"]) {
                NSString *order_sn = [KDFileManager readUserDataForKey:LCCORDER_SN];
                MYLog(@"%@",order_sn);
                MYLog(@"%@",order_sn);
                
                //29000000000002801 19000000000002801
                NSString *firstStr = [order_sn substringToIndex:1];
                MYLog(@" - -%@",firstStr);
                MYLog(@" - -%@",firstStr);
                if ([firstStr isEqualToString:@"1"]) {
                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithZiXunOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                            [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithZiXunOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithZiXunOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                            MYLog(@"真的错了 调了三次还是错的");
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                    !self.payForZixunSucceed ? : self.payForZixunSucceed();
                    self.payForZixunSucceed = nil;
                }else if ([firstStr isEqualToString:@"2"]){
                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                            [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                    [[KDNetAPIManager_User sharedKDNetAPIManager_User] paySucceedWithCourseOrder_sn:order_sn completeHandle:^(id responseObj, NSError *error) {
                                        if ([responseObj[@"status"] isEqualToNumber:@0]) {
                                            MYLog(@"真的错了 调了三次还是错的");
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                    !self.payForCourseSucced ? : self.payForCourseSucced();
                    self.payForCourseSucced = nil;
                }
            }
        }];
    }
    return YES;
}


@end
