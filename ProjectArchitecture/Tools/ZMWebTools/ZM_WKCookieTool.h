//
//  ZM_WKCookieTool.h
//  ZM_Web
//
//  Created by ZM on 2018/1/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface ZM_WKCookieTool : NSObject
{
    
}
//1.使用全局的processPool,
@property (nonatomic, strong, readonly) WKProcessPool *processPool;

+ (instancetype)sharedSupport;

//关于Cookie同步
//WKWebView有自己的缓存机制,如果想同步session需要注意一下几个地方
+ (WKWebView *)createSharableWKWebView;


@end
