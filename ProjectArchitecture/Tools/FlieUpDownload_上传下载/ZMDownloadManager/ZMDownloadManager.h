//
//  ZMDownloadManager.h
//  ZMDownloadManager
//
//  Created by ZM on 16/5/20.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMSessionModel.h"
#import "UpDownHeader.h"

@interface ZMDownloadManager : NSObject
{
    
}
/** 保存所有任务(注：可以用下载地址md5后作为key) */
@property (nonatomic, strong) NSMutableDictionary *tasks;



/**
 *  单例：@return 返回单例对象
 */
+ (instancetype)sharedInstance;

/**
 *  开启任务下载资源
 *
 *  @param url           下载地址
 *  @param progressBlock 回调下载进度
 *  @param stateBlock    下载状态
 */
- (void)download:(NSString *)url progress:(void(^)(NSInteger receivedSize, NSInteger expectedSize, CGFloat progress))progressBlock state:(void(^)(DownloadState state))stateBlock;



/**
 *  查询该资源的下载进度值： @return 返回下载进度值
 */
- (CGFloat)progress:(NSString *)url;            //url 下载地址

/**
 *  获取该资源总大小
 */
- (NSInteger)fileTotalLength:(NSString *)url;

/**
 *  获取该资源
 */
- (NSString *)getFile:(NSString *)url;

/**
 *  判断该资源是否下载完成：@return YES: 完成
 */
- (BOOL)isCompletion:(NSString *)url;

/**
 *  删除该资源
 */
- (void)deleteFile:(NSString *)url;

/**
 *  清空所有下载资源
 */
- (void)deleteAllFile;



//开始\暂停 轮循
- (void)handle:(NSString *)url;     //url 下载地址
/**
 *  开始下载
 */
- (void)start:(NSString *)url;
/**
 *  暂停下载
 */
- (void)pause:(NSString *)url;


@end
