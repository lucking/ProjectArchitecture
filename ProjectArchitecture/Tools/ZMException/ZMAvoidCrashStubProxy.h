//
//  ZMAvoidCrashStubProxy.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define AvoidCrashNotification @"AvoidCrashNotification"

// 用户可以忽略下面的定义
#define AvoidCrashDefaultReturnNil  @"This framework default is to return nil to avoid crash."
#define AvoidCrashDefaultIgnore     @"This framework default is to ignore this operation to avoid crash."

#define AvoidCrashSeparator         @"================================================================"
#define AvoidCrashSeparatorWithFlag @"========================AvoidCrash Log=========================="

#ifdef DEBUG
#define  AvoidCrashLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define  AvoidCrashLog(...)
#endif


@interface ZMAvoidCrashStubProxy : NSObject

//代理方法
- (void)proxyMethod;

@end
