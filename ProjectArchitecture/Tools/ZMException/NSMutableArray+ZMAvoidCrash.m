//
//  NSMutableArray+ZMAvoidCrash.m
//  ZM_NSException
//
//  Created by ZM on 2017/10/29.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSMutableArray+ZMAvoidCrash.h"
#import <objc/runtime.h>
#import "ZMAvoidCrash.h"

@implementation NSMutableArray (ZMAvoidCrash)


+ (void)load {
    
    Class arrayMClass = NSClassFromString(@"__NSArrayM");
    //获取系统的添加元素的方法
    Method addObject = class_getInstanceMethod(arrayMClass, @selector(addObject:));
    //获取我们自定义添加元素的方法
    Method avoidCrashAddObject = class_getInstanceMethod(arrayMClass, @selector(avoidCrashAddObject:));
    //将两个方法进行交换
    //当你调用addObject,其实就是调用avoidCrashAddObject
    //当你调用avoidCrashAddObject，其实就是调用addObject
    method_exchangeImplementations(addObject, avoidCrashAddObject);
}

- (void)avoidCrashAddObject:(id)anObject {
    @try {
        [self avoidCrashAddObject:anObject];//其实就是调用addObject
    }
    @catch (NSException *exception) {
        //能来到这里,说明可变数组添加元素的代码有问题
        //你可以在这里进行相应的操作处理
        NSLog(@"异常名称:%@，异常原因:%@",exception.name, exception.reason);
    }
    @finally {
        //在这里的代码一定会执行，你也可以进行相应的操作
    }
}


+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex:
        [ZMAvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(objectAtIndex:) method2Sel:@selector(avoidCrashObjectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [ZMAvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(setObject:atIndexedSubscript:) method2Sel:@selector(avoidCrashSetObject:atIndexedSubscript:)];
        
        
        //removeObjectAtIndex:
        [ZMAvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(removeObjectAtIndex:) method2Sel:@selector(avoidCrashRemoveObjectAtIndex:)];
        
        //insertObject:atIndex:
        [ZMAvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(insertObject:atIndex:) method2Sel:@selector(avoidCrashInsertObject:atIndex:)];
        
        //getObjects:range:
        [ZMAvoidCrash exchangeInstanceMethod:arrayMClass method1Sel:@selector(getObjects:range:) method2Sel:@selector(avoidCrashGetObjects:range:)];
    });
    
    
    
}

//=================================================================
//                    array set object at index
//=================================================================
#pragma mark - get object from array


- (void)avoidCrashSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self avoidCrashSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    removeObjectAtIndex:
//=================================================================
#pragma mark - removeObjectAtIndex:

- (void)avoidCrashRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self avoidCrashRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    insertObject:atIndex:
//=================================================================
#pragma mark - set方法
- (void)avoidCrashInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self avoidCrashInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                           objectAtIndex:
//=================================================================
#pragma mark - objectAtIndex:

- (id)avoidCrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self avoidCrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}


//=================================================================
//                         getObjects:range:
//=================================================================
#pragma mark - getObjects:range:

- (void)avoidCrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self avoidCrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [ZMAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
}


@end
