//
//  NSTimer+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/11/1.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSTimer+ZMAdd.h"

@implementation NSTimer (ZMAdd)


//开启：定时器
- (void)startTimer {
    [self setFireDate:[NSDate distantPast]];
}
//复试：定时器
- (void)resume {
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
}
//暂停：定时器
- (void)pauseTimer {
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
}
//移除：定时器
- (void)removeTimer {
    if ([self isValid]) {
        [self setFireDate:[NSDate distantFuture]];
        [self invalidate];
        //self = nil;
    }
}


@end
