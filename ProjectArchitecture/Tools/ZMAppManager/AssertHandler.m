//
//  AssertHandler.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AssertHandler.h"

@implementation AssertHandler


- (void)testUse{
    
    // 自定义NSAssertionHandler后,程序能够获得断言失败后的信息,但是程序可以继续运行,不会强制退出程序.
    
    //断点配置：给线程添加处理类
    AssertHandler *myHandler = [[AssertHandler alloc] init];
    //配置给当前的线程_跳跃崩溃断点_并打印崩溃日志
    [[[NSThread currentThread] threadDictionary] setValue:myHandler
                                                   forKey:NSAssertionHandlerKey];
    
    // NSCAssert\NSAssert：第一个参数是条件,如果第一个参数不满足条件,就会记录并打印后面的字符串
    int a = 1;
    NSString *myName= nil;
    NSCAssert(a == 2, @"a must equal to 2");
    NSAssert(myName != nil, @"名字不能为空！");

    // 只需要一个参数,如果参数存在程序继续运行,如果参数为空,则程序停止,并打印日志
    NSString *str = nil;
    NSParameterAssert(str);

        
    //可以使用宏NSAssert()在程序中进行断点处理。NSAssert()使用正确，可以帮助开发者尽快定位bug
    //手动断点_1
    [myHandler printMyName:nil];
    //手动断点_2
    [myHandler assertWithPara:nil];
    
}


- (void)printMyName:(NSString *)myName
{
    NSAssert(myName != nil, @"名字不能为空！");
    NSLog(@"My name is %@.\n",myName);
}

- (void)assertWithPara:(NSString *)str
{
    NSParameterAssert(str);
    // 打印错误日志_Print_Error_reason： Invalid parameter not satisfying: str
}

#pragma mark ======================"  NSAssertionHandler Fanction  "==============================

//处理Objective-C的断言
- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format,...
{
    NSLog(@"NSAssert Failure: Method %@.\n for object %@.\n in %@_line: %li \n", NSStringFromSelector(selector), object, fileName, (long)line);
}
//处理C的断言
- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format,...
{
    NSLog(@"NSCAssert Failure: Function (%@) in %@#%li", functionName, fileName, (long)line);
}


@end
