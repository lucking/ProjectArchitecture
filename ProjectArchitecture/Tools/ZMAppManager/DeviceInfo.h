//
//  DeviceInfo.h
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum DeviceStyle
{
    iPhone4_Device,
    iPhone5_Device,
    iPhone6_Device,
    iPhone6p_Device,
    iPad_Device,
    unknown_Device
}DeviceStyle;

typedef NS_ENUM(NSUInteger, DeviceBatteryStateType) {
    DeviceBatteryStateTypeUnknown   =0, //无法获得充电状态
    DeviceBatteryStateTypeUnplugged =1, //非充电状态
    DeviceBatteryStateTypeCharging  =2, //充电状态
    DeviceBatteryStateTypeFull      =3, //充满状态
    DeviceBatteryStateTypeUnusual   =4  //其他异常状态
};

@interface DeviceInfo : NSObject

// 单例
+ (DeviceInfo *)singleton;


/**
 *  获取设备ID
 *  @return 设备ID
 */
+ (NSString *)zm_buglyDeviceId;
// 获取当前系统UUID：NSUUID
+ (NSString *)zm_createNSUUID;
// 获取当前系统UUID：CFUUID
+ (NSString *)zm_createCFUUID;
// 获取 IDFV：UDID
+ (NSString *)zm_appUDID;
+ (NSString *)zm_getIDFV;
// 获取UUID
+ (NSString *)zm_appIDFV;


// 获取设备：电池电量信息
- (float)zm_getDeviceBatterLevel;
// 获取设备：电池的充电信息
- (DeviceBatteryStateType)zm_getDeviceBatterState;

//获取设备：Wifi信号强度(在Wifi状态下返回字符串类型的1,2,3...)
- (NSString *)zm_getDeviceWifiSignalStrength;
//您可以使用以下信号获得信号强度：
- (void)zm_getSignalStrength;


// 获取设备IP地址
+(NSString *)zm_getIPAddress;


// 判断手机型号_1
+ (NSString *)zm_ISIPHONEXX;
// 判断手机型号_2
+ (int)zm_currentDeviceStyle;
// 判断屏幕类型，普通还是视网膜
+ (float)zm_scale;
// 判断是否是模拟器
+ (BOOL)zm_isSimulator;

//系统版本
+ (NSString *)zm_systemVersion;
+ (CGFloat )zm_systemVersionFloat;

//获取当前系统UUID
+ (NSString *)zm_getUUID;
//1.如果以上的都不支持,使用CFUUIDRef手动创建UUID
+ (NSString *)zm_randomUUID;
//2.最后,添加到Keychain
+ (void)zm_setValue:(NSString *)value forKey:(NSString *)key inService:(NSString *)service;

@end
