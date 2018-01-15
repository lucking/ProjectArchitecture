//
//  NSMutableArray+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2017/10/29.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMAvoidCrashProtocol.h"

@interface NSMutableArray (ZMAvoidCrash)<ZMAvoidCrashProtocol>

@end

/**
 *  避免崩溃的：方法类型
 *
 *  1. NSArray的快速创建方式 NSArray *array = @[@"chenfanfang", @"AvoidCrash"];  //这种创建方式其实调用的是2中的方法
 *  2. +(instancetype)arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
 *  3. - (id)objectAtIndex:(NSUInteger)index
 *  4. - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
 */    
