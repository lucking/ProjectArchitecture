//
//  ServerConfig.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/15.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConfig : NSObject


/* 配置环境参数 value
 * 00: 测试环境 development
 * 01: 生产环境 distribution
 */
+ (void)configServer:(NSString *)value;

// 返回环境参数 00: 测试环境 01: 生产环境
+ (NSString *)getServerConfig;

// 获取服务器地址
+ (NSString *)getServerIP;



#pragma mark //==========================="   getURl 验证签名：密钥加密  "================================
// 字典不排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url params:(NSDictionary *)params;
// 字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params;
// 验证签名：密钥加密
+ (NSString *)getSign:(NSDictionary *)params;
// 转变为json数据格式：params 传参
+ (NSDictionary *)JsonParameters:(NSDictionary *)params;


@end
