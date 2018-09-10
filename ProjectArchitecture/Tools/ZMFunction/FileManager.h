//
//  FileManager.h
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
{
	// 创建文件夹
	NSString *_imageFilesPath;
	// 创建文件
	NSString *_imageFilePath1;
	NSString *_imageFilePath2;
}

// 注意：以下是创建文件

//获取程序的根目录 Documents路径
#define HomeDirectoryPath	NSHomeDirectory()

//1: Document
#define Document_pathArray  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
#define DocumentPath		[Document_pathArray objectAtIndex:0]

//2: Libray
#define Library_pathArray	NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)
#define LibraryPath			[Library_pathArray objectAtIndex:0]

//3: Libaray/Caches
#define Cache_pathArray		NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)
#define CachePath			[Cache_pathArray objectAtIndex:0]

//4: Libaray/Preferences
#define Preferen_pathArray	NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES)
#define PreferenPath		[Preferen_pathArray objectAtIndex:0]

//5: Temporary
#define TempPath			NSTemporaryDirectory()

#define ImagePath(_path)	 [NSHomeDirectory() stringByAppendingPathComponent:_path]	   //拼接文件路径
#define ImageTempPath(_path) [NSTemporaryDirectory() stringByAppendingPathComponent:_path] //拼接文件路径


// 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory;

// 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory;

// 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory;

// 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory;

// 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory;


#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path;

#pragma mark  读取文件
- (NSData *)getFileWithPath:(NSString *)path;

#pragma mark  移动文件
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath;

#pragma mark  复制文件
- (BOOL)copyFileAtPath:(NSString *)atPath toPath:(NSString *)toPath;

#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path;

// 将文件写入指定路径
+ (void) writeData:(id)data filePath:(NSString *)filePath fileName:(NSString *)fileName;

#pragma mark - 保存数组到plist文件
+ (void)creatPlistFileWithArr:(NSArray *)array fileName:(NSString *)fileName;



@end

/**
 *  
 （1）Documents：苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
 （2）Library：存储程序的默认设置或其它状态信息；
    里面又包含两个文件夹Caches和Preference；
    Caches，存放缓存文件，iTunes不会备份此目录
 
 （3）tmp：提供一个即时创建临时文件的地方
 
 */

