//
//  ZMDES.h
//  ZMArchitecture
//
//  Created by ZM on 16/9/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMDES : NSObject

/**
 *  DES加密算法： CBC模式
 */
+ (NSString *)zm_encryptDESwithText:(NSString *)sText;//加密
+ (NSString *)zm_decryptDESwithText:(NSString *)sText;//解密

/**
 *  DES 原始方法
 *  DES加密算法： ECB模式
 */
//加密
+(NSString *)zm_encryptUseDES:(NSString *)clearText key:(NSString *)key;
//解密
+(NSString*)zm_decryptUseDES:(NSString*)cipherText key:(NSString*)key;




@end
