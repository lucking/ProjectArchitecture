//
//  ZM_WebTest.h
//  ZM_Web
//
//  Created by ZM on 2018/1/26.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZM_WebTest : NSObject

#pragma mark -- 加载应该开始
+ (void)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType tagString:(NSString *)tagString;

#pragma mark -- 加载开始
+ (void)webViewDidStartLoad:(UIWebView*)webView tagString:(NSString *)tagString;

#pragma mark -- 加载完成
+ (void)webViewDidFinishLoad:(UIWebView*)webView tagString:(NSString *)tagString;

#pragma mark -- 加载失败
+ (void)webView:(UIWebView*)webView DidFailLoadWithError:(NSError*)error tagString:(NSString *)tagString;


@end
