//
//  ZMAES.h
//  ZMArchitecture
//
//  Created by ZM on 16/9/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMAES : NSObject

/**
 *  AES加密算法： CBC模式
 */
// 加密
+ (NSString *)encryptAESwithText:(NSString *)sText;
// 解密
+ (NSString *)decryptAESwithText:(NSString *)sText;



/**
 *  AES 原始方法 ZMAES
 *  AES加密算法： ECB模式
 */
//加密
+(NSString *)encryptUseAESText:(NSString *)myText;
//解密
+(NSString*)decryptUseDESText:(NSString*)myText;

@end
