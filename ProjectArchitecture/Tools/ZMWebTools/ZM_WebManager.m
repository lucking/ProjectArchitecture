//
//  ZM_WebManager.m
//  ZM_Web
//
//  Created by ZM on 2018/1/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_WebManager.h"

@implementation ZM_WebManager

+ (instancetype)sharedManager {
    static ZM_WebManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [ZM_WebManager new];
    });
    return  _instance;
}


//清除UIWebView的缓存
+ (void)removeBufferMemory {
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}
//UIWebView清除Cookie
+ (void)removeCookie {
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
}
//清除UIWebView的：缓存、Cookie
+ (void)removeBufferMemoryAndCookie {
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}

/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不为空：@return YES
 */
+ (BOOL)isNotEmpty:(NSString *)object {
    
    if (!object) {
        return NO;
    }
    else if ([object isEqualToString:@""]) {
        return NO;
    }
    else if (object.length == 0) {
        return NO;
    }
    else if (object == nil) {
        return NO;
    }
    else if (object && [object isEqual:[NSNull null]]){
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return NO;
    }
    else if ([object isEqualToString:@"<null>"]){
        return NO;
    }
    else if ([[object lowercaseString] isEqualToString:@"null"]){
        return NO;
    }
    return YES;
}

@end
