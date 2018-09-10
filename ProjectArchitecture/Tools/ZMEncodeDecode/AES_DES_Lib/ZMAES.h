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
+ (NSString *)zm_encryptAESwithText:(NSString *)sText;
// 解密
+ (NSString *)zm_decryptAESwithText:(NSString *)sText;



/**
 *  AES 原始方法 ZMAES
 *  AES加密算法： ECB模式
 */
//加密
+(NSString *)zm_encryptUseAESText:(NSString *)myText;
//解密
+(NSString*)zm_decryptUseDESText:(NSString*)myText;

@end
