//
//  CityBannerWebVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CityBannerWebVController.h"
#import "ZMIntegrationWebView.h"
#import "NSString+ZMAdd.h"
#import "Masonry.h"

@interface CityBannerWebVController ()<ZMIntegrationWebViewDelegate>
/**
 *  viewModel */
@property (strong, nonatomic, readonly) ZMWebViewModel *viewModel;
/**
 *  webview */
@property (strong, nonatomic) ZMIntegrationWebView *webView;
@end



@implementation CityBannerWebVController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    //标题
//    self.title = @"CityBannerWebVC";
    self.navigationItem.title = @"热门活动现场";
    
}
- (void)bindViewModel
{
    [super bindViewModel];
    NSLog(@"---> requestURL= %@",self.viewModel.requestURL);
    [self.webView loadURLString:self.viewModel.requestURL];
    // 开始加载
    @weakify(self);
    [[self
      rac_signalForSelector:@selector(ZM_WebViewDidStartLoad:)
      fromProtocol:@protocol(ZMIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                
//                dispatch_main_async_safe(^{
//                    [HTShowMessageView showStatusWithMessage:@"Loading..."];
//                });
            }
        }];
    // 加载完成
    [[self
      rac_signalForSelector:@selector(ZM_WebView:didFinishLoadingURL:)
      fromProtocol:@protocol(ZMIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                
//                dispatch_main_async_safe(^{
//                    [HTShowMessageView dismissSuccessView:@"Success"];
//                    if (self.viewModel.webType == kWebFindDetailType) {
//                        
//                        NSString *jsMethod = @"document.getElementById(\"download\").remove();document.querySelector(\"header.has-banner\").style.marginTop = 0;";
//                        [self.webView ZM_stringByEvaluatingJavaScriptFromString:jsMethod];
//                    }
//                    
//                });
            }
        }];
    // 加载失败
    [[self
      rac_signalForSelector:@selector(ZM_WebView:didFailToLoadURL:error:)
      fromProtocol:@protocol(ZMIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                
//                dispatch_main_async_safe(^{
//                    [HTShowMessageView dismissErrorView:@"Error"];
//                });
            }
        }];
    
    // 标题
    if ([self.viewModel.title isNotBlank]) {
        RAC(self.navigationItem,title) = RACObserve(self.viewModel, title);
    }else{
        [[self
          rac_signalForSelector:@selector(ZM_WebView:title:)
          fromProtocol:@protocol(ZMIntegrationWebViewDelegate)]
         subscribeNext:^(RACTuple *tuple) {
//             @strongify(self)
             
//             dispatch_main_async_safe(^{
//                 self.navigationItem.title = tuple.second;
//             });
         }];
    }
    
    self.webView.delegate = self;
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
}
- (void)updateViewConstraints
{
    [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (self.viewModel.navBarStyleType == kNavBarStyleHidden) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.view).offset(-64);
        }
    }];
    
    [super updateViewConstraints];
}
#pragma mark - getter
- (ZMIntegrationWebView *)webView
{
    return ZM_LAZY(_webView, ({
        ZMIntegrationWebView *view = [ZMIntegrationWebView new];
        [self.view addSubview:view];
        view;
    }));
}


@end
