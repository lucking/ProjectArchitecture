//
//  NetworkReachability.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/26.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkReachability : NSObject
{
    
}
// 看看网络是不是给力
+ (BOOL)isConnectionAvailable;

// 监听网络状态_AFNetworking：处理图片、视频下载使用
+ (int)isReachableViaWiFi;

// app监听使用
+ (BOOL)netWorkReachabilityStatus;


// 监测URL网络的可链接性
+ (BOOL)netWorkReachabilityWithURLString:(NSString *)strUrl;


/**
 AFNetworkReachabilityStatusUnknown          = -1,  // 未知
 AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
 AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G花钱
 AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
*/
//发出网络异常通知广播
//[[NSNotificationCenter defaultCenter] postNotificationName:@"k_NOTI_NETWORK_ERROR" object:nil];



@end
