//
//  Function.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/20.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Function.h"

// 计算方法耗时时间间隔
// 获取时间间隔
#define TICK CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)


@implementation Function

@end
