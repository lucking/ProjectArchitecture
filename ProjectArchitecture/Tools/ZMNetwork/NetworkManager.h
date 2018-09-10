//
//  NetworkManager.h
//  ZMSingleton
//
//  Created by ZM on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessHandler)(id data);
typedef void (^FailureHandler)(NSError * error);
typedef void (^SuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask *task, NSError * error);
/**
 *  所有的接口返回值均为NSURLSessionTask
 */
typedef NSURLSessionTask HTURLSessionTask;


@interface NetworkManager : NSObject
{

}
@property (nonatomic, strong) NSMutableArray *taskArray;
//实例化
//Singleton_Instance_method_Interface(NetworkManager)
+ (NetworkManager *)singleton;


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
                                failure:(void(^)(NSError *error))failure; 


//#pragma mark =========================="  封装请求方式  "==========================
/**
 Get请求方式：需要完整URL
 @param URL 请求地址
 @param params 请求参数
 @param hudShow 是否用菊花
 @param success 成功回调
 @param failure 失败回调
 @return 返回请求任务
 */
#pragma mark ----------------------"  需要完整URL，带参数  "------------------------------
#pragma mark Get请求方式：需要完整URL
+ (NSURLSessionDataTask *)GetURL:(NSString *)URL withParameters:(NSDictionary *)params
                         hudShow:(BOOL)hudShow
                         success:(SuccessHandler)success
                         failure:(FailureHandler)failure;

#pragma mark POST请求方式：需要完整URL
+ (NSURLSessionDataTask *)PostURL:(NSString *)URL withParameters:(NSDictionary *)params
                          hudShow:(BOOL)hudShow
                          success:(SuccessHandler)success
                          failure:(FailureHandler)failure;

#pragma mark ----------------------"  API固定 需要拼接URL，带参数  "------------------------------
#pragma mark Get请求
+ (NSURLSessionDataTask *)requestGetURL:(NSString *)URL withParameters:(NSDictionary *)params
                                hudShow:(BOOL)hudShow
                                success:(SuccessHandler)success
                                failure:(FailureHandler)failure;

#pragma mark Post请求
+(NSURLSessionDataTask *)requestPostURL:(NSString *)URL withParameters:(NSDictionary *)params
                                hudShow:(BOOL)hudShow
                                success:(SuccessHandler)success
                                failure:(FailureHandler)failure;


#pragma mark -----------------------"  线程处理法  "---------------------------------
#pragma
+ (NSURLSessionDataTask *)requestThreadPOST:(NSString *)URL params:(NSDictionary *)params
                                    hudShow:(BOOL)hudShow
                                     Target:(id)_target
                                     select:(SEL)selectName
                                    failure:(FailureHandler)failure;

#pragma mark -----------------------"  文件上传  "---------------------------------
#pragma
// 文件上传 POST
+ (NSURLSessionDataTask *)upLoadPOST:(NSDictionary *)params
                            fileData:(NSData *)data
                            fileName:(NSString *)fileName
                             withURL:(NSString *)URL
                             hudShow:(BOOL)hudShow
                             success:(SuccessHandler)success
                             failure:(FailureHandler)failure;

/**
 *  处理_请求错误
 */
+ (void)errorDealWithLocalError:(NSError *)error;

// 弹出网络错误提示框
+ (void)showWithoutNetwork;



@end


