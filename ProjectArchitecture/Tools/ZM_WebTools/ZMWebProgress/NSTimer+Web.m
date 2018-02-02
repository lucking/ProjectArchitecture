//
//  NSTimer+Web.m
//  ZM_WebProgressView
//
//  Created by ZM on 2017/10/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSTimer+Web.h"

@implementation NSTimer (Web)

- (void)pause {
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resume {
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
}

- (void)resumeWithTimeInterval:(NSTimeInterval)time {
    if (!self.isValid) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}

@end
