//
//  NSMutableAttributedString+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMAvoidCrashProtocol.h"

@interface NSMutableAttributedString (ZMAvoidCrash)<ZMAvoidCrashProtocol>

@end

/**
 *  避免崩溃的：方法类型
 *
 *  1.- (instancetype)initWithString:(NSString *)str
 *  2.- (instancetype)initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs
 */
