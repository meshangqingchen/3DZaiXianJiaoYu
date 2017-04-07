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
//搜索条fream
//#define SEARCHTEXTFIELD_FREAM CGRectMake(132, 8, SCREEN_WIDTH-132-15, 30)
//普通collectionCell的宽度
#define NORMALE_COLLECTIONCELL_W (SCREEN_WIDTH - 40)/2
#define NORMALE_COLLECTIONCELL_H (NORMALE_COLLECTIONCELL_W)*306/355
//图加字
#define BIGIMAGEADDTEXT_W SCREEN_WIDTH-30
#define BIGIMAGEADDTEXT_H (BIGIMAGEADDTEXT_W)*377/690
//纯图片
#define BIGIMAGE_W  SCREEN_WIDTH-30
#define BIGIMAGE_H  (BIGIMAGE_W) * 290 / 690
//轮播高
#define BANANER_H (SCREEN_WIDTH)*300/750+95+39
//每个sectionHead的高
#define SECTION_H  39
//视频的高
#define VIDEO_H (SCREEN_WIDTH)*9/16 
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

#define LCCLOIN_AUTO @"LCClogin_auto"  //自动登录的key LCCRSA2PRIVATEKEY
#define LCCBOFANG    @"LCCBOFANG"      //设置界面 开关的状态
#define LCCORDER_SN  @"order_sn"

//#define LCCLAUNCHTOPIMAGEDATA  @"LCCLaunchImageData"
//登录返回有活动 就根据key存偏好设置
#define LCACTIVEMSG            @"activeCouponMessage" 
//登录新人注册 就根据key存偏好设置
#define LCNEWUSERMSG           @"registerCouponMessage"


#define LCCRSA2PRIVATEKEY  @"MIIEpQIBAAKCAQEAvd/xpAFXEeELGqGSVujQNx7KPdw6P5uOJ3Us7KBMsiR1a0pSIW7S9VYuo9x7C9uNNs8btG7DxQ+W4ZdxGkiePcjBANwUS0cjiKzmBCXub9g8/IoKGr/8IDHb9MO7q8Z5zyj57GZ3R6I0UoeEHcl28CYOX08YLhDX0qVCMRe8GCLTC9uiJxXQsYHXE4eZb2lxvwxuJduW7Yw2BNRdpFIc/T/NSpYFSuMdUsR7/OlSEGQLMjGThXeYms/+YRkA2Cawellc0yDzQQpbN1BpJgmghs/S+yio23Z95oGYu/aVNqV6vJCXt5YRh4wYEB3Cb7tnjnLbbYsPVpxSwPJsnrfYPQIDAQABAoIBAQCVxYMG2iPDL5+hpxcWxNgQ0pG2z/OGXv53s173W86DqmyQb/Ru+MsgyJVLncvVY551QFLbNY/o7k4Wrm2BzQw9MhDDy9WaN4gY9EEPvpfg01Hv5jboOM342ztkS8zKR2mn9euGBKFL+O+KteiJ0nOmJG6r0WkCVTjYqJCYxt8QrXGFQu9Jyuv8RZ2h+Em472CJQsHO3SjYVMjqpg2NnP5bCKgbtT3QpCW6SxRw7gZ3M8Ae+bOEqo5b+P6XknNnyaou2WmLRV0dPx5IR8PKV5XppD+QBrmquLFWwmI+q2K7upghQA5/L9TW2P48cGJOCYqGm4IKX1qqb2JsAfSrDNKhAoGBAPaz8A3R8lrkJIalH3cHSz13vZiidiVLZqi7+IdRSQjRRMiatLByoC4Oxwulw/UWazUO+SPRHM83Hu9Q+o4yYX8+yeakdtPMTycf3UZh2DnPi+z3BH/OJ79GYV1M3/X2y85hM3VWUMjUhI9NSJgpPKwyq+qliI6BOcy50qqG8bfZAoGBAMUHwgnNoKkssJ1D+PDiZnfcqZsqDh/hnWv4Mt6pEilAutkWNEWeGVXAppb93yjxgLicA3YGzBYPfm95GUmv9h6TUag+r2PYw1PJxUBmPAb4bKnSXvkpqWNTbwpMeEu2I9jMSoVAuoZ+VvS5oOle6iubh9PWM1sTG51j1z2rCakFAoGBAJ7glvJviOLcFmHYKYFgYyY83Q9VYTz3aC+2joGm6aASFXgTmdYgm+PNhIaNxLssKvLKp8xXOXSBjRyWTCYTcBKgfypYNGaGJ1uM+9X94WCptvVux6j/PT3Dt6R8g6dFv08z7g3c/r23j38ySFQmCnrjTzAYVu9fbbfY3EESEs1RAoGBAK02r8hMhPSVPENVsXGbp7eyP00QwNAYWXvE/HuxKS0pIdqdYaDeZ6lyr0HIuDpXbfFd/tDxEtRGFMJNNQUJ85ZXrw745NojgzyTAp0mA5mhJm55alMj5C1U+SaVqZ/t5T/AAbd5+0EnqqyE0Mi5T6a8mcGK6yUi/ED2uBAX4Gs9AoGAYjnkaoDWHm+g1fyUh8J0SGyQLYW7x6QL6CuXDYy+/0Vn2f/3V5uheHgZOM/AyEiu6IYrZUZ9FjxDdX3NDChvOIZBGQYEzVP1mzkbCZvav/d4O10T2qobrQQcKBxmNN8VyFDDpNn/nuEG0hc3kIhcjjFcb8ASpH8PLa42cN057Ts="

// 缓存主目录
#define HSCachesDirectory [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"LCCache"]

// 保存文件名
#define HSFileName(url) url.md5String

// 文件的存放路径（caches）
#define HSFileFullpath(url) [HSCachesDirectory stringByAppendingPathComponent:HSFileName(url)]

// 文件的已下载长度
#define HSDownloadLength(url) [[[NSFileManager defaultManager] attributesOfItemAtPath:HSFileFullpath(url) error:nil][NSFileSize] integerValue]
#endif /* Macro_h */
