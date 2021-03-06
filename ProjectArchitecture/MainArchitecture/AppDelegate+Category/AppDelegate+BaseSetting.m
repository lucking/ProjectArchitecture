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

#import <IQKeyboardManager/IQKeyboardManager.h> 
#import "ZMAvoidCrash.h"
//#import "BaiduMobStat.h"
//#define  BaiduAppKEY   @"0cd2aa1e76"
#define  AppDelegateHomeDirectoryPath    NSHomeDirectory()

@implementation AppDelegate (BaseSetting)

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)BaseSetting {
    //1.沙盒文件 路径
    NSLog(@"---> HomeDirectoryPath = %@ \n ",AppDelegateHomeDirectoryPath);    
    //2.判断手机型号：IPHONE尺寸
//    [DeviceInfo ISIPHONEXX];
    
    //3.监控网络状态
    //4.锁屏通知：锁屏退出 //锁屏：command＋L
    [AppDelegate shareInstance].lockStates = LockStatesOpenScreen;
    //[self configScreenLockState];
    //5.注册异常处理函数
    //[CatchCrash setExceptionHandler];
    
    // 百度统计：设置您在mtj网站上添加的app的appkey,此处AppId即为应用的appKey
//    [[BaiduMobStat defaultStat] startWithAppId:BaiduAppKEY]; 
}

#pragma mark - 配置键盘处理：IQKeyboardManager
- (void)configurationIQKeyboard {
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    manager.enable = YES;                                       // 控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;                   // 控制点击背景是否收起键盘
    manager.enableAutoToolbar = NO;                             // 控制是否显示键盘上的工具条
    manager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    manager.keyboardDistanceFromTextField = 60.0f;              // 输入框距离键盘的距离
    
    
//    IQKeyboardManager *manager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
//    manager.enable = YES;                               // 控制整个功能是否启用
//    manager.shouldResignOnTouchOutside = YES;           // 控制点击背景是否收起键盘
//    manager.shouldToolbarUsesTextFieldTintColor = YES;  // 控制键盘上的工具条文字颜色是否用户自定义
//    // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
//    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews; 
//    manager.enableAutoToolbar = YES;                            // 控制是否显示键盘上的工具条
//    //keyboardManager.shouldShowTextFieldPlaceholder = YES;     // 是否显示占位文字
//    manager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
//    manager.keyboardDistanceFromTextField = 60.0f;              // 输入框距离键盘的距离
}

#pragma mark - 7.自定义：注册避免崩溃函数
- (void)configZMAvoidCrash {

    //1.是全局生效： 启动防止崩溃功能(注意区分becomeEffective和makeAllEffective的区别)
    [ZMAvoidCrash makeAllEffective];
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}
//不论在哪个线程中导致的crash，这里都是在主线程
- (void)dealwithCrashMessage:(NSNotification *)note {
    
    //注意: 所有的信息都在userInfo中, 可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"\n\n在AppDelegate中 方法:dealwithCrashMessage方法中的日志输出\n\n你可以从note中获取到相关的crash信息，并且传到自己的服务器或者利用第三方SDK进行自定义异常的上报\n\n");    
}

#pragma mark -- 处理内存警告
- (void)didReceiveMemoryWarning
{
    //当收到Received memory warning.会调用此方法
    //一般缓存的内容比较多了就需要进行：清空缓存、清除SDWebImage的内存和硬盘时，可以同时清除session 和 cookie的缓存。
    SDWebImageManager *SDImgManager = [SDWebImageManager sharedManager];
    //取消下载
    [SDImgManager cancelAll];
    //清空缓存
    //[SDImgManager.imageCache clearMemory];
    //清理缓存：同上
    [[SDImageCache sharedImageCache] clearMemory];
    // 清理硬盘
    //[[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    // 清理webview 缓存
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config.URLCache removeAllCachedResponses];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

//1.实现 applicationProtectedDataWillBecomeUnavailable: 方法监听锁屏（可用：审核通过）
#define LOCK_SCREEN_NOTIFY @"LockScreenNotify"
- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application
{
    [[NSNotificationCenter defaultCenter] postNotificationName:LOCK_SCREEN_NOTIFY object:nil];
    NSLog(@"---锁屏 Lock screen.");
}

//2.实现 applicationProtectedDataDidBecomeAvailable: 方法监听解锁（可用：审核通过）
#define UN_LOCK_SCREEN_NOTIFY @"UnLockScreenNotify"
- (void) applicationProtectedDataDidBecomeAvailable:(UIApplication *)application
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UN_LOCK_SCREEN_NOTIFY object:nil];
    NSLog(@"---解屏 UnLock screen.");
}



@end
