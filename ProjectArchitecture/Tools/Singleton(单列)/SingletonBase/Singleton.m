//
//  Singleton.m
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
/**
 *  覆盖这个方法是阻止其他程序员编码“[[Singleton alloc]init]”。
 　　你永远不应该使用alloc自己。请写+实例在自己的子类。
 　　请参阅类方法+ Singleton.h实例。
 */
+ (id)alloc
{
	@throw [NSException exceptionWithName:@"单例模式的规则"
								   reason:@"禁止使用alloc自己创建这个对象,请使用+ singletonAlloc代替。"
								 userInfo:@{}];
	return nil;
}

+ (id)singletonAlloc
{
	return [super alloc];
}


/**
 *  原始方式：没有使用，看看就行
 *
 *  @return 返回一个实例
 */
+ (Singleton *)singleton
{
    static Singleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}



@end
