//
//  NetworkManager.m
//  ZMSingleton
//
//  Created by ZM on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "NetworkManager.h"

#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

#import "NSString+ZMAdd.h"
#import "AFNetworking.h"
#import "NetworkSession.h"
#import "NetworkReachability.h"
#import "ServerConfig.h"
#import "ServerURL.h"
#import "HudProgress.h"
#import "NSString+ZMAdd.h"

@implementation NetworkManager

+ (NetworkManager *)singleton;
{
    static NetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark =========================="   NetworkSession   "===================================


//#pragma mark =========================="  原始请求方式  "==========================
/**
 原始请求方式
 
 @param method 请求方式：GET、POST、Opions、Put、Head、Delete、Trace、Connect
 @param URL     基本链接
 @param params  参数
 @param body    内容体
 @param success 成功返回
 @param failure 失败返回
 */
+ (NSURLSessionDataTask *)requestMethod:(NSString *)method 
                                    urL:(NSString *)URL 
                                 params:(NSDictionary *)params 
                                   body:(NSData *)body 
                                success:(void(^)(id data))success 
                                failure:(void(^)(NSError *error))failure {
    
    if (UUserDefaults.netWorkStatus) {
        
        URL = [NSString zm_removeStringEmpty:URL];
        if ([NSString zm_isChineseString:URL]) {
            URL = [NSString zm_encodeChineseToURLString:[ServerConfig getURLStringWithIP:URL params:params] ];
        }else{
            URL = [ServerConfig getURLStringWithIP:URL params:params];
        }
        NSLog(@"--->请求URL: %@",URL);
        NSLog(@"--->请求参数: %@  ",params);
        NSLog(@"--->完整的url: %@ \n ",URL);
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:method URLString:URL parameters:nil error:nil];
        // 设置_超时时间、value、body
        request.timeoutInterval= 60;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:body];
        // 设置_数据接收格式
        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                     @"text/html",
                                                     @"text/json",
                                                     @"text/javascript",
                                                     @"text/plain",nil];
        manager.responseSerializer = responseSerializer;
        
        __weak __typeof(self)weakSelf = self;        
        __block NSURLSessionDataTask *dataTask = nil;        
        dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                success(responseObject);
            } else {
                [weakSelf errorDealWithLocalError:error];
                failure(error);
            }
        }];
        //[dataTask resume];
        return dataTask;
    }else{
        failure(nil);
        //网络错误提示
        [self showWithoutNetwork];
        return nil;
    }
}

//#pragma mark =========================="  封装请求方式  "==========================

#pragma mark ----------------------"  需要完整URL  "------------------------------
#pragma  Get请求方式：需要完整URL
+ (NSURLSessionDataTask *)GetURL:(NSString *)URL withParameters:(NSDictionary *)params
                         hudShow:(BOOL)hudShow
                         success:(SuccessHandler)success
                         failure:(FailureHandler)failure
{
    URL = [NSString zm_removeStringEmpty:URL];
    NSLog(@"--->请求url: %@",URL);
    NSLog(@"--->请求参数: %@ \n ",params);
    //判断网络状况（有链接：执行请求；无链接：弹出提示） //isReachableViaWiFi、isConnectionAvailable
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __weak __typeof(self)weakSelf = self;
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            //progress
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //请求成功返回数据
            if (responseObject){
                [HHudProgress hudHiddenForWindow];
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf errorDealWithLocalError:error];
            failure(error);
        }];
        return dataTask;
    }else{
        //网络错误提示
        [self showWithoutNetwork];
        return nil;
    }
}
#pragma mark POST请求方式：需要完整URL
+ (NSURLSessionDataTask *)PostURL:(NSString *)URL withParameters:(NSDictionary *)params
                          hudShow:(BOOL)hudShow
                          success:(SuccessHandler)success
                          failure:(FailureHandler)failure
{
    URL = [NSString zm_removeStringEmpty:URL];
    NSLog(@"--->请求url: %@",URL);
    NSLog(@"--->请求参数: %@",params);
    NSLog(@"--->完整的url: %@ \n ",[ServerConfig getURLStringWithIP:URL params:params]);
    
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __weak __typeof(self)weakSelf = self;
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [[NetworkSession sharedSessionManager] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf hudHidden];
            if (responseObject){
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
            [weakSelf errorDealWithLocalError:error];
            failure(error);
        }];
        return dataTask;
    }else{
        failure([self createLocalError]);
        [self showWithoutNetwork];
        return nil;
    }
}

#pragma mark ----------------------"  API固定 需要拼接URL  "------------------------------
#pragma Get请求：API固定 需要拼接URL
+ (NSURLSessionDataTask *)requestGetURL:(NSString *)URL withParameters:(NSDictionary *)params
                                hudShow:(BOOL)hudShow
                                success:(SuccessHandler)success
                                failure:(FailureHandler)failure
{
//    URL = [API_URL stringByAppendingFormat:@"%@",URL];
//    URL = [NSString removeStringEmpty:URL];
    NSString *serverAddress = [ServerConfig getServerIP];
    URL = [serverAddress stringByAppendingString:URL];
    URL = [NSString zm_removeStringEmpty:URL];

    NSLog(@"--->请求url: %@",URL);
    NSLog(@"--->请求参数: %@ \n ",params);
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __weak __typeof(self)weakSelf = self;
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            //progress
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf hudHidden];
            if (responseObject){
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf errorDealWithLocalError:error];
            failure(error);
        }];
        return dataTask;
    }else{
        [self showWithoutNetwork];
        return nil;
    }
}

#pragma mark POST请求：API固定 需要拼接URL
+ (NSURLSessionDataTask *)requestPostURL:(NSString *)URL withParameters:(NSDictionary *)params
              hudShow:(BOOL)hudShow
              success:(SuccessHandler)success
              failure:(FailureHandler)failure
{
    URL = [AIPURL_Development stringByAppendingFormat:@"%@",URL];
    URL = [NSString zm_removeStringEmpty:URL];
    NSLog(@"--->请求url: %@",URL);
    NSLog(@"--->请求参数: %@ \n ",params);
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __weak __typeof(self)weakSelf = self;
        __block NSURLSessionDataTask *dataTask = nil;
       dataTask = [[NetworkSession sharedSessionManager] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf hudHidden];
            if (responseObject){
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
            [weakSelf errorDealWithLocalError:error];
            failure(error);
        }];
        return dataTask;
    }else{
        failure([self createLocalError]);
        [self showWithoutNetwork];
        return nil;
    }
}

#pragma mark ======================="   数据请求：线程处理法   "=================================
#pragma
+ (NSURLSessionDataTask *)requestThreadPOST:(NSString *)URL
                                     params:(NSDictionary *)params
                                    hudShow:(BOOL)hudShow
                                     Target:(id)_target
                                     select:(SEL)selectName
                                    failure:(void (^)(NSError * error))failure
{
    URL = [AIPURL_Development stringByAppendingFormat:@"%@",URL];
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __weak __typeof(self)weakSelf = self;
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf hudHidden];
            //返回调用处数据
            if ([_target respondsToSelector:selectName]) {
                // 5秒钟后启动线程
                // [_target performSelector:selectName withObject:responseObject afterDelay:5];
                [_target performSelectorOnMainThread:selectName withObject:responseObject waitUntilDone:YES];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
            [weakSelf errorDealWithLocalError:error];
        }];
        return dataTask;
    }else{
        [self showWithoutNetwork];
        return nil;
    }
}

#pragma mark =========================="   文件上传   "===================================
/**
 *  文件上传 POST
 */
+ (NSURLSessionDataTask *)upLoadPOST:(NSDictionary *)params
                            fileData:(NSData *)data
                            fileName:(NSString *)fileName
                             withURL:(NSString *)URL
                             hudShow:(BOOL)hudShow success:(SuccessHandler)success failure:(FailureHandler)failure
{
    __weak __typeof(self)weakSelf = self;
    URL = [AIPURL_Development stringByAppendingFormat:@"%@",URL];
    NSDictionary* JSON_Params = [ServerConfig JsonParameters:params];
    
    if ([NetworkReachability isReachableViaWiFi]) {
        if (hudShow) {
            [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
        }
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [[NetworkSession sharedSessionManager] POST:URL parameters:JSON_Params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            // 在这个block中设置需要上传的文件
            //方式一
            [formData appendPartWithFileData:data name:@"file" fileName:@"testImg" mimeType:@"image/png"];
            //方式二：本地文件图片
            //NSData *data = [NSData dataWithContentsOfFile:@"/Users/zm/Desktop/loadImage/hainanBank@2x.png"];
            //NSLog(@"----- data = %@ \n ", data);
            //[formData appendPartWithFileURL:[NSURL fileURLWithPath:@"/Users/zm/Desktop/loadImage/hainanBank@2x.png"] name:@"file" fileName:@"xxx.png" mimeType:@"image/png" error:nil];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"-----> uploadProgress = %@ ", uploadProgress);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //NSLog(@"-----> responseObject = %@ \n \n ", responseObject);
            [weakSelf hudHidden];
            if (responseObject){
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        return dataTask;
    }else{
        failure(nil);
        [self showWithoutNetwork];
        return nil;
    }
}

/**
 * 删除网络请求任务
 */
- (void)cancelAllNetWork {
    
    [[NetworkSession sharedSessionManager].operationQueue cancelAllOperations];
    
    // 查看网络任务的状态
    [[NetworkManager singleton].taskArray enumerateObjectsUsingBlock:^(NSURLSessionDataTask *taskObj, NSUInteger idx, BOOL *stop) {
        NSLog(@"删除网络任务前_状态是= %ld",taskObj.state);
        [taskObj cancel]; //当发送取消任务失败:块将被调用
        NSLog(@"删除网络任务后_状态是= %ld",taskObj.state);
    }];
}

/**
 *  处理_请求错误
 */
+ (void)errorDealWithLocalError:(NSError *)error {

	NSString* localError = [error localizedDescription];
    NSLog(@"---> error = %@ ", [error description]);
	NSLog(@"---> error Code = %ld",[error code]);
    NSLog(@"---> localError = %@ \n ",localError);

	if ([localError isEqualToString:LocalError_timedOut]) {
        [HHudProgress hudShowErrorMsg:@"请求超时，服务链接中断 \n 程序员哥哥正在抢救中" afterDelay:Hud_ErrorTime addSubview:nil];

    }else if ([localError isEqualToString:LocalError_notConnect]){
        [HHudProgress hudShowErrorMsg:@"无法连接到服务器" afterDelay:Hud_ErrorTime addSubview:nil];

	}else if ([localError isEqualToString:LocalError_notRead]){
        [HHudProgress hudShowErrorMsg:@"数据无法读取,因为它不在正确的格式" afterDelay:Hud_ErrorTime addSubview:nil];
        
    }else if ([localError isEqualToString:LocalError_cancelRequest]){
        [HHudProgress hudShowErrorMsg:@"取消请求" afterDelay:Hud_ErrorTime addSubview:nil];

    }else{
        [HHudProgress hudShowErrorMsg:[error localizedDescription] afterDelay:Hud_ErrorTime addSubview:nil];
	}
    
    //[HHudProgress hudShowLoadingMsg:@"请稍候..."];
}

/**
 *  没有网络：创建网络错误处理类型
 */
+ (NSError *)createLocalError {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:@"withoutNetwork",
                               NSUnderlyingErrorKey		:@"error"};
    NSError *error = [NSError errorWithDomain:@"domain" code:1001 userInfo:userInfo];
    return error;
}
//弹出网络错误提示框
+ (void)showWithoutNetwork{
    [HHudProgress hudShowErrorMsg:@"网络异常，请检查网络连接" afterDelay:Hud_ErrorTime addSubview:nil];
}
+ (void)hudHidden {
    [HHudProgress hudHidden];
}



@end
