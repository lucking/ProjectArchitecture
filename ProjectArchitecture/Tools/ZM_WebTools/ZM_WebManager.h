//
//  ZM_WebManager.h
//  ZM_Web
//
//  Created by ZM on 2018/1/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZM_WebManager : NSObject

//单例
+ (instancetype)sharedManager;

//UIWebView：清除UIWebView的缓存
+ (void)removeBufferMemory;

//UIWebView：清除Cookie
+ (void)removeCookie;

//UIWebView：清除缓存、Cookie
+ (void)removeBufferMemoryAndCookie;


/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不为空：@return YES
 */
+ (BOOL)isNotEmpty:(NSString *)object;

@end
