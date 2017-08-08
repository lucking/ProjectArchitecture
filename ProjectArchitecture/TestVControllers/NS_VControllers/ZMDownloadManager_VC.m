//
//  ZMDownloadManager_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMDownloadManager_VC.h"
#import "ZMDownloadManager.h"

@interface ZMDownloadManager_VC ()

@end

@implementation ZMDownloadManager_VC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);
    
    
    // http://c.3g.163.com/nc/video/list/%@/y/0-10.html
    // http://c.3g.163.com/nc/video/list/%@/y/%ld-10.html
    
    
}

- (void)aaaaa {
    
    // 视频下载
    [[ZMDownloadManager sharedInstance] download:@"url" progress:^(NSInteger receivedSize, NSInteger expectedSize, CGFloat progress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //NNSLog(@"progress = %f",progress);
            if (progress ==1.0) {
                NNSLog(@"---> getFile = %@",[[ZMDownloadManager sharedInstance] getFile:@"url"]);
            }
        });
    } state:^(DownloadState state) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NNSLog(@"state = %u",state);
        });
    }];
    
}

@end
