//
//  Test_Network.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_Network.h"
//请求数据：下拉刷新、上拉加载更多、暂时无数据
#import "NetworkManager.h"
#import "ServerURL.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIViewController+ZMAdd.h"
#import "NSObject+ZMAdd.h"
#import "NSObject+ZMAddMJRefresh.h"
#import "NetworkReachability.h"
#import "NetworkSession.h"

@interface Test_Network ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property (nonatomic, retain) NSArray* titleArray;
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, assign) int page; 
@end


@implementation Test_Network

//基本使用方法
- (void)test_Use {
    //__block NSURLSessionDataTask *dataTask = nil;
    NSString *urlStr= @"http://172.16.3.66:8080/ntool/getData.do?page=2";
    NSDictionary *param= @{@"page":@"2"};
    [NetworkManager GetURL:urlStr withParameters:param hudShow:NO success:^(id data) {
        NSLog(@"---> data = %@ \n", data);
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark ---请求：交易所列表
- (void)requestIsHeader:(BOOL)isHeader {  
    
    [self endRefreshTableView:self.ttableView isHeader:isHeader];
}
//请求数据
- (void)config_requestData {
    
    self.page = 1;
    __weak typeof(self) weakSf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSf.page = 1;
        [weakSf requestIsHeader:YES];
    }];
    [header setTitle:@"在这里掌握最新资讯" forState:MJRefreshStatePulling];
    self.ttableView.mj_header = header;
    [self.ttableView.mj_header beginRefreshing];
    self.ttableView.mj_footer.alpha = 0.0f;
    self.ttableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSf.page = weakSf.page +1;
        [weakSf requestIsHeader:NO];
    }];
//    //暂无数据，点击刷新：马上进入刷新状态
//    [self addNoDataBtnToSuperview:self.view title:@"暂无数据，点击刷新" imgName:@"" frame:NoDataButtonFrameB isAddWindow:NO];
//    self.noDataRefreshBlock = ^{
//        [weakSf.ttableView.mj_header beginRefreshing];
//    };
}


- (void)test {
    NSString *urlStr = @"http://flv2.bn.netease.com/videolib3/1604/22/iGABN3301/SD/iGABN3301-mobile.mp4";
    //urlStr = @"http://i1.douguo.net//upload/banner/0/6/a/06e051d7378040e13af03db6d93ffbfa.jpg";
    urlStr = @"http://example.com/download.zip";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
    
    
    
    downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
    }];
    
    
    [[NetworkSession sharedSessionManager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"---> progress = %f",downloadProgress.fractionCompleted);
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            //Update the progress view
        //            [progressView setProgress:downloadProgress.fractionCompleted];
        //        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"---> task: %@", task);
        NSLog(@"---> responseObject: %@", responseObject);        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"---> error_task: %@", task);
        NSLog(@"---> error: %@", error);
        // UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
    }];
    
}


@end
