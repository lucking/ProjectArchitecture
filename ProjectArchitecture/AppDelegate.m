//
//  AppDelegate.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/1/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+BaseSetting.h"
#import "IQKeyboardManager.h"
#import "GuidepageViewController.h"
#import "ServerConfig.h"
#import "DeviceInfo.h"
#import "NetworkReachability.h"
//测试
#import "AssertHandler.h"
#import "CatchCrash.h"
#import "NSData+ZMAdd.h"
#import "Person.h"
#import "DeviceInfo.h"

@interface AppDelegate () {
    
}
@property (assign , nonatomic , readwrite) ReachabilityStatus  NetWorkStatus;
@end

@implementation AppDelegate

static AppDelegate *_singleInstance;
+(AppDelegate *)singleton {
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
    // 配置服务器环境   00:测试环境  01:生产环境   02:折扣宜家
    [ServerConfig configServer:@"01"];
    // 配置IQKeyboardManager
    [self configurationIQKeyboard];
    // 配置网络状态
    [self configurationNetWorkStatus];
    
    //测试
    [self test];
    
    //进入主题主页：ZMTabBarController
    [self gotoMainPage];
    return YES;
}


//测试
- (void)test {
    //测试 配置网络状态
    [NetworkReachability netWorkReachabilityStatus];
    
    // 设备信息管理
    NSLog(@"---> randomUUID_1= %@ ",[DeviceInfo randomUUID]);
    NSLog(@"---> randomUUID_2= %@ ",[DeviceInfo randomUUID]);
    
//    Person *pp = [[Person alloc] init];
//    [pp setValue:@"aaaa" forKey:@"firstName"];
//    [pp setValue:@"bbb" forKey:@"name"];
    
    
//    //断点配置
//    AssertHandler *myHandler = [[AssertHandler alloc] init];
//    // 配置给当前的线程_跳跃崩溃断点_并打印崩溃日志
//    [[[NSThread currentThread] threadDictionary] setValue:myHandler forKey:NSAssertionHandlerKey];
//    // 手动断点
//    [myHandler printMyName:nil];
//    
//    // NSMutableArray+Extension 交换方法_跳过崩溃
//    NSString *nilStr = nil;
//    NSMutableArray *arrayM = [NSMutableArray array];
//    [arrayM addObject:nilStr];
    
    
    //    //[UserDefaults removeObjectKey:@"firstLaunch"];
    //    //判断用户是否第一次进入这个页面
    //    if ([UserDefaults getBoolStorageWithKey:@"firstLaunch"]) {
    //        // 主题
    //        [self gotoMainPage];
    //
    //    }else{
    //        NSSLog(@"第一次进入_开始：引导页");
    //        [UserDefaults storageBool:YES Key:@"firstLaunch"];//第一次进入：保存进入标识
    //        GuidepageViewController *GuideVC= [[GuidepageViewController alloc]init];
    //        self.window.rootViewController = GuideVC;
    //    }
    
}

// 配置IQKeyboardManager
- (void)configurationIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}
// 配置网络状态
- (void)configurationNetWorkStatus
{
    [GLobalRealReachability startNotifier];
    
    RAC(self, NetWorkStatus) = [[[[[NSNotificationCenter defaultCenter]
                                   rac_addObserverForName:kRealReachabilityChangedNotification object:nil]
                                  map:^(NSNotification *notification) {
                                      return @([notification.object currentReachabilityStatus]);
                                  }]
                                 startWith:@([GLobalRealReachability currentReachabilityStatus])]
                                distinctUntilChanged];
}

#pragma mark 进入主题主页
- (void)gotoMainPage {
    NSSLog(@"进入主页_gotoMainPage");
    self.tabBarVC = [[ZMTabBarController alloc] init];
    self.window.rootViewController = self.tabBarVC;
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
