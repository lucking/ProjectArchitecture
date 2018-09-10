//
//  NSMutableArray+Extension.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)


- (void)testUse {
    
    //NSException的基本用法：下面代码就会让你的程序崩溃
    //异常的名称
    NSString *exceptionName = @"自定义异常";
    //异常的原因
    NSString *exceptionReason = @"我长得太帅了，所以程序崩溃了";
    //异常的信息
    NSDictionary *exceptionUserInfo = nil;
    
    NSException *exception = [NSException exceptionWithName:exceptionName reason:exceptionReason userInfo:exceptionUserInfo];
    NSString *aboutMe = @"太帅了";
    if ([aboutMe isEqualToString:@"太帅了"]) {
        NSLog(@"--->@throw1 \n");
        //抛异常
        @throw exception;
        NSLog(@"--->@throw2 \n");
    }

        
    NSString *nilStr = nil;
    NSMutableArray *arrayM = [NSMutableArray array];
    @try {
        //可能抛出异常的代码
        NSLog(@"--->@try \n");
        [arrayM addObject:nilStr];
        
        
    } @catch (NSException *exception) {
        //处理@try块中抛出的异常。
        NSLog(@"--->@catch \n");
        
    } @finally {
        //无论是否抛出异常，执行的代码都会被执行。
        NSLog(@"--->@finally \n");
    }
    
}

+ (void)load {
    
    Class arrayMClass = NSClassFromString(@"__NSArrayM");
    
    //获取系统的方法：添加元素的方法
    Method addObject = class_getInstanceMethod(arrayMClass, @selector(addObject:));
    
    //获取我们自定义方法：添加元素的方法
    Method avoidCrashAddObject = class_getInstanceMethod(arrayMClass, @selector(avoidCrashAddObject:));
    
    //将两个方法进行交换
    //当你调用addObject,其实就是调用avoidCrashAddObject
    //当你调用avoidCrashAddObject，其实就是调用addObject
    method_exchangeImplementations(addObject, avoidCrashAddObject);
}

- (void)avoidCrashAddObject:(id)anObject {
    
    @try {
        [self avoidCrashAddObject:anObject];//其实就是调用addObject
        //NSLog(@"--->@try \n");
    }
    @catch (NSException *exception) {
        
        //能来到这里,说明可变数组添加元素的代码有问题
        //你可以在这里进行相应的操作处理
        NSLog(@"--->@catch_异常名称:%@   异常原因:%@ \n ",exception.name, exception.reason);
    }
    @finally {
        //在这里的代码一定会执行，你也可以进行相应的操作
        //NSLog(@"--->@finally \n");
    }
}



@end
