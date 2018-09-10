//
//  NetworkSession.m
//  ZM_BaseViewController
//
//  Created by ZM on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "NetworkSession.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "APPInfoManager.h"
#import "DeviceInfo.h"
#import "NSObject+ZMAdd.h"

@implementation NetworkSession


/**
 *  AFNetworking 3.0以上  
 *  为了安全，以下URL 因该加密处理，暂时不做处理
 */
+ (instancetype)sharedSessionManager
{
	static NetworkSession* manager;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{

		manager = [NetworkSession manager];
		[manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        //申明返回的结果的类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                             @"text/json",
                                                             @"text/javascript",
                                                             @"text/html",
                                                             @"text/plain",
                                                             @"text/xml",
                                                             @"image/*", nil];
        //设置超时时间为10s
		manager.requestSerializer.timeoutInterval = 30.f;
        // 队列
        manager.operationQueue.maxConcurrentOperationCount = 3;
        // 开启转圈圈
        //[AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        //加上这行代码，https ssl 验证。
//        if(manager.openHttpsSSL) {
//            [manager setSecurityPolicy:[self customSecurityPolicy]];
//        }
    });
	return manager;
}

#pragma mark 请求管理的配置
+ (NetworkSession *)sessionManager {
    
    NetworkSession *manager = [NetworkSession manager];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    //申明返回的结果的数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",@"text/xml", nil];
    //设置超时时间为30s
    manager.requestSerializer.timeoutInterval = 30.f;

    return manager;
}

#pragma mark 请求管理的配置：设置请求头
+ (NetworkSession *)sessionHeaderManager {
    
    NetworkSession *manager = [NetworkSession manager];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"text/plain",
                                                         @"text/xml", nil];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.operationQueue.maxConcurrentOperationCount = 5;
    //设置相关的请求头，通过requestSerializer来实现，可以根据自己的需求定义一个或者多个请求头
    [manager.requestSerializer setValue:@"value" forHTTPHeaderField:@"key"];
    [manager.requestSerializer setValue:@"arrObjc2" forHTTPHeaderField:@"arrKey2"];
    return manager;
}

#pragma mark 取消所有任务
- (void)cancelAllOperations:(NetworkSession *)manager {
    [manager.operationQueue cancelAllOperations];
}

+ (void)getSignalStrength {
    //您可以使用以下信号获得信号强度：
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


@end
