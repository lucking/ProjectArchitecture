//
//  ZMDES.m
//  ZMArchitecture
//
//  Created by ZM on 16/9/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMDES.h"

#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"
#import "GTMBase64.h"


/**
 *  设置：密钥、初始值
 */
#define DES_PASS_KEY	@"des"
#define DES_PASS_IV		@"12345678"


@implementation ZMDES

//加密
+ (NSString *)zm_encryptDESwithText:(NSString *)sText
{
    NSData* keyData = [DES_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
    NSData* messageData = [sText dataUsingEncoding:NSUTF8StringEncoding];
    
    id dataKey = [keyData SHA256Hash];
    NSData *encryptedData = [messageData DESEncryptedDataUsingKey:dataKey iV:DES_PASS_IV error:nil];
    NSString *base64EncodStr = [NSString zm_base64StringFromData:encryptedData length:[encryptedData length]];
    
    return base64EncodStr;
}

//解密
+ (NSString *)zm_decryptDESwithText:(NSString *)sText
{
    NSData *encryptedData = [NSData zm_base64DataFromString:sText];
    
    NSData* keyData = [DES_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
    id dataKey = [keyData SHA256Hash];
    NSData *decryptedData = [encryptedData decryptedDESDataUsingKey:dataKey iV:DES_PASS_IV error:nil];
    
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}


//加密
+(NSString *)zm_encryptUseDES:(NSString *)clearText key:(NSString *)key
{
    NSData *data= [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
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
+(NSString*)zm_decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    // 利用 GTMBase64 解碼 Base64 字串
    NSData* cipherData = [GTMBase64 decodeString:cipherText];

    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    // IV 偏移量不需使用
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
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
