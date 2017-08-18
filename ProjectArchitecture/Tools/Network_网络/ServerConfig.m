//
//  ServerConfig.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/15.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ServerConfig.h"
#import "ServerURL.h"
#import "EncodeDecode.h"

/* 环境参数 
 * 00: 测试环境 development
 * 01: 生产环境 distribution
 */
static NSString *ServerEnvironment;
// 加密密钥
#define  Sign_Key  @"JFLL2016"


@implementation ServerConfig

//配置服务环境
+(void)configServer:(NSString *)value
{
    ServerEnvironment = value;
}

+(NSString *)getServerConfig
{
    return ServerEnvironment;
}

//获取服务器地址
+ (NSString *)getServerIP {
    
    if ([ServerEnvironment isEqualToString:@"00"]) {        // 测试环境
        return AIPURL_Development;
        
    }else if ([ServerEnvironment isEqualToString:@"01"]){   // 生产环境
        return AIPURL_Distribution;
        
    }else if ([ServerEnvironment isEqualToString:@"02"]){   // 服务器：折扣宜家
        return YiJia_APIURL;
        
    }else if ([ServerEnvironment isEqualToString:@"03"]){   // 服务器：网易新闻
        return WangYi_APIURL;
        
    }else{
        return @"";
    }
}



#pragma mark ======================"  getURl  "==============================
//字典不排序_拼接url
+ (NSString *)getURLStringWithIP:(NSString *)url params:(NSDictionary *)params {
    
    if (params !=nil) {
        NSArray *keysArray = [params allKeys]; //获取所有的键（allKeys）存到数组
        NSString *keyValue = @"", *urlStr = @"";
        for (int i=0; i<keysArray.count; i++) {
            
            keyValue = [NSString stringWithFormat:@"%@=%@",keysArray[i],params[keysArray[i]]];
            urlStr = [NSString stringWithFormat:@"%@&%@",urlStr,keyValue];
        }
        NSMutableString* mutStr = [[NSMutableString alloc] initWithString:urlStr];
        [mutStr deleteCharactersInRange:NSMakeRange(0,1)];//删除字符串：(开始位置，删除个数)
        mutStr = [NSMutableString stringWithFormat:@"%@?%@",url,mutStr];
        //NSLog(@"---> mutStr: %@ \n ",mutStr);
        return mutStr;
    }else {
        return url;
    }
}
// 字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params {
    
    if (params ==nil) {
        return @"";
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            //allKeys排列顺序：由于NSDictionary 的allKeys返回的是无序数组，这里我们要给它们排序
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)];
        tempStr = [NSMutableString stringWithFormat:@"%@?%@",url,tempStr];
        return tempStr;
    }
}
// 验证签名：密钥加密
+ (NSString *)getSign:(NSDictionary *)params {
    
    if (params ==nil) {
        return @"";
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)];
        NSString* params_key = [NSString stringWithFormat:@"%@%@",tempStr,Sign_Key];
        //NSLog(@"---> params_key: %@ \n ",params_key);
        NSString* sign_md5 = [EncodeDecode md5:params_key];
        //NSLog(@"---> sign_md5: %@",sign_md5);
        return sign_md5;
    }
}
/**
 *  转变为json数据格式：params 传参
 *
 *  @return 请求的json数据格式参数
 */
+ (NSDictionary *)JsonParameters:(NSDictionary *)params {
    
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc] initWithDictionary:params];
    [parameters setObject:[ServerConfig getSign:params] forKey:@"sign"];
    return parameters;
}



@end
