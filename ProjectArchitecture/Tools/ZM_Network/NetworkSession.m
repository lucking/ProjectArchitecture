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
    //申明返回的结果的数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"text/plain",
                                                         @"text/xml", nil];
    //设置超时时间为30s
    manager.requestSerializer.timeoutInterval = 30.f;
    // 队列
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


// 判断网络类型
+ (NetworkStates)getNetworkStates
{
//    [self getSignalStrength];

    UIApplication *application= [UIApplication sharedApplication];
    id subviews;
    if (IS_IPHONEX) {
        NSLog(@"---[DeviceInfo ISIPHONEXX]= IS_IPHONE8X");
        if ([[application valueForKeyPath:@"_statusBar"] isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")]) {

            subviews = [[[[application valueForKeyPath:@"_statusBar"] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
        } else {
            subviews = [[[application valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
        }
    }else{
         subviews = [[[application valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    }

    NSLog(@"-----状态栏_[_statusBar propertyNameList] = %@", [[application valueForKeyPath:@"_statusBar"] propertyNameList]);
    NSLog(@"-----状态栏_[_statusBar ivarDic] = %@ \n \n ", [[application valueForKeyPath:@"_statusBar"] ivarDic]);
//    NSLog(@"-----状态栏_[subviews propertyNameList] = %@ \n \n ", [subviews propertyNameList]);
//    NSLog(@"-----状态栏_[subviews ivarDic] = %@ \n \n ", [subviews ivarDic]);

//    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    // 保存网络状态 children
    NetworkStates states = NetworkStatesNone;
    for (id child in subviews) {
        NSLog(@"-----> 状态栏_child = %@ \n ", child);
        //NSLog(@"-----> 状态栏_[child ivarDic] = %@ \n ", [child ivarDic]);
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarSignalStrengthItemView")]) {
            //获取到状态栏码
            int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            NSLog(@"-----> 网络状态码_networkType = %d \n ", networkType);
            NSLog(@"-----> 网络状态_[child propertyNameList] = %@ \n ", [child propertyNameList]);
            NSLog(@"-----> 网络状态_[child methodNameList] = %@ \n ", [child methodNameList]);
            NSLog(@"-----> 网络状态_[child ivarNameList] = %@ \n ", [child ivarNameList]);

//             for (id subviews in child)
//             {
//                 NSLog(@"-----> 状态栏_subviews = %@ \n ", subviews);
//             }
            switch (networkType) {
                case 0: states = NetworkStatesNone; //无网模式
                    break;
                case 1: states = NetworkStates2G;
                    break;
                case 2: states = NetworkStates3G;
                    break;
                case 3: states = NetworkStates4G;
                    break;
                case 5:{states = NetworkStatesWIFI;
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return states;
}


/*

//1.服务信号
-----> 状态栏_child = <UIStatusBarServiceItemView: 0x7fa26070c0e0; frame = (6 0; 37 20); userInteractionEnabled = NO; layer = <CALayer: 0x60000042b980>> [Item = <UIStatusBarItem: 0x60000042bc80> [UIStatusBarServiceItemView (Left)]]
//2.网络
 -----> 状态栏_child = <UIStatusBarDataNetworkItemView: 0x7fa260610dc0; frame = (48 0; 15 20); userInteractionEnabled = NO; layer = <CALayer: 0x604000220340>> [Item = <UIStatusBarItem: 0x604000220320> [UIStatusBarDataNetworkItemView (Left)]]
 -----> 网络状态码_networkType = 5
 -----> 网络状态_[child propertyNameList] = (
 )
 -----> 网络状态_[child methodNameList] = (
 touchesEnded:withEvent:,
 extraRightPadding,
 contentsImage,
 updateForNewData:actions:,
 accessibilityHUDRepresentation,
 extraLeftPadding,
 maximumOverlap,
 _stringForRSSI,
 _dataNetworkImage,
 _dataNetworkImageName
 )
 -----> 网络状态_[child ivarNameList] = (
 _dataNetworkType,
 _wifiStrengthRaw,
 _wifiStrengthBars,
 _wifiLinkWarning,
 _enableRSSI,
 _showRSSI
 )
 -----状态栏_[_statusBar ivarDic] = {
 @"UILabel" = _doubleHeightLabel
 B = _timeHidden
 @"<UIStatusBarStateProvider>" = _inProcessProvider
 @"NSString" = _currentDoubleHeightText
 {?="itemIsEnabled"[35B]"timeString"[64c]"shortTimeString"[64c]"gsmSignalStrengthRaw"i"gsmSignalStrengthBars"i"serviceString"[100c]"serviceCrossfadeString"[100c]"serviceImages"[2[100c]]"operatorDirectory"[1024c]"serviceContentType"I"wifiSignalStrengthRaw"i"wifiSignalStrengthBars"i"dataNetworkType"I"batteryCapacity"i"batteryState"I"batteryDetailString"[150c]"bluetoothBatteryCapacity"i"thermalColor"i"thermalSunlightMode"b1"slowActivity"b1"syncActivity"b1"activityDisplayId"[256c]"bluetoothConnected"b1"displayRawGSMSignal"b1"displayRawWifiSignal"b1"locationIconType"b1"quietModeInactive"b1"tetheringConnectionCount"I"batterySaverModeActive"b1"deviceIsRTL"b1"lock"b1"breadcrumbTitle"[256c]"breadcrumbSecondaryTitle"[256c]"personName"[100c]"electronicTollCollectionAvailable"b1"wifiLinkWarning"b1"wifiSearching"b1"backgroundActivityDispl




 //3.电池
 -----> 状态栏_child = <UIStatusBarBatteryItemView: 0x7fa2606116d0; frame = (343 0; 27 20); userInteractionEnabled = NO; layer = <CALayer: 0x6040002206c0>> [Item = <UIStatusBarItem: 0x6040002204e0> [UIStatusBarBatteryItemView (Right)]]
//4.时间
 -----> 状态栏_child = <UIStatusBarTimeItemView: 0x7fa26050ea40; frame = (161 0; 56 20); userInteractionEnabled = NO; layer = <CALayer: 0x604000220980>> [Item = <UIStatusBarItem: 0x60000042b900> [UIStatusBarTimeItemView (Center)]]





 */

//其中的cerPath就是app bundle中证书路径，certificate为证书名称的宏，仅支持cer格式，securityPolicy的相关配置尤为重要，请仔细阅读customSecurityPolicy方法，并根据实际情况设置其属性。

// 这样，就能够在AFNetWorking的基础上使用HTTPS协议访问特定服务器，但是不能信任根证书的CA文件，因此这种方式存在风险，读取pinnedCertificates中的证书数组的时候有可能失败，如果证书不符合，certData就会为nil。

#define certificate @""

//+ (AFSecurityPolicy*)customSecurityPolicy {
//    
//    // 先导入证书
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
//    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
//    
//    // AFSSLPinningModeCertificate 使用证书验证模式
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    
//    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    // 如果是需要验证自建证书，需要设置为YES
//    securityPolicy.allowInvalidCertificates = YES;
//    
//    //validatesDomainName 是否需要验证域名，默认为YES；
//    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
//    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
//    //如置为NO，建议自己添加对应域名的校验逻辑。
//    securityPolicy.validatesDomainName = NO;
//
//    securityPolicy.pinnedCertificates = @[certData];
//    
//    return securityPolicy;
//}


//AFNetworking首先需要配置AFSecurityPolicy类，AFSecurityPolicy类封装了证书校验的过程。

//+ (AFSecurityPolicy*)securityPolicy:(AFHTTPSessionManager *)_manager {
//
//    /**
//     AFSecurityPolicy分三种验证模式：
//     AFSSLPinningModeNone:          只是验证证书是否在信任列表中
//     AFSSLPinningModeCertificate：   该模式会验证证书是否在信任列表中，然后再对比服务端证书和客户端证书是否一致
//     AFSSLPinningModePublicKey：     只验证服务端证书与客户端证书的公钥是否一致
//     */
//    
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    securityPolicy.allowInvalidCertificates = YES;//是否允许使用自签名证书
//    securityPolicy.validatesDomainName = NO;//是否需要验证域名，默认YES
//    
////    AFHTTPSessionManager *_manager = [AFHTTPSessionManager manager];
//    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    _manager.securityPolicy = securityPolicy;
//    //设置超时
//    [_manager.requestSerializer willChangeValueForKey:@"timeoutinterval"];
//    _manager.requestSerializer.timeoutInterval = 20.f;
//    [_manager.requestSerializer didChangeValueForKey:@"timeoutinterval"];
//    _manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
//    _manager.responseSerializer.acceptableContentTypes  = [NSSet setWithObjects:@"application/xml",@"text/xml",@"text/plain",@"application/json",nil];
//    
//    
////    __weak typeof(self) weakSelf = self;
//    [_manager setSessionDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession *session, NSURLAuthenticationChallenge *challenge, NSURLCredential *__autoreleasing *_credential) {
//        
//        SecTrustRef serverTrust = [[challenge protectionSpace] serverTrust];
//        /**
//         *  导入多张CA证书
//         */
//        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"ca" ofType:@"cer"];//自签名证书
//        NSData* caCert = [NSData dataWithContentsOfFile:cerPath];
//        NSArray *cerArray = @[caCert];
//        
//        //weakSelf.manager.securityPolicy.pinnedCertificates = cerArray;
//        [NetworkSession  sharedSessionManager].securityPolicy.pinnedCertificates = cerArray;
//
//        
//        SecCertificateRef caRef = SecCertificateCreateWithData(NULL, (__bridge CFDataRef)caCert);
//        NSCAssert(caRef != nil, @"caRef is nil");
//        
//        NSArray *caArray = @[(__bridge id)(caRef)];
//        NSCAssert(caArray != nil, @"caArray is nil");
//        
//        OSStatus status = SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)caArray);
//        SecTrustSetAnchorCertificatesOnly(serverTrust,NO);
//        NSCAssert(errSecSuccess == status, @"SecTrustSetAnchorCertificates failed");
//        
//        NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//        __autoreleasing NSURLCredential *credential = nil;
//        if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//           
//            if ([[NetworkSession  sharedSessionManager].securityPolicy evaluateServerTrust:challenge.protectionSpace.serverTrust forDomain:challenge.protectionSpace.host]) {
//                
//                credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//                if (credential) {
//                    disposition = NSURLSessionAuthChallengeUseCredential;
//                } else {
//                    disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//                }
//            } else {
//                disposition = NSURLSessionAuthChallengeCancelAuthenticationChallenge;
//            }
//        } else {
//            disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//        }
//        
//        return disposition;
//    }];
//    
//    return securityPolicy;
//
//}



@end



