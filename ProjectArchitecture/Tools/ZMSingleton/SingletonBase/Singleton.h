//
//  Singleton.h
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Impl：初始微程序装载（Initial Microprogram Loading）
//#if DEBUG
//    #define SINGLETON_INSTANCE_LOG(x) NSLog(@"Singleton object <%s(%@)> has been created.",#x, [x class])
//#else
//    #define SINGLETON_INSTANCE_LOG(x)
//#endif
// DEBUG 宏定义模式不用
#define SINGLETON_INSTANCE_LOG(x)


#define Singleton_Instance_method_Interface(ClassName) \
		+ (ClassName *)instance;
#define Singleton_Instance_method_Impl(ClassName) \
		+ (ClassName *)instance \
		{   \
			static ClassName *_g_##ClassName##_obj = nil;  \
			static dispatch_once_t onceToken;   \
			dispatch_once(&onceToken, ^{    \
			_g_##ClassName##_obj = [[self singletonAlloc] init];    \
			SINGLETON_INSTANCE_LOG(_g_##ClassName##_obj);   \
			}); \
		return _g_##ClassName##_obj;    \
		}


// 不继承于 Singleton 的初始微程序装载（实例化）
#define Singleton_Instance_method_ImplAlloc(ClassName) \
		+ (ClassName *)instance \
		{   \
			static ClassName *_g_##ClassName##_obj = nil;  \
			static dispatch_once_t onceToken;   \
			dispatch_once(&onceToken, ^{    \
			_g_##ClassName##_obj = [[self alloc] init];    \
			SINGLETON_INSTANCE_LOG(_g_##ClassName##_obj);   \
			}); \
		return _g_##ClassName##_obj;    \
		}


/**
 *  我建议:
 　　单例类都应该继承JKSingletonObject这个项目。
 　　强迫每个人都使用+ singletonAlloc对团队有好处。
 */

@interface Singleton : NSObject

+ (id)singletonAlloc;


@end
