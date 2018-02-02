//
//  UpDownHeader.h
//  HSDownloadManagerExample
//
//  Created by tangdi on 16/5/8.
//  Copyright © 2016年 hans. All rights reserved.
//

#ifndef UpDownHeader_h
#define UpDownHeader_h


// 缓存主目录
#define ZMCachesDirectory [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"ZMCache"]

// 保存文件名
#define ZMFileName(url) [url substringFromIndex:(url.length-10)] //使用URL后10位作为文件名


// 文件的存放路径（caches）
#define ZMFileFullpath(url) [ZMCachesDirectory stringByAppendingPathComponent:ZMFileName(url)]


// 文件的已下载长度
#define DownloadLength(url) [[[NSFileManager defaultManager] attributesOfItemAtPath:ZMFileFullpath(url) error:nil][NSFileSize] integerValue]


// 存储文件总长度的文件路径（caches）
#define TotalLengthFullpath [ZMCachesDirectory stringByAppendingPathComponent:@"totalLength.plist"]






#endif /* UpDownHeader_h */
