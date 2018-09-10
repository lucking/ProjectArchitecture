//
//  UMManager.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "UMManager.h"

@implementation UMManager

//判断对应平台 是否安装App
+ (BOOL)sharePlatformType:(UMSocialPlatformType)platformType
{
    if (platformType == UMSocialPlatformType_WechatSession ||
        platformType == UMSocialPlatformType_WechatTimeLine) {
        if (![[UMSocialManager defaultManager] isInstall:platformType]) {
            [HHudProgress hudShowMsg:@"请安装微信" delay:Hud_AlertTime addSubview:nil];
            return NO;
        }else{
            return YES;
        }
    }else if (platformType == UMSocialPlatformType_QQ ||
              platformType == UMSocialPlatformType_Qzone) {
        if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
            [HHudProgress hudShowMsg:@"请安装QQ" delay:Hud_AlertTime addSubview:nil];
            return NO;
        }else{
            return YES;
        }
    }else if (platformType == UMSocialPlatformType_Sina) {
        if (![[UMSocialManager defaultManager] isInstall:platformType]) {
            [HHudProgress hudShowMsg:@"请安装新浪微博" delay:Hud_AlertTime addSubview:nil];
            return NO;
        }else{
            return YES;
        }
    }else {
        return YES;
    }
}

@end
