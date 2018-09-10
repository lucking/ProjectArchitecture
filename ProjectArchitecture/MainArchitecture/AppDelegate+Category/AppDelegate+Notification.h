//
//  AppDelegate+Notification.h
//  NSNotification_ZM
//
//  Created by ZM on 2017/2/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate (Notification) <UNUserNotificationCenterDelegate>
{
    
}
/**
 * 注册本地通知
 */
- (void)registerNotification;



/**
 本地推送1：使用 UNNotification 本地通知
 
 @param alerTime 一段时间后通知
 @param title 标题
 @param body 内容
 @param userInfo 设置一些额外的信息
 */
+ (void)registerUNNotification:(NSInteger )alerTime
                         title:(NSString *)title
                          body:(NSString *)body
                      userInfo:(NSDictionary *)userInfo;



/**
 本地推送2：使用 UINotification 本地通知
 
 @param alerTime 一段时间后通知
 @param title 标题
 @param body 内容
 @param action  设置锁屏时,字体下方显示的一个文字
 @param userInfo 设置一些额外的信息
 */
+ (void)registerUINotification:(NSInteger )alerTime
                         title:(NSString *)title
                          body:(NSString *)body
                        action:(NSString *)action
                      userInfo:(NSDictionary *)userInfo;
@end

