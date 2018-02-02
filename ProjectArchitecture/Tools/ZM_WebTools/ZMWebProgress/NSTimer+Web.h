//
//  NSTimer+Web.h
//  ZM_WebProgressView
//
//  Created by ZM on 2017/10/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Web)

- (void)pause;
- (void)resume;
- (void)resumeWithTimeInterval:(NSTimeInterval)time;

@end
