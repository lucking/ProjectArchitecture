//
//  ZM_WKCookieTool.m
//  ZM_Web
//
//  Created by ZM on 2018/1/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_WKCookieTool.h"

@interface ZM_WKCookieTool ()
@property (nonatomic, strong) WKProcessPool *processPool;
@end


@implementation ZM_WKCookieTool

+ (instancetype)sharedSupport {
    static ZM_WKCookieTool *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [ZM_WKCookieTool new];
    });
    return  _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.processPool = [WKProcessPool new];
    }
    return self;
}

+ (WKWebView *)createSharableWKWebView {
    
    WKUserContentController* userContentController = [WKUserContentController new];
    
    NSMutableString *cookies = [NSMutableString string];
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource:[cookies copy]
                                                         injectionTime:WKUserScriptInjectionTimeAtDocumentStart
                                                      forMainFrameOnly:NO];
    [userContentController addUserScript:cookieScript];
    
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    // 以下两个属性：是允许H5视屏自动播放,并且全屏,可忽略
    configuration.allowsInlineMediaPlayback = YES;
    configuration.mediaPlaybackRequiresUserAction = NO;
    // 全局使用同一个processPool
    configuration.processPool = [[ZM_WKCookieTool sharedSupport] processPool];
    configuration.userContentController = userContentController;
    
    WKWebView *wk_webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    
    return wk_webView;
}


/**
 之前有试过在创建WKWebView的时候使用js脚本注入,但是没有成功,代码如下,
 
 具体什么原因导致的,我也不是很清楚,希望知道的朋友告知~, 也有可能是因为我项目的需求是同步jsessionid导致的,
 因为jsessionid是HtppOnly,不允许通过js脚本修改,
 */
//+ (WKWebView *)_createContentSharableWKWebView
//{
//    WKUserContentController* userContentController = [WKUserContentController new];
//    
//    NSMutableString *cookies = [NSMutableString string];
//    NSDictionary *constantCookies = [[self sharedSupport] constantCookies];
//    [constantCookies enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
//        [cookies appendFormat:@"document.cookie='%@=%@';\n", key, obj];
//    }];
//    
//    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource:[cookies copy]
//                                                         injectionTime:WKUserScriptInjectionTimeAtDocumentStart
//                                                      forMainFrameOnly:NO];
//    [userContentController addUserScript:cookieScript];
//    
//    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
//    configuration.processPool = [[ZM_WKCookieTool sharedSupport] processPool];
//    configuration.userContentController = userContentController;
//    
//    WKWebView *wk_webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
//    
//    return wk_webView;
//}


@end
