//
//  CatchCrash.h
//  Architecture
//
//  Created by ZM on 16/6/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatchCrash : NSObject
{
    
}
void uncaughtExceptionHandler(NSException*exception);


+ (void)setExceptionHandler;
+ (NSUncaughtExceptionHandler *)getExceptionHandler;

+ (void)saveAsText:(NSString *)exceptionInfo;
+ (void)sendEmail:(NSString *)exceptionInfo;
    


//测试 字符串 是否为空
//- (void)printMyName:(NSString *)myName;

@end
