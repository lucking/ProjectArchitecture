//
//  ZMSessionModel.h
//  ZMDownloadManager
//
//  Created by ZM on 16/5/20.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DownloadStateStart = 0,     /** 下载中 */
    DownloadStateSuspended = 1,     /** 下载暂停 */
    DownloadStateCompleted = 2,     /** 下载完成 */
    DownloadStateFailed    = 3      /** 下载失败 */
}DownloadState;


@interface ZMSessionModel : NSObject

/** 流 */
@property (nonatomic, strong) NSOutputStream *stream;

/** 下载地址 */
@property (nonatomic, copy) NSString *url;

/** 获得服务器这次请求 返回数据的总长度 */
@property (nonatomic, assign) NSInteger totalLength;

/** 下载进度 */
@property (nonatomic, copy) void(^progressBlock)(NSInteger receivedSize, NSInteger expectedSize, CGFloat progress);

/** 下载状态 */
@property (nonatomic, copy) void(^stateBlock)(DownloadState state);

@end
