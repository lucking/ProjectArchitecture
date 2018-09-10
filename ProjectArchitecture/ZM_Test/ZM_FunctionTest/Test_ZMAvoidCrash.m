//
//  Test_ZMAvoidCrash.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_ZMAvoidCrash.h"
#import "ZMAvoidCrash.h"
#import "AssertHandler.h"
#import "CatchCrash.h"

@implementation Test_ZMAvoidCrash


// 断点配置
+ (void)assertCrash {
    
    //断点配置
    AssertHandler *myHandler = [[AssertHandler alloc] init];
    // 配置给当前的线程_跳跃崩溃断点_并打印崩溃日志
    [[[NSThread currentThread] threadDictionary] setValue:myHandler forKey:NSAssertionHandlerKey];
    // 手动断点
    [myHandler printMyName:nil];
    
    // NSMutableArray+Extension 交换方法_跳过崩溃
    NSMutableArray *arrayM = [NSMutableArray array];
    
    NSString *nilStr = nil;
    [arrayM addObject:nilStr];
}


#pragma mark - 7.自定义：注册避免崩溃函数
- (void)configZMAvoidCrash {
    /*  1.是全局生效： [ZMAvoidCrash becomeEffective]、[ZMAvoidCrash makeAllEffective]
     *  2.若你只需要部分生效，你可以单个进行处理，比如:
     *  [NSArray avoidCrashExchangeMethod];
     *  [NSMutableArray avoidCrashExchangeMethod];
     */    
    //启动防止崩溃功能(注意区分becomeEffective和makeAllEffective的区别)
    //具体区别请看 ZMAvoidCrash.h 中的描述，建议在didFinishLaunchingWithOptions最初始位置调用 上面的方法
    //[ZMAvoidCrash becomeEffective];
    [ZMAvoidCrash makeAllEffective];

    
    //若出现unrecognized selector sent to instance并且控制台输出:
    //-[__NSCFConstantString initWithName:age:height:weight:]: unrecognized selector sent to instance
    //你可以将@"__NSCFConstantString"添加到如下数组中，当然，你也可以将它的父类添加到下面数组中, 比如，对于部分字符串，继承关系如下：__NSCFConstantString --> __NSCFString --> NSMutableString --> NSString
    //你可以将上面四个类随意一个添加到下面的数组中，建议直接填入 NSString
    NSArray *noneSelClassStrings = @[@"NSString"];
    [ZMAvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
    
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}
//不论在哪个线程中导致的crash，这里都是在主线程
- (void)dealwithCrashMessage:(NSNotification *)note {
    
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"\n\n在AppDelegate中 方法:dealwithCrashMessage方法中的日志输出\n\n你可以从note中获取到相关的crash信息，并且传到自己的服务器或者利用第三方SDK进行自定义异常的上报\n\n");    
}


@end
