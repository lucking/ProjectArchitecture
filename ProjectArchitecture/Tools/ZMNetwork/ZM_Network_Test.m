//
//  ZM_Network_Test.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_Network_Test.h"

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

/*
 * GitHub地址：https://github.com/AFNetworking/AFNetworking
 */
@implementation ZM_Network_Test

/*
 * Creating a Download Task：创建一个下载任务
 */
- (void)Creating_a_Download_Task {
    
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

/*
 * Creating an Upload Task：创建一个上传的任务
 */
- (void)Creating_an_Upload_Task {
    
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
    [uploadTask resume];
}

/* Creating an Upload Task for a Multi-Part Request, with Progress
 * 为多部分请求创建上传任务，并添加进度
 */
- (void)Creating_an_Upload_Task_for_a_MultiPart_Request_with_Progress {
    
    UIProgressView *progressView = [UIProgressView new];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        // This is not called back on the main queue.
        // You are responsible for dispatching to the main queue for UI updates
        dispatch_async(dispatch_get_main_queue(), ^{
            //Update the progress view
            [progressView setProgress:uploadProgress.fractionCompleted];
        });
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}

/*
 * Creating a Data Task：创建一个数据的任务
 */

- (void)Creating_a_Data_Task {
    
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



#pragma mark ----------------------"  原始请求方式  "------------------------------
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
        // 设置_超时时间、value、body   //设置_body //设置_value
        request.timeoutInterval= 60;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:body];
        
        //------------------------- start ---------------------------
        /*
         * 
         name：    上传到服务器，接受这个图片的字段名
         fileName：这个文件在服务器的名字。
         mimeType：表示要上传的文件的类型。  mimeType的格式—— 大类/小类   
         
         <Type>     <mimeType>         <fileName>
         JPG        image/jpg           xx.jpg
         PNG        image/png           xx.png
         JSON       application/json    xx.json
         PDF        application/pdf     xx.pdf
         video      video/quicktime     xx.video
         string     text/plain          xx.txt      
         
         [formData appendPartWithFileData:data2 name:@"lqbarimg" fileName:@"text_plain" mimeType:@"text/plain"];
         [formData appendPartWithFileData:data name:<#name#> fileName:<#fileName#> mimeType:<#mimeType#>];
         */
        
        NSMutableDictionary *mutableHeaders = [NSMutableDictionary dictionary];
        
        [mutableHeaders setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"", @"字段名"] 
                          forKey:@"Content-Disposition"];

        [mutableHeaders setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"; filename=\"%@\"", @"字段名", @"文件名"] 
                          forKey:@"Content-Disposition"];
        
        [mutableHeaders setValue:@"image/jpg" forKey:@"Content-Type"];
        //------------------------- end ---------------------------  
        
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
        //[self showWithoutNetwork];
        return nil;
    }
}

@end
