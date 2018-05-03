//
//  AppDelegate.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/1/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+BaseSetting.h"
#import "AppDelegate+UM.h"
#import "IQKeyboardManager.h"
#import "GuidepageViewController.h"
#import "ServerConfig.h"
#import "NetworkReachability.h"
#import "NetworkSession.h"
#import "TestCommon.h"
#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate () {
    
}
@property (assign , nonatomic , readwrite) ReachabilityStatus  NetWorkStatus;
@end

@implementation AppDelegate

static AppDelegate *_singleInstance;
+(AppDelegate *)shareInstance {
    return _singleInstance;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    //1.AppDelegate
    _singleInstance = self;
    //2.基础设置
    [self BaseSetting];
    // 3.配置服务器环境   00:测试环境  01:生产环境   02:折扣宜家
    [ServerConfig configServer:@"01"];
    // 4.配置IQKeyboardManager
    [self configurationIQKeyboard];
    // 5.配置网络状态
    [self configurationNetWorkStatus];
    // 7.友盟的方法本身是异步执行，所以不需要再异步调用
    [self umengTrack];
    
    // 6.注册避免崩溃函数
//    [self configZMAvoidCrash];
   
    
    //NSUInteger networkType= [NetworkSession getNetworkStates];
    //NSLog(@"---networkType= %ld",networkType);
    NSLog(@"---NetWorkStatus= %ld",[AppDelegate sharedAppDelegate].NetWorkStatus);

//    [RACObserve(ZM_APPDelegate, NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
//        UUserDefaults.netWorkStatus = [networkStatus integerValue];
//        if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
//            NSLog(@"------> execute:@(RealStatusNotReachable)  ");
//        }else{
//            NSLog(@"------> networkStatus= %ld",[networkStatus integerValue]);
//        }
//        NSLog(@"---UUserDefaults.netWorkStatus= %ld",UUserDefaults.netWorkStatus);
//    }];

    //测试
    [TestCommon test];
    //进入主题主页：ZMTabBarController
    [self gotoMainPage];
//    //[UserDefaults removeObjectKey:@"firstLaunch"];
//    //判断用户是否第一次进入这个页面
//    if ([UserDefaults getBoolStorageWithKey:@"firstLaunch"]) {
//        // 主题
//        [self gotoMainPage];
//        
//    }else{
//        NSLog(@"第一次进入_开始：引导页");
//        [UserDefaults storageBool:YES Key:@"firstLaunch"];//第一次进入：保存进入标识
//        GuidepageViewController *GuideVC= [[GuidepageViewController alloc]init];
//        self.window.rootViewController = GuideVC;
//    }

    return YES;
}


// 配置网络状态
- (void)configurationNetWorkStatus
{
//    [GLobalRealReachability startNotifier];
//    RAC(self, NetWorkStatus) = [[[[[NSNotificationCenter defaultCenter]
//                                   rac_addObserverForName:kRealReachabilityChangedNotification object:nil]
//                                  map:^(NSNotification *notification) {
//                                      return @([notification.object currentReachabilityStatus]);
//                                  }]
//                                 startWith:@([GLobalRealReachability currentReachabilityStatus])]
//                                distinctUntilChanged];
}

#pragma mark 进入主题主页
- (void)gotoMainPage {
    NSLog(@"进入主页_gotoMainPage");
    self.tabBarVC = [[ZMTabBarController alloc] init];
    self.window.rootViewController = self.tabBarVC;
}


#pragma mark ============================"  页面回调  "==============================
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [self UM_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    return result;
}
//仅支持iOS9以上系统，iOS8及以下系统不会回调
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    BOOL result = [self UM_application:app openURL:url options:options];
    return result;
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [self UM_application:application handleOpenURL:url];
    return result;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"---> 2.挂起：即将失去活动状态的时候调用(失去焦点, 不可交互)：挂起 (Resign：放弃) ");
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"---> 3.系统进入后台 ");
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"---> 4.进入前台 \n ");
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"---> 5.重新启动 \n ");
}
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"---> 6.程序将终止 \n ");
}
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"---> 7.内存警告 \n ");
    [self didReceiveMemoryWarning];
}


@end
