//
//  NSObject+ZMAvoidCrash.m
//  ZM_NSException
//
//  Created by ZM on 2018/1/7.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "NSObject+ZMAvoidCrash.h"
#import "ZMAvoidCrash.h"
#import "ZMAvoidCrashStubProxy.h"

@implementation NSObject (ZMAvoidCrash)

//避免崩溃的：方法类型
+ (void)avoidCrashExchangeMethodIfDealWithNoneSel:(BOOL)ifDealWithNoneSel {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //setValue:forKey:
        [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKey:) method2Sel:@selector(avoidCrashSetValue:forKey:)];
        
        //setValue:forKeyPath:
        [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKeyPath:) method2Sel:@selector(avoidCrashSetValue:forKeyPath:)];
        
        //setValue:forUndefinedKey:
        [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forUndefinedKey:) method2Sel:@selector(avoidCrashSetValue:forUndefinedKey:)];
        
        //setValuesForKeysWithDictionary:
        [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(setValuesForKeysWithDictionary:) method2Sel:@selector(avoidCrashSetValuesForKeysWithDictionary:)];
        
        //unrecognized selector sent to instance
        if (ifDealWithNoneSel) {
            [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(methodSignatureForSelector:) method2Sel:@selector(avoidCrashMethodSignatureForSelector:)];
            [ZMAvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(forwardInvocation:) method2Sel:@selector(avoidCrashForwardInvocation:)];
        }
    });
}


//=================================================================
//              unrecognized selector sent to instance
//=================================================================
#pragma mark - unrecognized selector sent to instance


static NSMutableArray *noneSelClassStrings;

+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings {
    
    if (noneSelClassStrings) {
        
        NSString *warningMsg = [NSString stringWithFormat:@"\n\n%@\n\n[AvoidCrash setupNoneSelClassStringsArr:];\n调用一此即可，多次调用会自动忽略后面的调用\n\n%@\n\n",AvoidCrashSeparatorWithFlag,AvoidCrashSeparator];
        AvoidCrashLog(@"%@",warningMsg);
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noneSelClassStrings = classStrings.mutableCopy;
    });
}

- (NSMethodSignature *)avoidCrashMethodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *ms = [self avoidCrashMethodSignatureForSelector:aSelector];
    
    
    if (ms == nil) {
        for (NSString *classStr in noneSelClassStrings) {
            if ([self isKindOfClass:NSClassFromString(classStr)]) {
                ms = [ZMAvoidCrashStubProxy instanceMethodSignatureForSelector:@selector(proxyMethod)];
                break;
            }
        }
    }
    return ms;
}

- (void)avoidCrashForwardInvocation:(NSInvocation *)anInvocation {
    
    @try {
        [self avoidCrashForwardInvocation:anInvocation];
        
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
    
}


//=================================================================
//                         setValue:forKey:
//=================================================================
#pragma mark - setValue:forKey:

- (void)avoidCrashSetValue:(id)value forKey:(NSString *)key {
    @try {
        [self avoidCrashSetValue:value forKey:key];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}


//=================================================================
//                     setValue:forKeyPath:
//=================================================================
#pragma mark - setValue:forKeyPath:

- (void)avoidCrashSetValue:(id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self avoidCrashSetValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}



//=================================================================
//                     setValue:forUndefinedKey:
//=================================================================
#pragma mark - setValue:forUndefinedKey:

- (void)avoidCrashSetValue:(id)value forUndefinedKey:(NSString *)key {
    @try {
        [self avoidCrashSetValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}


//=================================================================
//                  setValuesForKeysWithDictionary:
//=================================================================
#pragma mark - setValuesForKeysWithDictionary:

- (void)avoidCrashSetValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    @try {
        [self avoidCrashSetValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

@end
