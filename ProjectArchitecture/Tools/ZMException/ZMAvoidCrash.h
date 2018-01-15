//
//  ZMAvoidCrash.h
//  ZM_NSException
//
//  Created by ZM on 2016/5/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <objc/runtime.h>

//define 宏
#import "ZMAvoidCrashStubProxy.h"

//category 类别
#import "NSObject+ZMAvoidCrash.h"

#import "NSArray+ZMAvoidCrash.h"
#import "NSMutableArray+ZMAvoidCrash.h"

#import "NSDictionary+ZMAvoidCrash.h"
#import "NSMutableDictionary+ZMAvoidCrash.h"

#import "NSString+ZMAvoidCrash.h"
#import "NSMutableString+ZMAvoidCrash.h"

#import "NSAttributedString+ZMAvoidCrash.h"
#import "NSMutableAttributedString+ZMAvoidCrash.h"




@interface ZMAvoidCrash : NSObject

/**
 *  你如果想要得到导致崩溃的原因，你可以在AppDelegate中监听通知
 *  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
 *
 */


/**
 *  
 *  开始生效.你可以在AppDelegate的didFinishLaunchingWithOptions方法中调用becomeEffective方法
 *  【默认不开启  对”unrecognized selector sent to instance”防止崩溃的处理】
 *
 *  这是全局生效，若你只需要部分生效，你可以单个进行处理，比如:
 *  [NSArray avoidCrashExchangeMethod];
 *  [NSMutableArray avoidCrashExchangeMethod];
 *  .................
 *  .................
 */
+ (void)becomeEffective;


/** 
 *  相比于becomeEffective，增加
 *  对”unrecognized selector sent to instance”防止崩溃的处理
 *  但是必须配合setupClassStringsArr:使用
 */
+ (void)makeAllEffective;

/** 
 *  初始化一个需要防止”unrecognized selector sent to instance”的崩溃的类名数组
 */
+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings;



// 你可以忽略以下方法
+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)noteErrorWithException:(NSException *)exception defaultToDo:(NSString *)defaultToDo;


@end
