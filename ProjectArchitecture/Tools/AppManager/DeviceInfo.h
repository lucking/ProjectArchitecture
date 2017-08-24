//
//  DeviceInfo.h
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum DeviceStyle
{
    iPhone4_Device,
    iPhone5_Device,
    iPhone6_Device,
    iPhone6p_Device,
    iPad_Device,
    unknown_Device
}DeviceStyle;

@interface DeviceInfo : NSObject
{
    
}
// 获取设备IP地址
+(NSString *)getIPAddress;


// 判断手机型号_1
+ (NSString *)ISIPHONEXX;
// 判断手机型号_2
+ (int)currentDeviceStyle;
// 判断屏幕类型，普通还是视网膜
+ (float)scale;
// 判断是否是模拟器
+ (BOOL)isSimulator;

//系统版本
+ (NSString *)systemVersion;

//获取当前系统UUID
+ (NSString *)getUUID;
//1.如果以上的都不支持,使用CFUUIDRef手动创建UUID
+ (NSString *)randomUUID;
//2.最后,添加到Keychain
+ (void)setValue:(NSString *)value forKey:(NSString *)key inService:(NSString *)service;


@end


//FOUNDATION_EXPORT NSString *const USERNAME;
