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
#import "NetworkReachability.h"
//测试
#import "AssertHandler.h"
#import "CatchCrash.h"
#import "ZMAvoidCrash.h"
#import "NSData+ZMAdd.h"
#import "Person.h"
#import "NSDate+ZMAdd.h"
#import "APPInfoManager.h"
#import "DeviceInfo.h"
#import "NetworkSession.h"

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
    // 3.配置服务器环境   00:测试环境  01:生产环境   02:折扣宜家
    [ServerConfig configServer:@"01"];
    // 4.配置IQKeyboardManager
    [self configurationIQKeyboard];
    // 5.配置网络状态
    [self configurationNetWorkStatus];
    // 6.注册避免崩溃函数
    [self configZMAvoidCrash];
    
    NSUInteger networkType= [NetworkSession getNetworkStates];
    NSLog(@"---networkType= %ld",networkType);
    NSLog(@"---NetWorkStatus= %ld",[AppDelegate sharedAppDelegate].NetWorkStatus);

    [RACObserve(ZM_APPDelegate, NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
        UUserDefaults.netWorkStatus = [networkStatus integerValue];
        if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
            NSLog(@"------> execute:@(RealStatusNotReachable)  ");
        }else{
            NSLog(@"------> networkStatus= %ld",[networkStatus integerValue]);
        }
        NSLog(@"---UUserDefaults.netWorkStatus= %ld",UUserDefaults.netWorkStatus);
    }];

    //测试
    [self test];
    //进入主题主页：ZMTabBarController
    [self gotoMainPage];
    return YES;
}

//测试
- (void)test {
    //[DeviceInfo ISIPHONEXX];
    [NSData nowTest];
    
    //测试 配置网络状态
    [NetworkReachability netWorkReachabilityStatus];
    // 设备信息管理
    NSLog(@"---> randomUUID_1= %@ ",[DeviceInfo randomUUID]);
    NSLog(@"---> randomUUID_2= %@ ",[DeviceInfo randomUUID]);

    NSLog(@"---> systemVersion= %@ ",[DeviceInfo systemVersion]);
    NSLog(@"---> appVersion= %@ ",[[APPInfoManager singleton] appVersion]);

    //获取当前时间戳
    NSLog(@"---> getNowTimeTimestamp0= %@ ",[NSDate timeSwitchTimestampFormatter:@"YYYY-MM-dd HH:mm:ss"]);
    NSLog(@"---> getNowTimeTimestamp1= %@ ",[NSDate getNowTimestamp]);
    NSLog(@"---> getNowTimeTimestamp2= %@ ",[NSDate getNowTimestampOfSecond]);
    NSLog(@"---> getNowTimeTimestamp3= %@ ",[NSDate getNowTimestampOfMillisecond]);

    NSString *timestamp = [NSDate getNowTimestamp];
    NSLog(@"---> timestamp.length= %ld ",timestamp.length);

    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)) {
        
    }
    
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

//3.自定义：注册避免崩溃函数
- (void)configZMAvoidCrash {
    /*
     *  [AvoidCrash becomeEffective]、[AvoidCrash makeAllEffective]
     *  是全局生效。若你只需要部分生效，你可以单个进行处理，比如:
     *  [NSArray avoidCrashExchangeMethod];
     *  [NSMutableArray avoidCrashExchangeMethod];
     *  ......
     */    
    //启动防止崩溃功能(注意区分becomeEffective和makeAllEffective的区别)
    //具体区别请看 AvoidCrash.h中的描述
    //建议在didFinishLaunchingWithOptions最初始位置调用 上面的方法
    [ZMAvoidCrash makeAllEffective];
    
    //若出现unrecognized selector sent to instance并且控制台输出:
    //-[__NSCFConstantString initWithName:age:height:weight:]: unrecognized selector sent to instance
    //你可以将@"__NSCFConstantString"添加到如下数组中，当然，你也可以将它的父类添加到下面数组中
    //比如，对于部分字符串，继承关系如下
    //__NSCFConstantString --> __NSCFString --> NSMutableString --> NSString
    //你可以将上面四个类随意一个添加到下面的数组中，建议直接填入 NSString
    NSArray *noneSelClassStrings = @[@"NSString"
                                     ];
    [ZMAvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
    
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}
- (void)dealwithCrashMessage:(NSNotification *)note {
    //不论在哪个线程中导致的crash，这里都是在主线程
    
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"\n\n在AppDelegate中 方法:dealwithCrashMessage方法中的日志输出\n\n你可以从note中获取到相关的crash信息，并且传到自己的服务器或者利用第三方SDK进行自定义异常的上报\n\n");    
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
