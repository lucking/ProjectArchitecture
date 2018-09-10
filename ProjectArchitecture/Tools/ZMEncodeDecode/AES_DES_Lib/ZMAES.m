//
//  ZMAES.m
//  ZMArchitecture
//
//  Created by ZM on 16/9/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMAES.h"

#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"

#import "GTMBase64.h"

/**
 *  设置：密钥、初始值
 */
#define AES_CBC_PASS_KEY	@"VZD8PWEDXZ9Z9XVNAPCN9ZU4ZABFCHP5"
#define AES_CBC_PASS_IV		@"001RG1HNDFIBB4GR"


#define AES_ECB_PASS_KEY	@"1111111111111111"  // 1111 1111 1111 1111
#define AES_ECB_PASS_IV		@""

/** 以下和后台统一就行
 *  $encrypt_key = 'VZD8PWEDXZ9Z9XVNAPCN9ZU4ZABFCHP5';
	$iv = '001RG1HNDFIBB4GR';
	AES  256 cbc模式
	abcd  对应的加密后的值是 XderyAL/TzQCqiBbfZV3rw==
 
 加密算法：
 kCCAlgorithmAES128 (kCCAlgorithmAES也一样）；
 iv： 设置为nil就可以了。因为ECB方式不需要初始化向量。如果不是采用ECB，那么除了密钥之外，加解密放的初始化向量也必须一致。
 */

@implementation ZMAES

// 加密
+ (NSString *)zm_encryptAESwithText:(NSString *)sText
{
    NSData* keyData = [AES_CBC_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
    NSData* messageData = [sText dataUsingEncoding:NSUTF8StringEncoding];
    
    id dataKey = [keyData SHA256Hash];
    NSData *encryptedData = [messageData AES256EncryptedDataUsingKey:dataKey iV:AES_CBC_PASS_IV error:nil];
    //NSLog(@"encryptedData = %@ \n \n \n ",encryptedData);
    NSString *base64EncodStr = [NSString zm_base64StringFromData:encryptedData length:[encryptedData length]];
    return base64EncodStr;
}
// 解密
+ (NSString *)zm_decryptAESwithText:(NSString *)sText {
    
    NSData *encryptedData = [NSData zm_base64DataFromString:sText];
    NSData* keyData = [AES_CBC_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
    id dataKey = [keyData SHA256Hash];
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:dataKey iV:AES_CBC_PASS_IV error:nil];
    
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}

/**
 *  AES加密算法： ECB模式
 */
//加密
+(NSString *)zm_encryptUseAESText:(NSString *)myText
{
    NSData *data= [myText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [AES_ECB_PASS_KEY UTF8String],
                                          kCCKeySizeAES128,
                                          nil,              //iv：初始变量
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        NSLog(@"DES加密失败");
    }
    return plainText;
}
//解密
+(NSString*)zm_decryptUseDESText:(NSString*)myText
{
    // 利用 GTMBase64 解碼 Base64 字串
    NSData* cipherData = [GTMBase64 decodeString:myText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    // IV 偏移量不需使用
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [AES_ECB_PASS_KEY UTF8String],
                                          kCCKeySizeAES128,
                                          nil,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    }
    return plainText;
}


@end
