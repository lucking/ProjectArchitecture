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
    }
    return @"IS_IPHONExx未知";
}
//判断手机型号_2
+ (int)currentDeviceStyle
{
    
    float Height = [UIScreen mainScreen].bounds.size.height;
    float Width = [UIScreen mainScreen].bounds.size.width;
    //    NSLog(@"Height=%f __ Width=%f", Height, Width);
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
