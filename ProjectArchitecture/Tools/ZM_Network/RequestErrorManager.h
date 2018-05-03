//
//  RequestErrorManager.h
//  Architecture
//
//  Created by ZM on 2016/11/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestErrorManager : NSObject
{
    
}
+ (RequestErrorManager *)singleton;

/**
 *  处理_请求错误
 */
+ (void)errorDealWithLocalError:(NSError *)error;
/**
 *  没有网络：创建网络错误处理类型
 */
+ (NSError *)createLocalError;

//
+ (BOOL)dealErrorOfData:(id)data;

//+ (BOOL)dealErrorOfData:(id)data dataDic:(NSDictionary*)dataDic;



@end
