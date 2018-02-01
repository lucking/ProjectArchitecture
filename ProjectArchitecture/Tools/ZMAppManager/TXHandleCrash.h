//
//  TXHandleCrash.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HandleCrashLogBegin @"==========================handleCrashLogBegin==========================="

#define HandleCrashLogEnd   @"=============================handleCrash==============================="

#define HandleCrashLogNotification @"HandleCrashLogNotification"


@interface TXHandleCrash : NSObject

/** start handle crash
 */
+(void)startHandle;


/** exchange class method
 */
+(void)handleClass:(Class)anClass exchangeClassMethod:(SEL)method1 Method:(SEL)method2;


/** exchange instance method
 */
+(void)handleClass:(Class)anClass exchangeCInstanceMethod:(SEL)method1 Method:(SEL)method2;

/**
 handle exception
 @param remark remark
 */
+(void)handleException:(NSException*)exception remark:(NSString*)remark;


@end
