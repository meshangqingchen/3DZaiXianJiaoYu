//
//  NSDateUtils.h
//  KD_Tools
//
//  Created by BigData on 16/7/26.
//  Copyright © 2016年 kingdream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateUtils : NSObject
//注意：所有的long long类型的date参数的单位均是秒

+ (NSDate *)dateFromyyyyMMddHHmmssString:(NSString *)str;

+ (NSDate *)dateFromyyyyMMddString:(NSString *)str;

+ (NSString *)getyyyyMMddDate:(long long)date;

+ (NSString *)getyyyyMMddLongLongValueFromDate:(NSDate *)date;

+ (NSString *)getMMddDate:(long long)date;

+ (NSString *)get24Time:(long long)date;

+ (NSString *)get12Time:(long long)date;

/// 根据系统24or12小时设置的格式返回时间串
+ (NSString *)get24Or12TimeBySystemSetting:(long long)date;

+ (NSString *)get24Or12TimeHHmmStr:(long long)date;

/// 判断系统时间是否为12小时制。Return：YES12小时制；NO24小时制
+ (BOOL)is12HourClockIniOS;

+ (NSString *)getTimeStrByDate:(NSDate *)date;

/// 返回date与当前日期相差的天数 返回0当天天，1昨天，2前天，以此类推
+ (NSInteger)getDaysFromAnotherDay:(long long)date;

#pragma mark - Get Single Value
//返回197001001至date的天数。date：1970到现在的秒数
//+ (long long)getDaysFrom1970:(long long)date;

+ (NSInteger)getYear:(long long)date;

+ (NSInteger)getMonth:(long long)date;

+ (NSInteger)getDay:(long long)date;

/// 获得星期几，1星期天；2星期一。。。。。7星期六
+ (NSInteger)getWeekDay:(long long)date;

+ (NSInteger)getHour:(long long)date;

+ (NSInteger)getMinute:(long long)date;

+ (NSInteger)getSecond:(long long)date;

#pragma mark - 朋友圈显示时间转换

+ (NSString *)getSocialTime:(long long)date;
/// @"yyyy-MM-dd HH:mm:ss" 转朋友圈时间
+ (NSString *)getSocialTimeForDateStr:(NSString *)dateStr;

#pragma mark - DialogListTime

+ (NSString *)getDialogListTime:(long long)lastMessageTime;
+ (NSString *)getDialogDay:(long long)lastMessageTime;
#pragma mark - video时间转换
/// 00:00:00
+ (NSString *)videoTimeOfTimeInterval:(NSTimeInterval)timeInterval;

#pragma mark - 获取时间戳
- (NSString *)getTimeStamp;

@end
