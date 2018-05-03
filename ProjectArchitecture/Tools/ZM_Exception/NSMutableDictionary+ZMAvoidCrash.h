//
//  NSMutableDictionary+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMAvoidCrashProtocol.h"

@interface NSMutableDictionary (ZMAvoidCrash)<ZMAvoidCrashProtocol>

@end

/**
 *  避免崩溃的：方法类型
 *
 *  1. - (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
 *  2. - (void)removeObjectForKey:(id)aKey
 *
 */
