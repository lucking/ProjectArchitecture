//
//  NSData+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZMAdd)
+ (void)nowTest;

#pragma mark ----------------"  1. NSData 与 NSString  字符串与数据 "---------------------------------
//  NSString－>NSData
+ (NSData *)zm_stringToData:(NSString *)myString;
//  NSData－> NSString
+ (NSString *)zm_dataToString:(NSData *)myData;


#pragma mark ----------------"  2. Base64_Str 与 NSString  Base64字符串与字符串 "---------------------
// 将字符串转换成 base64编码
- (NSString*)zm_base64EncodedString: (NSString*)string;
// 将base64编码转换成 字符串
- (NSString *)zm_base64DecodeToString:(NSString *)string;


#pragma mark ----------------"  3. NSData 与 UIImage  图片与数据 "---------------------------------
//  UIImage－> NSData
+ (NSData *)zm_imageToData:(UIImage *)myImage;
//  NSData－>UIImage
+ (UIImage *)zm_dataToImage:(NSData *)myData;


#pragma mark-----------------"  4.NSData 与 NSDictionary 字典与数据 "---------------------------------
// 序列化（KeyedArchiver）、反序列化（KeyedUnarchiver）
// 利用KAC：NSDictionary -> NSData
+ (NSData *)zm_dictionaryToData:(NSDictionary *)myDic;
// 利用KNC：NSData -> NSDictionary
+ (NSDictionary *)zm_dataToDictionary:(NSData *)myData;

// 利用JSON：data -> NSDictionary
+ (NSDictionary *)zm_dictionaryWithContentsOfData:(NSData *)myData;


#pragma mark-----------------"  5.数据：压缩、解压 "---------------------------------
//数据压缩
- (NSData *)zm_gzipDeflate:(NSData*)data;
//数据解压
- (NSData *)zm_gzipInflate:(NSData*)data;



@end
