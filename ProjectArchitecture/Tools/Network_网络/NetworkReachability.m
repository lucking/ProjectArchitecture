//
//  NetworkReachability.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/26.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NetworkReachability.h"
#import "AFNetworking.h"

#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

@implementation NetworkReachability


// 监听网络状态_AFNetworking
+ (int)isReachableViaWiFi {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    if (manager.isReachableViaWiFi) {		// 在使用Wifi, 下载原图
        return 2;
    }else if (manager.isReachableViaWWAN) { // 3G花钱
        return 1;
    }else {
        // 其他，下载小图
        return 0;
    }
}


/**
 判断网络状态
 @return YES：网络可用  NO：网络不可用
 */
+ (BOOL)netWorkReachabilityStatus {
    
    __block BOOL netState = NO;
    //创建网络状态监测管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //开始监听
    [manager startMonitoring];
    //监听状态的改变
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                
            case  AFNetworkReachabilityStatusUnknown:   //未知状态
                netState = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable: //没有网络
                netState = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: //3G|4G
                netState = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: //WiFi
                netState = YES;
                break;
            default:
                break;
        }
    }];
    NSLog(@"--->netState = %d",netState);
    return netState;
}


// 查看网络状态是否给力
+ (BOOL)isConnectionAvailable
{
    // 创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flagsn");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}



// 监测URL网络的可链接性
+ (BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    //NetworkAvailable
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN: // WWAN
            case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:	  // NotReachable
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    [manager.reachabilityManager startMonitoring];
    return netState;
}


@end
