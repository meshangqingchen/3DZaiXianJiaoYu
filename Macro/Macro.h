//
//  Macro.h
//  无限教育
//
//  Created by 3D on 16/10/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCALE ([UIScreen mainScreen].scale)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//搜索条的宽度
#define SEARCHTEXTFIELD_W SCREEN_WIDTH * 630 / 750
#define SEARCHTEXTFIELD_FREAM CGRectMake(15, 7, SEARCHTEXTFIELD_W, 30)

// 颜色(RGB)
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//状态栏、导航栏、标签栏高度
#define STATUS_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)
#define NAVIGATIONBAR_HEIGHT (self.navigationController.navigationBar.frame.size.height)
#define TABBAR_HEIGHT (self.tabBarController.tabBar.frame.size.height)

//判断设备
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define kKeyWindow [UIApplication sharedApplication].keyWindow

//打印日志
#ifdef DEBUG
#define MYLog(fmt, ...)  NSLog((@"[%s Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define MYLog(fmt, ...)
#endif

#define kMBPROGRESSHUD_LABEL_TEXT @"加载中..."

#define  kBadgeTipStr @"badgeTip"

#define kStrFormat(str,...) [NSString stringWithFormat:str,##__VA_ARGS__]

#define kSharedAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#endif /* Macro_h */
