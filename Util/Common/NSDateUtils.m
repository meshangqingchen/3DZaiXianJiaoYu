//
//  NSDateUtils.m
//  KD_Tools
//
//  Created by BigData on 16/7/26.
//  Copyright © 2016年 kingdream. All rights reserved.
//

#import "NSDateUtils.h"

@implementation NSDateUtils

+ (NSDate *)dateFromyyyyMMddHHmmssString:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}

+ (NSDate *)dateFromyyyyMMddString:(NSString *)str {
    NSDate *date = [[self shareyyyyMMddNSDateFormatter] dateFromString:str];
    return date;
}

+ (NSString *)getyyyyMMddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyyMMddLongLongValueFromDate:(NSDate *)date {
    NSString *yyyyMMddStr = [[self shareyyyyMMddNSDateFormatter] stringFromDate:date];
    return yyyyMMddStr;
}

+ (NSString *)getMMddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getddMMMMDate:(long long )date {//显示英文月份全称 如09-Septemper
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"dd-MMMM"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getddMMMDate:(long long )date {//显示英文月份简称 如09-Sep
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"dd-MMM"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get24Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}


+ (NSString *)gethhmm12Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:[languages objectAtIndex:0]]];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get12Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:[languages objectAtIndex:0]]];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get24Or12TimeBySystemSetting:(long long)date
{
    //    if( [self is12HourClockIniOS]){
    //        return  [self get12Time:date];
    //    }else{
    return  [self get24Time:date];
    //    }
}

+ (NSString *)get24Or12TimeHHmmStr:(long long)date
{
    if( [self is12HourClockIniOS]){
        return  [self gethhmm12Time:date];
    }else{
        return  [self get24Time:date];
    }
}

+ (BOOL)is12HourClockIniOS{
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale autoupdatingCurrentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    return containsA.location != NSNotFound;
}

+ (NSString *)getTimeStrByDate:(NSDate *)date {
    if (date == nil)
        return @"";
    
    NSMutableString *displayStr = [NSMutableString string];
    NSDate *now = [NSDate date];
    NSTimeInterval time = [now timeIntervalSinceDate:date];
    
    
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    [dateFormatter setDateFormat:@"HH"];
    int nowHour = [[dateFormatter stringFromDate:now] intValue];
    int days_ago = ((int)time + 3600*(24-nowHour))/(3600*24);
    
    if (days_ago == 0) {
        [displayStr appendString:[NSString stringWithFormat:@"今天 %@", timeStr]];
    } else if(days_ago == 1) {
        [displayStr appendString:[NSString stringWithFormat:@"昨天 %@", timeStr]];
    } else if(days_ago == 2) {
        [displayStr appendString:[NSString stringWithFormat:@"前天 %@", timeStr]];
    } else {
        if(dateStr&&dateStr.length > 0)
            [displayStr appendString:dateStr];
    }
    return displayStr;
}

//返回0 当天，1昨天，2前天，以此类推
//之前那样用时间差来整除一天的秒数，计算出来的天数有误差
+ (NSInteger)getDaysFromAnotherDay:(long long)date {
    //    return [self getDaysFrom1970:date] - [self getDaysFrom1970:[[NSDate date] timeIntervalSince1970]];
    //    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //    [comps setDay:[NSDateUtils getDay:date]];
    //    [comps setMonth:[NSDateUtils getMonth:date]];
    //    [comps setYear:[NSDateUtils getYear:date]];
    //    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //    NSDate *endDate = [[NSDate alloc] init];
    //    NSDate *startDate = [gregorian dateFromComponents:comps];
    //    [comps release];
    //    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    //    NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:startDate toDate:endDate options:0];
    //    [gregorian release];
    //    [endDate release];
    ////    int days = [comps2 day];
    //    NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
    //    NSInteger days = ((NSInteger)interval)/(3600*24);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    NSDate *today = [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
    NSDate *startDate = [dateFormatter dateFromString:[NSDateUtils getyyyyMMddDate:date]];
    NSDate *formatterStartDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:startDate]];
    NSTimeInterval interval = [today timeIntervalSinceDate:formatterStartDate];
    NSInteger days = ((NSInteger)interval)/(3600*24);
    return days;
}

#pragma mark - Get Single Value
//+ (long long)getDaysFrom1970:(long long)date {
//    return date / 86400;
//}

+ (NSInteger)getYear:(long long)date {
    return [[self getNSDateComponents:date] year];
}

+ (NSInteger)getMonth:(long long)date {
    return [[self getNSDateComponents:date] month];
}

+ (NSInteger)getDay:(long long)date {
    return [[self getNSDateComponents:date] day];
}

+ (NSInteger)getWeekDay:(long long)date {
    return [[self getNSDateComponents:date] weekday];
}

+ (NSInteger)getHour:(long long)date {
    return [[self getNSDateComponents:date] hour];
}

+ (NSInteger)getMinute:(long long)date {
    return [[self getNSDateComponents:date] minute];
}

+ (NSInteger)getSecond:(long long)date {
    return [[self getNSDateComponents:date] second];
}

+ (NSDateComponents *)getNSDateComponents:(long long)date {
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [[self shareNSCalendar] components:unitFlags fromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    return comps;
}

#pragma mark - Share Instance 减少创建NSDateFormatter、NSCalendar等的开销

+ (NSCalendar *)shareNSCalendar
{
    static NSCalendar *calendar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    });
    return calendar;
}

+ (NSDateFormatter *)shareyyyyMMddNSDateFormatter
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter= [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
    });
    return dateFormatter;
}

#pragma mark -
#pragma mark - 朋友圈显示时间转换

+ (NSString *)getSocialTime:(long long)date{
    NSString *timeStr = nil;
    
    //    //获取当前时间
    //	NSDate *daten = [NSDate date];
    //    //当前秒数
    //    double localTime = [daten timeIntervalSince1970];
    //    //服务器秒数
    //    double serverTime = (double)( date / 1000 );
    //    double c = fabs(localTime-serverTime);
    //
    //    if (c<60) {//小于1分钟
    //        timeStr = [NSString stringWithFormat:@"%@",NSInternational(@"General_Now")];
    //    }else if (c >=60 && c<60*60){//小于一小时
    //        int n = c/(60);
    //        timeStr = NSInternationalFormat(@"General_Minute", [NSString stringWithFormat:@"%d",n]);
    //    }else if (c >= 60*60 && c< 60*60*24){//小于一天
    //        int n = c/(60*60);
    //        if (n == 1) {
    //            timeStr = NSInternationalFormat(@"General_Hour", [NSString stringWithFormat:@"%d",n]);
    //        }else{
    //            timeStr = NSInternationalFormat(@"General_Hour", [NSString stringWithFormat:@"%d",n]);
    //        }
    //    }else if (c >= 60*60*24 && c < 60*60*24*2){//小于两天
    //        timeStr = NSInternationalFormat(@"Social_Yesterday", [self get12Time:serverTime]);
    //    }else{//大于两天
    //        //当前年份
    //        NSInteger localYear = [self getYear:localTime];
    //        //服务器年份
    //        NSInteger serverYear = [self getYear:serverTime];
    //        if (localYear != serverYear) {
    //            timeStr = [NSString stringWithFormat:@"%ld/%ld/%ld %@",(long)[self getDay:serverTime],(long)[self getMonth:serverTime],(long)[self getYear:serverTime],[self get12Time:serverTime]];
    //        }else{
    //            timeStr = [NSString stringWithFormat:@"%ld/%ld %@",(long)[self getDay:serverTime],(long)[self getMonth:serverTime],[self get12Time:serverTime]];
    //        }
    //    }
    return timeStr;
}

+ (NSString *)getSocialTimeForDateStr:(NSString *)dateStr{
    
    NSDate *nowDate = [NSDate date];
    
    
    ///使日期字符串 创建NSDate
    //创建fomater
    NSDateFormatter *ft = [[NSDateFormatter alloc] init];
    //设置本地化
    // 2. 要指定日期的地区，Xcode 6.3 beta 还不需要，地区需要指定英语
    // 注意：在真机调试的时候，一定要指定区域，否则以前版本同样无法转换
    ft.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    //设置日期格式
    ft.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //生成日期
    NSDate *date = [ft dateFromString:dateStr];
    
    
    //用日历类获得当前的日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //创建datefomater
    NSDateFormatter *newFt = [[NSDateFormatter alloc] init];
    //当天
    if ([calendar isDateInToday:date]) {
        //获取日期与当前时间的差值
        long delta = (long)[nowDate timeIntervalSinceDate:date];
        if (delta < 60) {
            return @"刚刚";
        }
        if (delta < 3600){
            return [NSString stringWithFormat:@"%ld分钟前", delta/60];
        }
        return [NSString stringWithFormat:@"%ld小时前", delta/3600];
    }
    //昨天
    if ([calendar isDateInYesterday:date]){
        newFt.dateFormat = @"昨天 HH:mm";
        return [newFt stringFromDate:date];
    }
    //计算年度差值
    NSDateComponents *coms = [calendar components:NSCalendarUnitYear fromDate:nowDate toDate:date options:0];
    //今年
    if (coms.year == 0) {
        newFt.dateFormat = @"MM-dd";
        return [newFt stringFromDate:date];
    }
    //剩下的都是往年了
    newFt.dateFormat = @"yyyy-MM-dd HH:mm";
    return [newFt stringFromDate:date];
}


#pragma mark -
#pragma mark - DialogList Time
//当天消息显示几点几分，如13:20,昨天消息显示昨天，如yesterday；
//前两天消息显示日-月，如18-September(中文模式就是09-18),跨年的消息显示日-月-年，
//英文 31-Dec-2013(中文模式是2013-12-31)
+ (NSString *)getDialogListTime:(long long)lastMessageTime {
    NSString *timeDisplayStr;
    long long temp = [NSDateUtils getDaysFromAnotherDay:lastMessageTime];
    
    if(temp == 0){
        timeDisplayStr = [NSDateUtils get24Or12TimeBySystemSetting:lastMessageTime];
    }else if(temp == 1){
        timeDisplayStr = @"昨天";
    }else{
        timeDisplayStr = [NSDateUtils getMMddDate:lastMessageTime];
    }
    NSInteger tempYear = [NSDateUtils getYear:lastMessageTime];
    NSDate *nowDate = [NSDate date];
    NSInteger currentYear = [NSDateUtils getYear:[nowDate timeIntervalSince1970]];
    if (tempYear < currentYear) {
        NSString *year = [NSString stringWithFormat:@"%ld",(long)tempYear];
        timeDisplayStr = [NSString stringWithFormat:@"%@-%@",year,timeDisplayStr];
    }
    return timeDisplayStr;
}

+ (NSString *)getDialogDay:(long long)lastMessageTime {
    NSString *timeDisplayStr;
    NSInteger temp = [NSDateUtils getDaysFromAnotherDay:lastMessageTime];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    
    NSString *currentLanguage =[languages objectAtIndex:0];
    if(temp == 0){
        timeDisplayStr = @"Today";
    }else if(temp == 1){
        timeDisplayStr =@"Yesterday";
    }else{
        if([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [NSDateUtils getMMddDate:lastMessageTime];
        } else {
            timeDisplayStr = [NSDateUtils getddMMMDate:lastMessageTime];
        }
    }
    NSInteger tempYear = [NSDateUtils getYear:lastMessageTime];
    NSDate *nowDate = [NSDate date];
    NSInteger currentYear = [NSDateUtils getYear:[nowDate timeIntervalSince1970]];
    if (tempYear < currentYear) {
        NSString *year = [NSString stringWithFormat:@"%ld",(long)tempYear];
        if ([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",year,timeDisplayStr];
        } else {
            NSString *timeStr = [NSDateUtils getddMMMDate:lastMessageTime];
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",timeStr,year];
        }
    }
    return timeDisplayStr;
}

+ (NSString *)videoTimeOfTimeInterval:(NSTimeInterval)timeInterval {
    NSDateComponents *components = [self componetsWithTimeInterval:timeInterval];
    if (components.hour > 0) {
        return [NSString stringWithFormat:@"%ld:%02ld:%02ld", (long)components.hour, (long)components.minute, (long)components.second];
    } else {
        return [NSString stringWithFormat:@"%ld:%02ld", (long)components.minute, (long)components.second];
    }
}

+ (NSDateComponents *)componetsWithTimeInterval:(NSTimeInterval)timeInterval {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:timeInterval sinceDate:date1];
    
    unsigned int unitFlags =
    NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour |
    NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    return [calendar components:unitFlags
                       fromDate:date1
                         toDate:date2
                        options:0];
}

- (NSString *)getTimeStamp{
    NSString* time = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    return time;
}

//获取date之后的几个天
+ (NSDate *)dayInTheFollowingDay:(int)day toDate:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = day;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
}


@end
