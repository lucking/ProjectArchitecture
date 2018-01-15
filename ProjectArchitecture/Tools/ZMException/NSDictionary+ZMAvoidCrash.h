//
//  NSDictionary+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMAvoidCrashProtocol.h"

@interface NSDictionary (ZMAvoidCrash)<ZMAvoidCrashProtocol>

/**
 *  避免崩溃的：方法类型
 *
 *  1. NSDictionary的快速创建方式 NSDictionary *dict = @{@"frameWork" : @"AvoidCrash"}; //这种创建方式其实调用的是2中的方法
 *  2. +(instancetype)dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
 *
 */

@end
