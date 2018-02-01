//
//  NSRunLoop+PerformBlock.h
//  ZMArchitecture
//
//  Created by ZM on 16/4/5.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const NSRunloopTimeoutException;

@interface NSRunLoop (PerformBlock)

- (void)performBlockAndWait:(void (^)(BOOL *finish))block;
- (void)performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;

@end
