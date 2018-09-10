//
//  ZM_WebTest.m
//  ZM_Web
//
//  Created by ZM on 2018/1/26.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_WebTest.h"
#import <WebKit/WebKit.h>
#import "ZM_WebConst.h"

#define StrABC(aa,bb,cc) [NSString stringWithFormat:@"%@：%@= %@",aa,bb,cc]

@interface ZM_WebTest()<UIWebViewDelegate, WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) WKNavigation *wkNavigation;
@property (nonatomic, strong) UIWebView *wwebView;
@end

@implementation ZM_WebTest

- (void)test {
        
    /*
     * UIWebView
     */
    //改变颜色
    //    NSString *colorjs = @"document.getElementsByTagName('body')[0].style.background='#F6F7F3'";
    //    [_webView stringByEvaluatingJavaScriptFromString:colorjs];
    //    //改变字体大小
    //    //NSString *fontsize = [[NSString alloc] initWithFormat:@"document.body.style.fontSize=%d",16];
    //    NSString *fontsize = @"document.getElementsByTagName('body')[0].style.font-size='15px'";
    //    [_webView stringByEvaluatingJavaScriptFromString:fontsize];
    
    /*
     * WKWebview
     */
    NSString *colorjs = @"document.getElementsByTagName('body')[0].style.background='#F6F7F3'";
    [_wkWebView evaluateJavaScript:colorjs completionHandler:^(id object, NSError * _Nullable error) {
        NSLog(@"error:%@",error);
    }];
    
}

#pragma mark - /************************  UIWebViewDelegate Test  **************************/
#pragma
//navigationType：当网页视图被指示载入内容而得到通知。应当返回YES，这样会进行加载。通过导航类型参数可以得到请求发起的原因
//此方法可以获取网页上的数据
#pragma mark -- 加载应该开始
+ (void)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType tagString:(NSString *)tagString
{
    NSLog(@"---------  UIWebView：shouldStartLoadWithRequest ---------");
    NSURL *url = request.URL;
    NSString *command =  [NSString stringWithFormat:@"%@%@", url.host, url.path];
    NSString *query = [url.query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"-->%@：request.URL = %@",tagString, request.URL);
    NSLog(@"-->%@：request = %@",tagString, request);
    NSLog(@"-->%@：url.host = %@",tagString, url.host);
    NSLog(@"-->%@：url.path = %@",tagString, url.path);
    
    NSLog(@"-->%@：r command ＝ %@",tagString, command);
    NSLog(@"-->%@：r url.query ＝  %@",tagString, query);
    NSLog(@"-->%@：request: %@",tagString, [[request URL] absoluteString]);
    NSLog(@"-->%@：relativePath: %@  ",tagString, request.mainDocumentURL.relativePath);
    
    
    //NSLog(@"-->%@：r navigationType = %ld \n\n ",tagString, (long)navigationType);
    //返回的命令
    if ([command isEqualToString:@"return/"]) {
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
    
    NSLog(@"navigationType = %ld",(long)navigationType);
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        NSLog(@"---------- 点击连接：clicked ----------");
        NSLog(@"--> request:%@",[[request URL] absoluteString]);
        NSLog(@"--> relativePath: %@ \n ", request.mainDocumentURL.relativePath);
        
    }else if (navigationType==UIWebViewNavigationTypeFormSubmitted){
        NSLog(@"---------- 提交表单：FormSubmitted ----------");
    }else if (navigationType==UIWebViewNavigationTypeBackForward){
        NSLog(@"---------- 返回：BackForward ----------");
    }else if (navigationType==UIWebViewNavigationTypeReload){
        NSLog(@"---------- 重新加载：Reload ----------");
    }else if (navigationType==UIWebViewNavigationTypeFormResubmitted){
        NSLog(@"---------- 重新提交表单：FormResubmitte ----------");
    }else if (navigationType==UIWebViewNavigationTypeOther){
        NSLog(@"---------- 其他：Othe ----------");
    }
}
#pragma mark -- 加载开始
+ (void)webViewDidStartLoad:(UIWebView*)webView tagString:(NSString *)tagString {
    NSLog(@"---------  webViewDidStartLoad：已经开始加载 --------- ");
    
}

#pragma mark -- 加载完成
+ (void)webViewDidFinishLoad:(UIWebView*)webView tagString:(NSString *)tagString {
    NSLog(@" --------- webViewDidFinishLoad：网页加载完成 --------- ");
    
    //NSLog(@"--- %@",StrABC(tagString, @"innerHTML", [self zm_webView:webView jsString:Web_innerHTML]));
    NSLog(@"--- %@",StrABC(tagString, @"document", [self zm_webView:webView jsString:Web_document]));
    NSLog(@"--- %@",StrABC(tagString, @"documentTitle",[self zm_webView:webView jsString:Web_documentTitle]));
    NSLog(@"--- %@",StrABC(tagString, @"documentBody", [self zm_webView:webView jsString:Web_documentBody]));
    NSLog(@"--- %@",StrABC(tagString, @"Selection", [self zm_webView:webView jsString:Web_Selection]));
    NSLog(@"----------------------------------------------------------------------- \n ");
}

#pragma mark -- 加载失败
+ (void)webView:(UIWebView*)webView DidFailLoadWithError:(NSError*)error tagString:(NSString *)tagString {
    NSLog(@" ---------  UIWebView：加载错误 --------- \n");
    NSLog(@"--%@：加载失败 error＝ %@",tagString, [error localizedDescription]);
    
}

+ (NSString *)zm_webView:(UIWebView*)webView jsString:(NSString *)jsString {
    
    return [webView stringByEvaluatingJavaScriptFromString:jsString];
}



/** OC修改webView里面的html的文字大小
 http://blog.csdn.net/lausen34/article/details/54138916
 */
- (void)changeStyle{
    //border:10px solid red;
    //修改HTMLString的字体大小以及间距
    NSString *htmlString = [NSString stringWithFormat:@"<!DOCTYPE html>"   
                            "<html>"
                            "<head>"                         
                            "<style type=\"text/css\">" 
                            "body{font-size: 34px; color:red; width:100%%}"
                            "p{width:100%%}"
                            "p img{display:block;width:700px;max-width:100%%;text-align:center;}"
                            "</style>"
                            "</head>"
                            "<body>%@</body>"              
                            "</html>",@"informationContent"];
    
    
    ///!--移动端初始缩放比例为1.0。不允许用户缩放-->
    //    NSString *htmlString = [NSString stringWithFormat:@"<!DOCTYPE html>"   
    //                            "<html>"
    //                            "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">"
    //                            "<head>"                         
    //                            "<style type=\"text/css\">" 
    //                            "body{font-size: 17px; color:red; width:100%%}"
    //                            "p{width:100%%}"
    //                            "p img{display:block;width:300px;max-width:100%%;text-align:center;}"
    //                            "</style>"
    //                            "</head>"
    //                            "<body>%@</body>"              
    //                            "</html>",informationContent];
    NSLog(@"---htmlString= %@",htmlString);
    [self.wwebView loadHTMLString:htmlString baseURL:nil];
}



@end
