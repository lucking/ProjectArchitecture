//
//  NSMutableArray+ZMAvoidCrash.m
//  ZM_NSException
//
//  Created by ZM on 2017/10/29.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSMutableArray+ZMAvoidCrash.h"
#import <objc/runtime.h>

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



@end
