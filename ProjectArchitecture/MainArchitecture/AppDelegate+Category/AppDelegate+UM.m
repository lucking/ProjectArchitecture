//
//  AppDelegate+UM.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate+UM.h"
#import <UMMobClick/MobClick.h>
//公司的
#define  UM_APPKEY      @"5b0f8ba8a40fa379d000017f"
#define  UM_RedirectURL @"http://www.lianqing365.com"
//@"App Store"
#define  UM_ChannelId   @"miHuanApp"


@implementation AppDelegate (UM)

- (void)test {
//    //http://dev.umeng.com/analytics/ios-doc/integration
//    //统计配置
//    //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
//    [MobClick setAppVersion:XcodeAppVersion];
//    //UMConfigInstance.eSType = E_UM_GAME; //仅适用于游戏场景，应用统计不用设置
//    UMConfigInstance.appKey = UM_APPKEY;
//    UMConfigInstance.channelId = UM_ChannelId; 
//    UMConfigInstance.secret = @"secretstringaldfkals";
//    [MobClick profileSignInWithPUID:@"playerID"];
//    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！    
//    
//    //[MobClick setEncryptEnabled:YES];    /** 设置是否对日志信息进行加密, 默认NO(不加密). */
//    [MobClick setLogEnabled:YES];          /** 设置是否开启background模式, 默认YES. */
//    [MobClick setCrashReportEnabled:YES];  /** 开启CrashReport收集, 默认YES(开启状态).*/
//    
//    //统计使用
//    //账号的统计：当用户使用自有账号登录时，可以这样统计：
//    [MobClick profileSignInWithPUID:@"playerID"];
//    //计数事件
//    [MobClick event:@"eventId"];
    
}

//友盟基础设置
- (void)umengTrack {
    /*        
     *   统计
     */
    
#ifdef DEBUG

#else
    [MobClick setLogEnabled:NO];
    UMConfigInstance.appKey    = UM_APPKEY;
    UMConfigInstance.channelId = UM_ChannelId;
    // UMConfigInstance.eSType = E_UM_GAME;
    [MobClick startWithConfigure:UMConfigInstance];
#endif

    
    /*
     *   分享
     */
    // 打开调试日志
    [[UMSocialManager defaultManager] openLog:NO];
    // 设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UM_APPKEY];
    // 设置：分享平台
    [self configUSharePlatforms];
    // 设置：分享类型
    [self confitUShareSettings];
}


/* 微信：appKey、appSecret
 */
#define  UM_WX_appKey       @"wx6fc1a474ef835809"
#define  UM_WX_appSecret    @"d3906c467a18b919ed79e6a8b821c669"
/* 
 * QQ：的appID
    十进制：1106864885
    十六进制：41F96AF5
 */
#define  UM_QQ_appKey       @"1106864885"
#define  UM_QQ_appSecret    @"DyH1OEXdGTEgtlnI"
/* 
 * 新浪微博：appKey、appSecret
 */
//#define  UM_Sina_appKey     @"3072750706"
//#define  UM_Sina_appSecret  @"9c1b1bab17e6094eed59c2a31d02a237"
#define  UM_Sina_appKey     @"912651397"
#define  UM_Sina_appSecret  @"64f96f12e75723120d28e61b1fd5d358"

/* 
 * 支付宝：appKey
 */
#define  UM_Alipay_appKey     @"2015111700822536"
#define  UM_Alipay_appSecret  @""


- (void)configUSharePlatforms
{ 
    /* 微信：的appKey和appSecret 
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:UM_WX_appKey
                                       appSecret:UM_WX_appSecret redirectURL:UM_RedirectURL];
    //移除相应平台的分享，如微信收藏
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* QQ：的appID
     * U-ShareSDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，
     而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:UM_QQ_appKey
                                       appSecret:UM_QQ_appSecret redirectURL:UM_RedirectURL];
    /* 新浪微博：的appKey和appSecret
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:UM_Sina_appKey
                                       appSecret:UM_Sina_appSecret redirectURL:UM_RedirectURL];
    /* 支付宝：的appKey
     */
    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession
                                          appKey:UM_Alipay_appKey
                                       appSecret:UM_Alipay_appSecret redirectURL:UM_RedirectURL];
}

- (void)confitUShareSettings 
{

}

//分享回调：0.支持所有iOS系统
- (BOOL)UM_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"---> openURL_11 = %@", [url absoluteString]);
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
//注：以上为建议使用的系统openURL回调，且 新浪 平台仅支持以上回调。还有以下两种回调方式，如果开发者选取以下回调，也请补充相应的函数调用。



//分享回调：1.仅支持iOS9以上系统，iOS8及以下系统不会回调
- (BOOL)UM_application:(UIApplication *)app openURL:(NSURL *)url 
               options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    NSLog(@"---> openURL_22 = %@", [url absoluteString]);
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


//分享回调：2.支持目前所有iOS系统
- (BOOL)UM_application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"---> openURL_33 = %@", [url absoluteString]);
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        NSLog(@"---> 其他如支付等SDK的回调");
    }
    return result;
}


@end

