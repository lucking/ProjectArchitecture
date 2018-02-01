//
//  ZMIntegrationWebView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@class ZMIntegrationWebView;

@protocol ZMIntegrationWebViewDelegate <NSObject>

@optional
/**
 *  webview内容的标题
 */
- (void)ZM_WebView:(ZMIntegrationWebView *)webview title:(NSString *)title;
/**
 *  webview监听
 */
- (void)ZM_WebView:(ZMIntegrationWebView *)webview shouldStartLoadWithURL:(NSURL *)URL;
/**
 *  webview开始加载
 */
- (void)ZM_WebViewDidStartLoad:(ZMIntegrationWebView *)webview;
/**
 *  webview加载完成
 */
- (void)ZM_WebView:(ZMIntegrationWebView *)webview didFinishLoadingURL:(NSURL *)URL;
/**
 *  webview加载失败
 */
- (void)ZM_WebView:(ZMIntegrationWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error;
@end


/********** 将webView与WKWebView集成 ***********/

@interface ZMIntegrationWebView : UIView<WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate>

#pragma mark - Public Properties
#pragma mark 
/**
 *  ZMIntegrationWebView代理
 */
@property (nonatomic, weak) id <ZMIntegrationWebViewDelegate> delegate;
/**
 *  加载时导航栏底部的进度条
 */
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
/**
 *  是否可以返回上级页面
 */
@property (nonatomic, readonly) BOOL canGoBack;
/**
 *  是否可以进入下级页面
 */
@property (nonatomic, readonly) BOOL canGoForward;

#pragma mark - Initializers view
/**
 *  初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame;

#pragma mark - Public Interface
/**
 *  返回上一级页面
 */
- (void)goBack;
/**
 *  进入下一级页面
 */
- (void)goForward;
/**
 *  加载一个webview: @param request 请求的NSURLURLRequest
 */
- (void)loadRequest:(NSURLRequest *)request;
/**
 *  加载一个webview: @param URL 请求的URL
 */
- (void)loadURL:(NSURL *)URL;
/**
 *  加载一个webview: 请求的URLString
 */
- (void)loadURLString:(NSString *)URLString;
/**
 *  加载本地网页: @param HTMLString 请求的地址
 */
- (void)loadHTMLString:(NSString *)HTMLString;
/**
 *  加载本地js方法: @param jsString js字符串
 */
- (void)ZM_stringByEvaluatingJavaScriptFromString:(NSString *)jsString;


@end

