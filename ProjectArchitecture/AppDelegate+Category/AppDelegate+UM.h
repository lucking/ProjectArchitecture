//
//  AppDelegate+UM.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate.h"
//#import "UMMobClick/MobClick.h"
#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate (UM)
{
    
}
//友盟设置
- (void)umengTrack;


//分享回调：1.支持所有iOS系统
- (BOOL)UM_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
//注：以上为建议使用的系统openURL回调，且 新浪 平台仅支持以上回调。还有以下两种回调方式，如果开发者选取以下回调，也请补充相应的函数调用。


//分享回调：2.仅支持iOS9以上系统，iOS8及以下系统不会回调
- (BOOL)UM_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;


//分享回调：3.支持目前所有iOS系统
- (BOOL)UM_application:(UIApplication *)application handleOpenURL:(NSURL *)url;


@end
