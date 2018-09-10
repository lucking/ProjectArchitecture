//
//  NSMutableString+ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMAvoidCrashProtocol.h"

@interface NSMutableString (ZMAvoidCrash)<ZMAvoidCrashProtocol>

@end

/**
 *  避免崩溃的：方法类型
 *
 *  1. 由于NSMutableString是继承于NSString,所以这里和NSString有些同样的方法就不重复写了
 *  2. - (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
 *  3. - (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
 *  4. - (void)deleteCharactersInRange:(NSRange)range
 *
 */
