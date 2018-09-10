//
//  Test_NSDate.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_NSDate.h"
#import "NSDate+ZMAdd.h"

@implementation Test_NSDate

/*
 * 注意：hh与HH的区别
 
 hh：表示12小时制
 HH：表示24小时制
  
*/

// 获取当前时间戳
+ (void)timeDate {
    
    NSLog(@"---> getNowTimeTimestamp0= %@ ",[NSDate timeSwitchTimestampFormatter:@"YYYY-MM-dd HH:mm:ss"]);
    NSLog(@"---> getNowTimeTimestamp1= %@ ",[NSDate getNowTimestamp]);
    NSLog(@"---> getNowTimeTimestamp2= %@ ",[NSDate getNowTimestampOfSecond]);
    NSLog(@"---> getNowTimeTimestamp3= %@ ",[NSDate getNowTimestampOfMillisecond]);
    
    NSString *timestamp = [NSDate getNowTimestamp];
    NSLog(@"---> timestamp.length= %ld ",(long)timestamp.length);
}

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
    
    NSDate *datenow = [NSDate date];//现在时间
    NSLog(@"---> datenow= %@ ",datenow);
    
    
    //1.0、时间戳 to dateStr  
    NSString *dateStr_1 = [NSDate timeIntervalWithString:@"1296035591" dateFormatStatus:DFStyleYYYYMMddHHmmss];
    NSString *dateStr_12 = [NSDate timeIntervalWithString:@"1502953200" dateFormatStatus:DFStyleYYYYMMddHHmmss];
    NSString *dateStr_2 = [NSDate timestampSwitchTime:1296035591 andFormatter:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"---> dateStr_1 = %@ \n ",dateStr_1);
    NSLog(@"---> dateStr_12 = %@ \n ",dateStr_12);
    NSLog(@"---> dateStr_2 = %@ \n ",dateStr_2);
    
    
    //1.1、string to date
    NSDate *myDate1 = [NSDate stringToDateWithDateStr:@"20110826134106" format:@"yyyyMMddHHmmss"];
    NSDate *myDate2 = [NSDate stringToDateWithDateStr:@"2017-08-16 08:26:26" format:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"---> 1.1_1：string to date = %@",myDate1);
    NSLog(@"---> 1.1_2：string to date = %@",myDate2);
    //1.2、date To String
    NSString *dateStr1 = [NSDate dateToStringWithDate:[NSDate date] format:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"---> 1.2：date to string = %@",dateStr1);
    
    //2.1、dateStr to 时间戳
    NSString *timestampStr = [NSDate timeSwitchTimestamp:dateStr1 andFormatter:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"---> 2.1：dateStr to 时间戳 = %@",timestampStr);
    //2.2时间戳 to dateStr
    NSString *dateStr2 = [NSDate timeIntervalWithString:timestampStr dateFormatStatus:DFStyleYYYYMMddHHmmss];
    NSString *dateStr2_2 = [NSDate timestampWithString:timestampStr format:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"---> 2.2_1：时间戳 to dateStr = %@ ",dateStr2);
    NSLog(@"---> 2.2_2：时间戳 to dateStr = %@ \n ",dateStr2_2);
    
   
}


@end
