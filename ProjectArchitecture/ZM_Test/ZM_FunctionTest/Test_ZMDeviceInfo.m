//
//  Test_ZMDeviceInfo.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_ZMDeviceInfo.h"
#import "DeviceInfo.h"
#import "APPInfoManager.h"

@implementation Test_ZMDeviceInfo

- (void)test_ZMDeviceInfo {
    
//    // 设备信息管理 APPDeviceInfo
//    NSLog(@"---> randomUUID_1= %@ ",[DeviceInfo randomUUID]);
//    NSLog(@"---> randomUUID_2= %@ ",[DeviceInfo randomUUID]);
//    NSLog(@"---> currentDeviceStyle = %d ",[DeviceInfo currentDeviceStyle]);
//    NSLog(@"---> UUID = %@ ",[DeviceInfo getUUID]);
//    // 判断系统版本
//    NSLog(@"---> systemVersion= %@ ",[DeviceInfo systemVersion]);
//    // 判断手机型号：IPHONE尺寸
//    NSLog(@"---> ISIPHONEXX= %@ ",[DeviceInfo ISIPHONEXX]);
//    // 判断系统版本
//    if([[UIDevice currentDevice].systemVersion floatValue]<=10.0) {
//        
//    }
//    NSLog(@"---> appVersion= %@ ",[[APPInfoManager singleton] appVersion]);
//
//    //判断是否为：iPhone  同：([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
//    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)) {
//        NSLog(@"---is iPhone ");
//        
//    }else if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
//        NSLog(@"---is iPad ");
//    }
    
    //将“UIStatusBarSignalStrengthItemView”替换为“UIStatusBarDataNetworkItemView”和“signalStrengthRaw”与“wifiStrengthBars”。不幸的是“wifiStrengthRaw”总是返回0.
    //看起来很棒 - 但是，这会算作使用私有API，因此被拒绝吗？
    //是的，它将被拒绝，因为它使用私有变量。
}



@end
