//
//  NSMutableDictionary+ZMAvoidCrash.m
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSMutableDictionary+ZMAvoidCrash.h"
#import "ZMAvoidCrash.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (ZMAvoidCrash)

+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [ZMAvoidCrash exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKey:) method2Sel:@selector(avoidCrashSetObject:forKey:)];
        
        //removeObjectForKey:
        Method removeObjectForKey = class_getInstanceMethod(dictionaryM, @selector(removeObjectForKey:));
        Method avoidCrashRemoveObjectForKey = class_getInstanceMethod(dictionaryM, @selector(avoidCrashRemoveObjectForKey:));
        method_exchangeImplementations(removeObjectForKey, avoidCrashRemoveObjectForKey);
    });
}

//=================================================================
//                       setObject:forKey:
//=================================================================
#pragma mark - setObject:forKey:

- (void)avoidCrashSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self avoidCrashSetObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}

//=================================================================
//                       removeObjectForKey:
//=================================================================
#pragma mark - removeObjectForKey:

- (void)avoidCrashRemoveObjectForKey:(id)aKey {
    
    @try {
        [self avoidCrashRemoveObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


@end
