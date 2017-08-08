//
//  ZMCache.h
//  Architecture
//
//  Created by ZM on 16/9/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMCache : NSObject


// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;

// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;

// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;

// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;




//计算单个文件大小
+ (CGFloat)fileSizeAtPath:(NSString *)filePath;

//获取对应文件的：缓存大小
+ (CGFloat)folderSizeAtPath:(NSString *)folderPath;


// 获取缓存文件大小：遍历文件夹获得文件夹大小，返回多少M
+ (void)getCachefileSizeTarget:(id)_target select:(SEL)selectName;


@end
