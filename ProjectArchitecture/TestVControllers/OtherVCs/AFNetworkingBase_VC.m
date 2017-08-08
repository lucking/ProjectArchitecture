//
//  AFNetworkingBase_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AFNetworkingBase_VC.h"
#import "NetworkSession.h"
#import "ServerURL.h"

//xml的地址
#define kXMLUrlString   @"http://wiapi.hexun.com/news/getlist4.0.php?pid=100234721&pc=20&pn=1&st=0"
//json
static NSString *URL_Str1 = @"http://TaoBeiService.soonku.me/ProudctWebService.asmx/GetHomePageAdContentList";
static NSString *URL_Str2 = @"http://zhekou.yijia.com/lws/view/ichuanyi/suit_list_data_get.php";

@interface AFNetworkingBase_VC ()

@end

@implementation AFNetworkingBase_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    
    
    
}

/*
 * 基本使用方法
 */
- (void)test_Use {
    
    __block NSURLSessionDataTask *dataTask = nil;
    NSString *urlStr= @"http://TaoBeiService.soonku.me/ProudctWebService.asmx/GetHomePageAdContentList";
    NSDictionary *param= @{@"key1":@"value1",
                           @"key2":@"value2"};
    dataTask = [NetworkManager requestGetURL:urlStr withParameters:param hudShow:YES success:^(id data) {
        
        NSLog(@"---> data = %@ \n \n", data);
    } failure:^(NSError *error) {
    }];
    //需求：取消请求任务
    [dataTask cancel];
}

/**
 * AFNetworking 3.0设置请求头
 * sessionHeaderManager
 */
- (void)sessionHeader {
    NSDictionary *params= @{@"key1":@"value1",
                            @"key2":@"value2"
                            };
    [[NetworkSession sessionHeaderManager] POST:URL_Str1 parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"Success_responseObject: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

+ (void)xmlGetRequest
{
    
}


#pragma mark ======================"  AFNetworking 基础讲解  "==============================

- (void)BaseExplaine {
    
    [AFHTTPRequestSerializer serializer];
    /*
     AFNetworking源码大致分为以下几个部分：
     网络监控：AFNetworkReachabilityManager
     网络安全策略：AFSecurityPolicy
     请求数据序列化：AFHTTPRequestSerializer
     响应数据序列化：AFHTTPResponseSerializer
     网络请求管理：AFURLSessionManager（AFHTTPSessionManager继承于AFURLSessionManager）
     本部分主要介绍请求数据序列化同时包含request的创建（AFURLRequestSerialization）
     */
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /** 可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    /** 请求队列的最大并发数
     */
    manager.operationQueue.maxConcurrentOperationCount = 5;
    /** 请求超时的时间
     */
    manager.requestSerializer.timeoutInterval = 5;
}


#pragma mark ======================"  AFNetworking 的使用  "==============================

//例一：创建一个下载任务（Creating a Download Task）
- (void)case1 {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

//例二：创建一个上传的任务（Creating an Upload Task）
- (void)case2 {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    
    [uploadTask suspend];   //暂停任务
    [uploadTask resume];    //恢复任务（开始任务）
    [uploadTask cancel];    //取消任务
    
}


//例三：创建一个多部分请求上传任务,有进度条
- (void)case3 {
    
    __block UIProgressView *progressView = [[UIProgressView alloc] init];
    
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"]
                                   name:@"file"
                               fileName:@"filename.jpg"
                               mimeType:@"image/jpeg" error:nil];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        //这不是在主队列上调用。
        //您有责任将调度到主队列进行UI更新
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新进度条
            [progressView setProgress:uploadProgress.fractionCompleted];
        });
    }
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                          if (error) {
                                              NSLog(@"Error: %@", error);
                                          } else {
                                              NSLog(@"%@ %@", response, responseObject);
                                          }
                                      }];
    
    [uploadTask resume];
}
//例四：创建数据任务
- (void)case4 {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

//例五：请求序列化 （Request Serialization）
- (void)case5 {
    NSString *URLString = @"http://example.com";
    NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
    
    //1、查询字符串参数编码
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    
    //2、URL形式参数编码
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
    
    //3、JSON编码参数
    [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
    
    /*
     1、GET http://example.com?foo=bar&baz[]=1&baz[]=2&baz[]=3
     
     2、POST http://example.com/
     Content-Type: application/x-www-form-urlencoded
     foo=bar&baz[]=1&baz[]=2&baz[]=3
     
     3、POST http://example.com/
     Content-Type: application/json
     {"foo": "bar", "baz": [1,2,3]}
     */
    
}
//例六：网络可用性
- (void)case6 {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        NSLog(@"--> Reachability_status: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}
//例七：安全策略
- (void)case7 {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES; // 不建议用于生产环境
}
//例八：NetworkActivity
- (void)case8 {
    
    //监听网络状态: 让菊花一直转，直到网络请求结束, 请求数据的时候就调用,请求结束再关闭
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //这个是请求模拟5秒之后再关闭
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    });
    
}
//例九：
- (void)case9 {
    
}


/***********************  数据请求：线程处理，使用方法   ***********************
 */
- (void)howToUse {
    //拼接参数
    NSDictionary *parameter= @{@"k1":@"mid",
                               @"k2":@"sessionId"};
    //调用接口
    [NetworkManager requestThreadPOST:Register params:parameter hudShow:YES Target:self select:@selector(registerAccount:) failure:^(NSError *error) {
    }];
}
// 注册返回数据
-(void)registerAccount:(id)object{
    NSDictionary* registDic = [[NSDictionary alloc]initWithDictionary:(NSDictionary *)object];
    
    NSString *retFlag= [registDic objectForKey:@"retFlag"];
    NSLog(@"retFlag = %@",retFlag);
}



@end
