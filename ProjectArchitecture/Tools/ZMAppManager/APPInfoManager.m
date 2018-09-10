//
//  APPInfoManager.m
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "APPInfoManager.h"

static NSMutableDictionary *infoDict ;

@implementation APPInfoManager

//Singleton_Instance_method_Impl(APPInfoManager);

- (void)testUse{

    //    NSUUID* uuid = [[NSUUID alloc]init];
    //    [uuid getUUIDBytes:nil];
    NSLog(@"NSLog");
    NSLog(@"---> currentSystemVersion = %@ ",[APPInfoManager zm_currentSystemVersion]);
    NSLog(@"---> currentAPPVersion = %@ ",[APPInfoManager zm_currentAPPVersion]);
    NSLog(@"---> cellularProvider = %@ ",[APPInfoManager zm_cellularProvider]);

    NSLog(@"---> getBatteryState = %@ ",[APPInfoManager zm_getBatteryState]);
    NSLog(@"---> getBatteryLevel = %f \n\n ",[APPInfoManager zm_getBatteryLevel]);
}

/**
 *  @return 返回一个实例
 */
+ (APPInfoManager *)singleton
{
    static APPInfoManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark 获取系统配置文件
- (NSDictionary *)zm_getInfoDictionary{
    NSDictionary *infoDictionary= [[NSBundle mainBundle] infoDictionary];
    return infoDictionary;
}

// 根据key 获取对应的配置信息
+(NSObject *)zm_getValueOfInfoDict:(NSString *)key{
    if(infoDict == nil){
        NSString* File = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        infoDict = [[NSMutableDictionary alloc] initWithContentsOfFile:File];
    }
    return [infoDict objectForKey:key];
}

// Version
- (NSString *)zm_appVersion{
    NSString *Versionid = [[self zm_getInfoDictionary] objectForKey:@"CFBundleVersion"];
    return Versionid;
}
// AppName
- (NSString *)zm_appName{
    return [[self zm_getInfoDictionary] objectForKey:@"CFBundleName"];
}
// AppId
- (NSString *)zm_appId{
    return [[self zm_getInfoDictionary] objectForKey:@"CFBundleIdentifier"];
}

// CFBundleInfoPlistURL
- (NSString *)zm_CFBundleInfoPlistURL{
    return [[self zm_getInfoDictionary] objectForKey:@"CFBundleInfoPlistURL"];
}
/**
 *  ......
 */

//============================"    "=============================

//获取当前系统版本号
+ (NSString *)zm_currentSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}
//获取当前APP版本号
+ (NSString *)zm_currentAPPVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}


//获取运营商名称
+ (NSString *)zm_cellularProvider
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    return mCarrier;
}

//获取电池状态和等级
+ (NSString*)zm_getBatteryState {
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return @"UnKnow";
    }else if (device.batteryState == UIDeviceBatteryStateUnplugged){
        return @"Unplugged";//未充电
    }else if (device.batteryState == UIDeviceBatteryStateCharging){
        return @"Charging";//正在充电
    }else if (device.batteryState == UIDeviceBatteryStateFull){
        return @"Full";//满电
    }
    return nil;
}
//获取电量的等级，0.00~1.00
+ (float)zm_getBatteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

@end

