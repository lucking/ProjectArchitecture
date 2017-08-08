//
//  NSDate+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSDate+ZMAdd.h"

@implementation NSDate (ZMAdd)
- (void)test {
    
#pragma mark -----------------------"  获取不同格式的时间  "---------------------------------
    // 获取当前时间 dateFormat
    NSDate* currentDate = [NSDate date];
    
    NSString* dateStr11 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFStyleMMdd];
    NSString* dateStr22 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFStyleYYYYMMdd];
    NSString* dateStr33 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFStyleHHmmss];
    NSString* dateStr44 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFStyleYYYYMMddHHmmss];
    
    NSLog(@"dateStr11 = %@ ",dateStr11);
    NSLog(@"dateStr22 = %@ ",dateStr22);
    NSLog(@"dateStr33 = %@ ",dateStr33);
    NSLog(@"dateStr44 = %@ ",dateStr44);
    
    
}



//======================="  日期和时间  "=================================

// 获取当前日期：固定格式
+(NSString*)getCurrentDateString
{
    NSDate * currentDate=[NSDate date];
    NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];  // 时间格式器
    [dateFM setDateFormat:@"yyyy-MM-dd"];                   // 设置时间的格式
    NSString *getDate=[dateFM stringFromDate:currentDate];
    
    return getDate;
}
// 获取当前日期：自定义格式
+(NSString*)getCurrentDateWithFormatter:(NSString *)Formatter
{
    NSDate * currentDate=[NSDate date];
    NSDateFormatter *dateFM = [[NSDateFormatter alloc] init];  // 时间格式器
    [dateFM setDateFormat:Formatter];                   // 设置时间的格式
    NSString *getDate=[dateFM stringFromDate:currentDate];
    
    return getDate;
}


// 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day
{
    //设置你需要增加或减少的年、月、日即可获得新的日期，上述的表示获取mydate日期前一个月的日期，
    //如果该成+1，则是一个月以后的日期，以此类推都可以计算。
    NSDate * currentDate = [NSDate date];
    NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //
    NSDateComponents *comps = nil;
    comps= [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    //
    NSDateComponents *adcomps= [[NSDateComponents alloc] init];
    [adcomps setYear:year];    //年份
    [adcomps setMonth:month];  //月份
    [adcomps setDay:day];      //日份
    NSDate *newDate= [calendar dateByAddingComponents:adcomps toDate:currentDate options:0];
    // NSLog(@"--->newDate     :%@", newDate);
    NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];
    [dateFM setDateFormat:@"yyyy-MM-dd"];
    NSString *getDate=[dateFM stringFromDate:newDate];
    
    return getDate;
}

// 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date
{
    NSTimeInterval secondsInTwentyFourHours = 24 * 3600;
    NSDate *newDate= [date dateByAddingTimeInterval:secondsInTwentyFourHours];
    return newDate;
}
// 对时间进行格式化
/**
 *  MM/dd				 07/01
 *  yyyy-MM-dd			 2015-07-01
 *  HH:mm:ss			 17:30:40
 *  yyyy-MM-dd HH:mm:ss  2015-07-01 17:30:40
 */
+ (NSString *)dateFormatWithDate:(NSDate*)date dateFormatStatus:(DateFormatStatus)state {
    
    NSDateFormatter *df= [[NSDateFormatter alloc] init];
    // 设置时间的格式
    if (state == DFStyleMMdd) {                 df.dateFormat = @"MM/dd";
    }else if (state == DFStyleYYYYMMdd) {       df.dateFormat = @"yyyy-MM-dd";
    }else if (state == DFStyleHHmmss ) {        df.dateFormat = @"HH:mm:ss";
    }else if (state == DFStyleYYYYMMddHHmmss ) {df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    NSString *getDate= [df stringFromDate:date];
    return getDate;
}


/**
 * 时间戳 转换为 日期时间 选取不同格式
 @param string 时间戳
 @param state 日期时间格式
 *  使用方式  [NSString timeIntervalWithString:string dateFormatStatus:DFStyleYYYYMMdd];
 */
+ (NSTimeInterval)timeIntervalWithString:(NSString *)string dateFormatStatus:(DateFormatStatus)state
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    
    //[dateFormatter setDateFormat:style];
    // 设置时间的格式
    if (state == DFStyleMMdd) {                 dateFormatter.dateFormat = @"MM/dd";
    }else if (state == DFStyleYYYYMMdd) {       dateFormatter.dateFormat = @"yyyy-MM-dd";
    }else if (state == DFStyleHHmmss ) {        dateFormatter.dateFormat = @"HH:mm:ss";
    }else if (state == DFStyleYYYYMMddHHmmss ) {dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDate *date = [dateFormatter dateFromString:string];
    return date.timeIntervalSince1970 * 1000;
}




/**
 * 获取每月的_日期数组
 
 @param yyyy 年份
 @param mm 月份
 @param formatter 日期格式
 @return 日期数组
 */
+ (NSMutableArray *)monthDayArrayWithYear:(NSString *)yyyy month:(NSString *)mm mmDDFormatter:(MonthDayFormatStatus)formatter {
    
    NSMutableArray *_dayArray = [NSMutableArray arrayWithCapacity:0];
    NSInteger maxDay = 31;
    maxDay = [self dayNumWithYear:yyyy month:mm];
    //NSLog(@"---> maxDay = %ld",(long)maxDay);
    
    for (NSInteger i = 1; i <= maxDay; i++) {
        
        //NSLog(@"---> i = %ld",i);
        if (formatter == MMddStyle_AA) {
            // MM/dd
            [_dayArray addObject:[NSString stringWithFormat:@"%@/%ld",mm,(long)i]];
            
        }else if (formatter == MMddStyle_BB) {
            // MM-dd
            [_dayArray addObject:[NSString stringWithFormat:@"%@-%ld",mm,(long)i]];
            
        }else if (formatter == MMddStyle_CC ) {
            // MM.dd
            [_dayArray addObject:[NSString stringWithFormat:@"%@.%ld",mm,(long)i]];
        }
    }
    return _dayArray;
}


/**
 * 获取每月的天数_数组
 
 @param yyyy 年份
 @param mm 月份
 @return 天数_数组
 */
+ (NSMutableArray *)dayArrayWithYear:(NSString *)yyyy month:(NSString *)mm {
    
    NSMutableArray *_dayArray = [NSMutableArray arrayWithCapacity:0];
    NSInteger maxDay = 31;
    maxDay = [self dayNumWithYear:yyyy month:mm];
    
    for (NSInteger i = 1; i < maxDay; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    return _dayArray;
}

/**
 * 获取每月的天数_数组
 
 @param yyyy 年份
 @param mm 月份
 @param isAddZero 日期小于10的，前置添加一个0
 @return 天数_数组
 */
+ (NSMutableArray *)dayArrayWithYear:(NSString *)yyyy month:(NSString *)mm isAddZero:(BOOL)isAddZero {
    
    NSMutableArray *_dayArray = [NSMutableArray arrayWithCapacity:0];
    NSInteger maxDay = 31;
    maxDay = [self dayNumWithYear:yyyy month:mm];
    
    for (NSInteger i = 1; i < maxDay+1; i++) {
        
        if (isAddZero) {
            if (i<10) {
                [_dayArray addObject:[NSString stringWithFormat:@"0%ld",(long)i]];
            }else{
                [_dayArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
            }
        }else{
            [_dayArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
        }
    }
    return _dayArray;
}


/**
 * 获取每月的天数_个数
 
 @param yyyy 年份
 @param mm 月份
 @return 天数
 */
+ (NSInteger )dayNumWithYear:(NSString *)yyyy month:(NSString *)mm {
    
    NSInteger year = [yyyy integerValue];
    NSInteger month = [mm integerValue];
    NSInteger maxDay = 31;
    
    //    NSLog(@"--> year = %ld",year);
    //    NSLog(@"--> month = %ld \n ",month);
    
    if (year % 400 == 0 && month == 2) {
        maxDay = 29;
    } else if ((year % 100 != 0) && (year % 4 == 0) && month == 2){
        maxDay = 29;
    } else if (month == 2){
        maxDay = 28;
    } else if ((month % 2 != 0 && month < 8) || month == 8 || (month % 2 == 0 && month > 8)){
        maxDay = 31;
    } else {
        maxDay = 30;
    }
    return maxDay;
}




// 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay
{
    //NSDate生成:
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [[NSDate alloc] initWithTimeIntervalSinceNow:24*3600];
    //    NSLog(@"---> date1：%@",date1);
    //    NSLog(@"---> date2：%@ \n ",date2);
    
    [UserDefaults setObject:date1 forKey:@"date1"];
    [UserDefaults setObject:date2 forKey:@"date2"];

}


// 2.判断时间大小、相同
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2
{
    NSDateFormatter *dateFM = [[NSDateFormatter alloc] init];
    [dateFM setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *date11 = [dateFM stringFromDate:Date1];//date   To  string
    NSString *date22 = [dateFM stringFromDate:Date2];
    
    NSDate *dateA = [dateFM dateFromString:date11];  //string To  date
    NSDate *dateB = [dateFM dateFromString:date22];
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedAscending){
        return @"-1";   //dateA 是过去的时间
    }
    else if (result == NSOrderedDescending) {
        return @"+1";   //dateA 是未来的时间
    }
    return @"0";        // 两者时间相同
}
// 3.判断：时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2
{
    if ([Date1 isEqualToDate: Date2]) {
        return YES;
    }else{
        return NO;
    }
}

@end
