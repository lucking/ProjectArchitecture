//
//  NetworkSession.h
//  ZM_BaseViewController
//
//  Created by ZM on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger, NetworkStates) {
    NetworkStatesNone   =0, // 没有网络
    NetworkStates2G     =1, // 2G
    NetworkStates3G     =2, // 3G
    NetworkStates4G     =3, // 4G
    NetworkStatesWIFI   =5  // WiFi
};



@interface NetworkSession : AFHTTPSessionManager
{
    
}
@property (nonatomic, assign) BOOL openHttpsSSL; //是否开启 Https请求

/**
 *  AFNetworking 3.0以上
 */
+ (instancetype)sharedSessionManager ;


//请求管理的配置：默认
+ (NetworkSession *)sessionManager;


//请求管理的配置：设置请求头
+ (NetworkSession *)sessionHeaderManager;

// 判断网络类型
//+ (NetworkStates)getNetworkStates;

@end
