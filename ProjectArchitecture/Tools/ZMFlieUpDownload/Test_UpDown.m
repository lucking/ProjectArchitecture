//
//  Test_UpDown.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/24.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_UpDown.h"
#import "ZMDownloadManager.h"

@implementation Test_UpDown

- (void)doSomthing {
    NSString *_url = @"url";
    // 视频下载
    [[ZMDownloadManager sharedInstance] zm_downloadURL:_url progress:^(NSInteger receivedSize, NSInteger expectedSize, CGFloat progress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"progress = %f",progress);
            if (progress ==1.0) {
                NSLog(@"---> getFile = %@",[[ZMDownloadManager sharedInstance] getFile:_url]);
            }
        });
    } state:^(DownloadState state) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"state = %u",state);
        });
    }];
}

@end
