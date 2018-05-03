//
//  AFDownloadManager.h
//  ZMDownloadManager
//
//  Created by ZM on 16/5/19.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFDownloadHeader.h"

typedef NSURLSessionDownloadTask ZMURLSessionTask;
//typedef void(^DownloadProgressBlock)(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead);
//typedef void(^DownloadSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
//typedef void(^DownloadFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);


@interface AFDownloadManager : NSObject
{
    
}
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

+ (AFDownloadManager *)ShareDownloadManager;


// 下载文件
- (void)downFileOfUrlStr:(NSString *)urlStr fileName:(NSString *)fileName;

// 获取 文件路径
- (NSString *)getfilePathOfName:(NSString *)fileName;
// 获取临时 文件路径
//- (NSString *)getTemfilePathOfName:(NSString *)fileName;


// 文件路径_URL
- (NSURL *)filePathURLOfFileName:(NSString *)fileName;


//延缓，推迟；暂停
- (void)suspend;

//继续；恢复
- (void)resume;



#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path;


#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path;

@end
