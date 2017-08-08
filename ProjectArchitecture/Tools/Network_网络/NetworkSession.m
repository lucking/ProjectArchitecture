//
//  NetworkSession.m
//  ZM_BaseViewController
//
//  Created by ZM on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "NetworkSession.h"
#import "AFNetworkActivityIndicatorManager.h"

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


// 判断网络类型
+ (NetworkStates)getNetworkStates
{
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    // 保存网络状态
    NetworkStates states = NetworkStatesNone;
    for (id child in subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏码
            int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            NSLog(@"-----> networkType = %d", networkType);
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



