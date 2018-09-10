//
//  AppDelegate+Notification.m
//  NSNotification_ZM
//
//  Created by ZM on 2017/2/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate+Notification.h"
#import "UIAlertController+ZMAdd.h"

@implementation AppDelegate (Notification)

//注册本地通知
- (void)registerNotification {
    
#ifdef __IPHONE_10_0
    [self registerUNUserNotification];
#else
    [self registerUINotification];
#endif
    
}
//==========="   本地推送通知：UNUserNotificationCenter   systemVersion >= 10.0 "===================

- (void)registerUNUserNotification {
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        // 基于授权启用或禁用功能。
    }];
    //获取当前的通知设置，UNNotificationSettings 是只读对象，不能直接修改，只能通过以下方法获取
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        
    }];
}

#pragma mark - UNUserNotificationCenterDelegate

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
    //1. 处理通知：在展示通知前进行处理，即有机会在展示通知前再修改通知内容。
    //2. 处理完成后条用 completionHandler ，用于指示在前台显示通知的形式
    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
}

//设置内容
+ (void)registerUNNotification:(NSInteger )alerTime
                         title:(NSString *)title
                          body:(NSString *)body
                      userInfo:(NSDictionary *)userInfo
{
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey: title arguments:nil];
    content.body  = [NSString localizedUserNotificationStringForKey: body arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = userInfo;
    // 在 alertTime 后推送本地推送
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:alerTime
                                                  repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content
                                                                          trigger:trigger];
    //添加推送 成功后的处理
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        [UIAlertController zm_alertWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
    }];
}



//==========="   本地推送通知：UIUserNotificationSettings   systemVersion < 10.0 "===================
//注册成功，并返回YES
-(BOOL)registerUINotification
{
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType type= UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        
        UIUserNotificationSettings* settings= [UIUserNotificationSettings settingsForTypes:type categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        return YES;
    }
    return NO;
}
//设置内容
+ (void)registerUINotification:(NSInteger )alerTime
                         title:(NSString *)title
                          body:(NSString *)body
                        action:(NSString *)action
                      userInfo:(NSDictionary *)userInfo
{
    
    // 1.创建一个本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow: alerTime];
    localNote.alertTitle= title;
    localNote.alertBody = body;
    if (localNote.alertBody) {
        localNote.alertAction = action;
        localNote.hasAction = YES;
    }
    localNote.alertLaunchImage = @"Photo";
    localNote.soundName = UILocalNotificationDefaultSoundName;
    
    localNote.userInfo = userInfo;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}

//1.1成功注册
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"--->1.1：成功注册: %@ ",notificationSettings);
}
//1.2接收本地推送: 消息后调用的方法
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification*)notification
{
    NSLog(@"--->1.2：收到本地推送消息: %@ \n ",notification);
    // 图标上的数字
    //application.applicationIconBadgeNumber = 0;
}
//1.3 本地推送：点击按钮
-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    //在非本App界面时收到本地消息，下拉消息会有快捷回复的按钮，点击按钮后调用的方法，根据identifier来判断点击的哪个按钮，notification为消息内容
    NSLog(@" --->1.3： %@ 、%@ ",identifier,notification);
    //处理完消息，最后一定要调用这个代码块
    completionHandler(UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
}



@end
