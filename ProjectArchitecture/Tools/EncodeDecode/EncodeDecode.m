//
//  EncodeDecode.m
//  ZM_EncodeDecode
//
//  Created by ZM on 16/3/23.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "EncodeDecode.h"
#import "CommonCrypto/CommonDigest.h" // md5加密：使用

@implementation EncodeDecode


/**
 *  字符串md5加密
 *
 *  @return 字符串md5加密后的字符串
 */
+ (NSString *)md5:(NSString *) inPutText
{
	const char *cStr = [inPutText UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];

	CC_MD5(cStr, (CC_LONG)strlen(cStr), result);

	return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			 result[0], result[1], result[2], result[3],
			 result[4], result[5], result[6], result[7],
			 result[8], result[9], result[10], result[11],
			 result[12], result[13], result[14], result[15]
			 ] lowercaseString];
}





@end
