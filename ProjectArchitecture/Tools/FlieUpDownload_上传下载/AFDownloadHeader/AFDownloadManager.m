//
//  AFDownloadManager.m
//  ZMDownloadManager
//
//  Created by ZM on 16/5/19.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "AFDownloadManager.h"

@implementation AFDownloadManager



+ (AFDownloadManager *)ShareDownloadManager
{
    static AFDownloadManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

// 下载文件
- (void)downFileOfUrlStr:(NSString *)urlStr fileName:(NSString *)fileName {
    
    NSLog(@"-----> _filePath: %@ \n ",[self getfilePathOfName:fileName]);
    
    //文件是否存在
    if (![self isExistFilePath:[self getfilePathOfName:fileName]]) {
        
        //文件不存在：下载
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        
        _downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            
            NSLog(@"---> progress = %f \n ",downloadProgress.fractionCompleted);
            //NSLog(@"---> progress: %@", downloadProgress);
            
            if (downloadProgress.fractionCompleted == 1.0000000) {
                NSLog(@"---> finished_download");
            }
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            
            // NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            // return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];//建议使用文件原名
            
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            
            return [documentsDirectoryURL URLByAppendingPathComponent:fileName];
            //return [self filePathURLOfFileName:fileName];//创建文件路径
            
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            NSLog(@"File downloaded to: %@", filePath);
        }];
        
        [_downloadTask resume];
    }
    
}
//延缓，推迟；暂停
- (void)suspend {
    
    //NSLog(@"---> suspend \n \n ");
    [[AFDownloadManager ShareDownloadManager].downloadTask suspend];
}
//继续；恢复
- (void)resume {
    [[AFDownloadManager ShareDownloadManager].downloadTask resume];
}

// 获取 文件路径
- (NSString *)getfilePathOfName:(NSString *)fileName {
    
    return [NSString stringWithFormat:@"%@/%@",DocumentPath,fileName];
}

// 文件路径_URL
- (NSURL *)filePathURLOfFileName:(NSString *)fileName {
    
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
    return [documentsDirectoryURL URLByAppendingPathComponent:fileName];
}


#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path{
    //管理文件
    NSFileManager *fileManager= [NSFileManager defaultManager];
    
    BOOL isExist= [fileManager fileExistsAtPath:Path];
    if (isExist){	NSLog(@"文件已经存在");
        return YES;
    }else{			NSLog(@"文件不存在");
        return NO;
    }
}

#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path{
    
    NSFileManager *fileManager= [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:Path]) {//如果文件存在，则删除文件
        [fileManager removeItemAtPath:Path error:nil];
    }
    if (![fileManager fileExistsAtPath:Path]){
        NSLog(@"Path：文件已删除");
    }else{
        NSLog(@"Path：文件未删除");
    }
}


@end
