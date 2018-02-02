//
//  AppDelegate+UM.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate+UM.h"
#import <UMMobClick/MobClick.h>
//#import "UMMobClick/MobClick.h"


//我的
//#define  UM_APPKEY      @""
//公司的
#define  UM_APPKEY      @""

#define  RedirectURL    @"https://www.baidu.com/"

@implementation AppDelegate (UM)

- (void)test {

}

//友盟基础设置
- (void)umengTrack {
    /*        
     *   统计
     */
    [MobClick setLogEnabled:YES];
    UMConfigInstance.appKey = UM_APPKEY;
    UMConfigInstance.channelId = @"yiCaiApp";
    // UMConfigInstance.eSType = E_UM_GAME;
    [MobClick startWithConfigure:UMConfigInstance];
    /*
     *   分享
     */
    // 打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    // 设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UM_APPKEY];
    // 设置：分享平台
    [self configUSharePlatforms];
    // 设置：分享类型
    [self confitUShareSettings];
    
    
    //测试设备
//    Class cls = NSClassFromString(@"UMANUtil");
//    SEL deviceIDSelector = @selector(openUDIDString);
//    NSString *deviceID = nil;
//    if(cls && [cls respondsToSelector:deviceIDSelector]){
//        deviceID = [cls performSelector:deviceIDSelector];
//    }
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:nil];
//    NSLog(@"---> openUDIDString= %@ \n", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);

}

- (void)configUSharePlatforms
{
    //个人账号：111、222
    //公司账号：111、222
    /* 微信：的appKey和appSecret
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:@""
                                       appSecret:@""
                                     redirectURL:RedirectURL];
    //移除相应平台的分享，如微信收藏
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    
    /* QQ朋友空间：的appID
     * U-ShareSDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，
       而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     十进制：1105983491
     十六进制：41EBF803
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:@""
                                       appSecret:@""
                                     redirectURL:RedirectURL];
    
    /* 新浪微博：的appKey和appSecret
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:@""
                                       appSecret:@""
                                     redirectURL:RedirectURL];
    /* 支付宝：的appKey
     */
    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession
                                          appKey:@""
                                       appSecret:nil
                                     redirectURL:RedirectURL];
    
}

- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    
}

//分享回调：1.支持所有iOS系统
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


//分享回调：2.仅支持iOS9以上系统，iOS8及以下系统不会回调
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


//分享回调：3.支持目前所有iOS系统
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
