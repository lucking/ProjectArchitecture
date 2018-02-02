//
//  AFNetworkingBase_VC.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMBaseViewController.h"

@interface AFNetworkingBase_VC : ZMBaseViewController

@end

/*
 iOS开发中如遇到频繁的Http请求，如何取消之前已经发送的Http请求?
 http://blog.csdn.net/deft_mkjing/article/details/51985232
 
 AFNetworking（1）网络监控                     http://blog.csdn.net/yzios/article/details/50779876
 AFNetworking(2)request创建和请求参数的序列化    http://blog.csdn.net/yzios/article/details/50781550
 AFNetworking(3)request创建《post请求》        http://blog.csdn.net/yzios/article/details/50781790
 AFNetworking(4)responseSerialization        http://blog.csdn.net/yzios/article/details/50783774
 AFNetworking(5)NSURLSessionTask创建          http://blog.csdn.net/yzios/article/details/50787160
 
 */


/**
 AFNetworkReachabilityStatusUnknown          = -1,  // 未知
 AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
 AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G花钱
 AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
 
 //NSLog(@"---> Reachability_Wifi");
 //发出网络异常通知广播
 //[[NSNotificationCenter defaultCenter] postNotificationName:@"k_NOTI_NETWORK_ERROR" object:nil];
 */
