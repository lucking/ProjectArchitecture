//
//  DeviceInfo.m
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "DeviceInfo.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/sysctl.h>//系统参数 使用
#import "AppMacro.h"

@implementation DeviceInfo


- (void)test {
    // 判断手机型号：IPHONE尺寸
    [DeviceInfo ISIPHONEXX];
    // 判断系统版本
    if([[UIDevice currentDevice].systemVersion floatValue]<=10.0)
    {
        
    }
    NSLog(@"---> currentDeviceStyle = %d ",[DeviceInfo currentDeviceStyle]);
    NSLog(@"---> UUID = %@ ",[DeviceInfo getUUID]);

    //将“UIStatusBarSignalStrengthItemView”替换为“UIStatusBarDataNetworkItemView”和“signalStrengthRaw”与“wifiStrengthBars”。不幸的是“wifiStrengthRaw”总是返回0.
    //看起来很棒 - 但是，这不会算作使用私有API，因此被拒绝吗？
    //是的，它将被拒绝，因为它使用私有变量。
}

/**
 *  @return 返回一个实例
 */
+ (DeviceInfo *)singleton
{
    static DeviceInfo *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//获取设备：电量的等级，0.00~1.00
- (float)getDeviceBatterLevel {
    //通过UIDevice获取电池的状态转换。
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;//开启了监视电池状态的功能
    return device.batteryLevel;
}

//获取设备：电池的充电信息
- (DeviceBatteryStateType)getDeviceBatterState {

    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    DeviceBatteryStateType batteryStateType;
    //switch判断类型
    switch (device.batteryState) {
        case UIDeviceBatteryStateUnknown:
            batteryStateType = DeviceBatteryStateTypeUnknown;//无法获得充电状态
            break;
        case UIDeviceBatteryStateUnplugged:
            batteryStateType = DeviceBatteryStateTypeUnplugged;//非充电状态
            break;
        case UIDeviceBatteryStateCharging:
            batteryStateType = DeviceBatteryStateTypeCharging;//充电状态
            break;
        case UIDeviceBatteryStateFull:
            batteryStateType = DeviceBatteryStateTypeFull;//充满状态
            break;
        default:
            batteryStateType = DeviceBatteryStateTypeUnusual;//其他异常状态
            break;
    }
    return batteryStateType;
}

//获取设备：Wifi信号强度(在Wifi状态下返回字符串类型的1,2,3...)
- (NSString *)getDeviceWifiSignalStrength {
    //获取application对象
    UIApplication *app = [UIApplication sharedApplication];
    //获取statusBar和foregroundView保存信息的数组
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSString *dataNetworkItemView = nil;

    for (id child in subviews) {//获取网络返回码
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = child;
            break;
        }
    }
    return [dataNetworkItemView valueForKey:@"_wifiStrengthBars"];//取到wifi状态时对应的信号强度的字符串
}

//您可以使用以下信号获得信号强度：
- (void)getSignalStrength {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSString *dataNetworkItemView = nil;
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarSignalStrengthItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    int signalStrength = [[dataNetworkItemView valueForKey:@"signalStrengthRaw"] intValue];
    NSLog(@"signal %d \n ", signalStrength);
}




// 获取设备IP地址
+(NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // 检索当前接口,在成功时,返回0
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // 循环链表的接口
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // 检查接口是否en0 wifi连接在iPhone上
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // 得到NSString从C字符串
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // 释放内存
    freeifaddrs(interfaces);
    return address;
}

// 判断手机型号_1
+ (NSString *)ISIPHONEXX {
    NSLog(@"---> SSWIDTH = %@",@(SSWIDTH));
    NSLog(@"---> SSHEIGHT= %@",@(SSHEIGHT));
    if (IS_IPHONE4) {       return @"IS_IPHONE4";
        
    }else if (IS_IPHONE5){  return @"IS_IPHONE5";
        
    }else if (IS_IPHONE6){  return @"IS_IPHONE6";
        
    }else if (IS_IPHONE6p){ return @"IS_IPHONE6p";
        
    }else if (IS_IPHONE8X){ return @"IS_IPHONE8X";
    }
    return @"IS_IPHONExx未知";
}
//判断手机型号_2
+ (int)currentDeviceStyle
{
    float Height = [UIScreen mainScreen].bounds.size.height;
    float Width = [UIScreen mainScreen].bounds.size.width;
    //NSLog(@"Height=%f __ Width=%f", Height, Width);
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        return iPad_Device;
    }else {
        if (Height == 667) {
            return iPhone6_Device;
            
        }else if (Height == 568&& Width == 320) {
            return iPhone5_Device;
            
        }else if (Height == 480) {
            return iPhone4_Device;
            
        }else if (Height == 736.000000) {
            return iPhone6p_Device;
        }else{
            return unknown_Device;
        }
    }
}

// 判断屏幕类型，普通还是视网膜
+ (float)scale {
    float scale = [[UIScreen mainScreen] scale];
    if (scale == 1) {
        NSLog(@"---> 普通屏幕1");
    }else if (scale == 2) {
        NSLog(@"---> 视网膜屏幕2");
    }else if (scale == 3) {
        NSLog(@"---> 高视网膜屏幕3");
    }else{
        NSLog(@"unknow screen mode !");
    }
    return scale;
}


// 判断是否是模拟器
+ (BOOL)isSimulator {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *model = [NSString stringWithUTF8String:machine];
    free(machine);
    return [model isEqualToString:@"x86_64"] || [model isEqualToString:@"i386"];
}



#define IS_IOS_Version floorf([[UIDevice currentDevice].systemVersion floatValue])
#define IS_IOS_5    (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 5.0 ? 1:0)
#define IS_IOS_6    (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 6.0 ? 1:0)
#define IS_IOS_7    (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 7.0 ? 1:0)
#define IS_IOS_8    (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 8.0 ? 1:0)
#define IS_IOS_9    (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 9.0 ? 1:0)
#define IS_IOS_10   (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 10.0 ? 1:0)
#define IS_IOS_11   (floorf([[UIDevice currentDevice].systemVersion floatValue]) == 11.0 ? 1:0)
//系统版本
+ (NSString *)systemVersion {
    
    float systemVersion = floorf([[UIDevice currentDevice].systemVersion floatValue]);
    NSString *version = [NSString stringWithFormat:@"%.1f",systemVersion];
    
//    if (systemVersion < 6.0) {                                      return @"IOS_5";
//        
//    }else if ((systemVersion >= 6.0 ) && (systemVersion < 7.0)){    return @"IOS_6";
//        
//    }else if ((systemVersion >= 7.0 ) && (systemVersion < 8.0)){    return @"IOS_7";
//        
//    }else if ((systemVersion >= 8.0 ) && (systemVersion < 9.0)){    return @"IOS_8";
//        
//    }else if ((systemVersion >= 9.0 ) && (systemVersion < 10.0)){   return @"IOS_9";
//        
//    }else if ((systemVersion >= 10.0 ) && (systemVersion < 11.0)){  return @"IOS_10";
//        
//    }else {
//        return @"IOS_11";
//    }
    return version;
}


//获取当前系统UUID：刷机或重装系统后uuid还是会改变
+ (NSString *)getUUID
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString *uuid = (__bridge NSString *)((__bridge CFUUIDRef)((NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString))));
    CFRelease(puuid);
    CFRelease(uuidString);
    return uuid;
}

//1.如果以上的都不支持,使用CFUUIDRef手动创建UUID
+ (NSString *)randomUUID {
    if(NSClassFromString(@"NSUUID")) { // only available in iOS >= 6.0
        return [[NSUUID UUID] UUIDString];
    }
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef cfuuid = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [((__bridge NSString *) cfuuid) copy];
    CFRelease(cfuuid);
    return uuid;
}
//2.最后,添加到Keychain
+ (void)setValue:(NSString *)value forKey:(NSString *)key inService:(NSString *)service {
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAlways;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecValueData] = [value dataUsingEncoding:NSUTF8StringEncoding];
    SecItemAdd((__bridge CFDictionaryRef)keychainItem, NULL);
}



@end

//NSString *const USERNAME = @"user_name";

