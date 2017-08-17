//
//  NSDate+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

// 时间格式
typedef NS_ENUM(NSInteger,DateFormatStatus) {
    DFStyleMMdd             = 0,	// 月日			MM/dd
    DFStyleYYYYMMdd         = 1,	// 年月日			yyyy-MM-dd
    DFStyleHHmmss			= 2,	// 时分秒			HH:mm:ss
    DFStyleYYYYMMddHHmmss	= 3,	// 年月日时分秒	yyyy-MM-dd HH:mm:ss
};

// 日月格式：
typedef NS_ENUM (NSInteger, MonthDayFormatStatus) {
    MMddStyle_AA  = 0,	// MM/dd
    MMddStyle_BB  = 1,	// MM-dd
    MMddStyle_CC  = 2,	// MM.dd
};


@interface NSDate (ZMAdd)
{
    
}
//=========================="  日期  "========================
// 获取当前日期
+(NSString*)getCurrentDateString;
// 获取当前日期
+(NSString*)getCurrentDateWithFormatter:(NSString *)Formatter;


// date 转换为 string
+ (NSString *)dateToStringWithDate:(NSDate *)myDate format:(NSString *)format;

// string 转换为 date
+ (NSDate* )stringToDateWithDateStr:(NSString *)timeStr format:(NSString *)format;



// 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day;

// 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date;

// 对时间进行格式化
+ (NSString *)dateFormatWithDate:(NSDate*)date dateFormatStatus:(DateFormatStatus)state;

// 时间戳 转换为 日期时间 选取不同格式
+ (NSString *)timeIntervalWithString:(NSString *)string dateFormatStatus:(DateFormatStatus)state;
// 同上：自定义时间格式
+ (NSString *)timestampWithString:(NSString *)string format:(NSString *)format;

// 时间戳 转换为 日期时间
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
// 将某个时间转化成 时间戳
+ (NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;



/**
 * 获取每月的_日期数组
 */
+ (NSMutableArray *)monthDayArrayWithYear:(NSString *)yyyy month:(NSString *)mm mmDDFormatter:(MonthDayFormatStatus)formatter;
/**
 * 获取每月的天数_数组
 */
+ (NSMutableArray *)dayArrayWithYear:(NSString *)yyyy month:(NSString *)mm;
/**
 * 获取每月的天数_数组
 */
+ (NSMutableArray *)dayArrayWithYear:(NSString *)yyyy month:(NSString *)mm isAddZero:(BOOL)isAddZero;
/**
 * 获取每月的天数
 */
+ (NSInteger )dayNumWithYear:(NSString *)yyyy month:(NSString *)mm;




// 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay;

// 2.判断时间大小
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2;

// 3.判断时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2;



@end
