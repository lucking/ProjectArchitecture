//
//  NSString+ZMAvoidCrash.m
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSString+ZMAvoidCrash.h"
#import "ZMAvoidCrash.h"

@implementation NSString (ZMAvoidCrash)

+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        //characterAtIndex
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(characterAtIndex:) method2Sel:@selector(avoidCrashCharacterAtIndex:)];
        
        //substringFromIndex
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(substringFromIndex:) method2Sel:@selector(avoidCrashSubstringFromIndex:)];
        
        //substringToIndex
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(substringToIndex:) method2Sel:@selector(avoidCrashSubstringToIndex:)];
        
        //substringWithRange:
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(substringWithRange:) method2Sel:@selector(avoidCrashSubstringWithRange:)];
        
        //stringByReplacingOccurrencesOfString:
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:) method2Sel:@selector(avoidCrashStringByReplacingOccurrencesOfString:withString:)];
        
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) method2Sel:@selector(avoidCrashStringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //stringByReplacingCharactersInRange:withString:
        [ZMAvoidCrash exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingCharactersInRange:withString:) method2Sel:@selector(avoidCrashStringByReplacingCharactersInRange:withString:)];
    });
    
}


//=================================================================
//                           characterAtIndex:
//=================================================================
#pragma mark - characterAtIndex:

- (unichar)avoidCrashCharacterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self avoidCrashCharacterAtIndex:index];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to return a without assign unichar.";
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return characteristic;
    }
}

//=================================================================
//                           substringFromIndex:
//=================================================================
#pragma mark - substringFromIndex:

- (NSString *)avoidCrashSubstringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self avoidCrashSubstringFromIndex:from];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

//=================================================================
//                           substringToIndex
//=================================================================
#pragma mark - substringToIndex

- (NSString *)avoidCrashSubstringToIndex:(NSUInteger)to {
    
    NSString *subString = nil;
    
    @try {
        subString = [self avoidCrashSubstringToIndex:to];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}


//=================================================================
//                           substringWithRange:
//=================================================================
#pragma mark - substringWithRange:

- (NSString *)avoidCrashSubstringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self avoidCrashSubstringWithRange:range];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

//=================================================================
//                stringByReplacingOccurrencesOfString:
//=================================================================
#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)avoidCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self avoidCrashStringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

//=================================================================
//  stringByReplacingOccurrencesOfString:withString:options:range:
//=================================================================
#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)avoidCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self avoidCrashStringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


//=================================================================
//       stringByReplacingCharactersInRange:withString:
//=================================================================
#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)avoidCrashStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    @try {
        newStr = [self avoidCrashStringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

@end
