//
//  AppDelegate+BaseSetting.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate+BaseSetting.h"
#import "CatchCrash.h"
#import "AFNetworking.h"
#import "DeviceInfo.h"
#import "FileManager.h"
#import "SDWebImageManager.h"

#import <notify.h>
#define NotificationLock	CFSTR("com.apple.springboard.lockcomplete")
#define NotificationChange	CFSTR("com.apple.springboard.lockstate")
#define NotificationPwdUI	CFSTR("com.apple.springboard.hasBlankedScreen")


@implementation AppDelegate (BaseSetting)

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)BaseSetting {
    
    // 沙盒文件 路径
    //UIWindow *rootWindow =  [AppDelegate singleton].window;
    //NSLog(@"---> rootWindow = %@ \n ",rootWindow);
    NSLog(@"---> HomeDirectoryPath = %@ \n \n ",HomeDirectoryPath);
    
    //1.改变启动画面停留的时间
    [NSThread sleepForTimeInterval:1.0];
    //3.监控网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"-- Reachability_status_0: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    //4.锁屏通知：锁屏退出 //锁屏：command＋L
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationLock, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationChange, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    
    //5.注册异常处理函数
    [CatchCrash setExceptionHandler];
    
}

#pragma mark -- 处理内存警告
- (void)didReceiveMemoryWarning
{
    /**
     *  当收到Received memory warning.会调用此方法
     *  一般缓存的内容比较多了就需要进行：清空缓存、清除SDWebImage的内存和硬盘时，可以同时清除session 和 cookie的缓存。
     */
    SDWebImageManager *SDImgManager = [SDWebImageManager sharedManager];
    //取消下载
    [SDImgManager cancelAll];
    //清空缓存
    //[SDImgManager.imageCache clearMemory];
    //清理缓存：同上
    [[SDImageCache sharedImageCache] clearMemory];
    // 清理硬盘
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    
    // 清理webview 缓存
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config.URLCache removeAllCachedResponses];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}


#pragma mark -- 锁屏退出：锁屏进入后台
static void screenLockStateChanged(CFNotificationCenterRef center,void* observer,CFStringRef name,const void* object,CFDictionaryRef userInfo)
{
    NSString* lockstate = (__bridge NSString*)name;
    if ([lockstate isEqualToString:(__bridge NSString*)NotificationLock]) {
        NSSLog(@"locked.");
    } else {
        NSSLog(@"lock state changed.");
    }
}


@end
