//
//  NSObject+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2018/1/7.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZMAvoidCrash)

/** 
 *  ifDealWithNoneSel : 是否开启"unrecognized selector sent to instance"异常的捕获
 */
+ (void)avoidCrashExchangeMethodIfDealWithNoneSel:(BOOL)ifDealWithNoneSel;

+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings;

@end


/**
 *  避免崩溃的：方法类型
 *
 *  1.- (void)setValue:(id)value forKey:(NSString *)key
 *  2.- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
 *  3.- (void)setValue:(id)value forUndefinedKey:(NSString *)key //这个方法一般用来重写，不会主动调用
 *  4.- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
 *  5. unrecognized selector sent to instance
 */
