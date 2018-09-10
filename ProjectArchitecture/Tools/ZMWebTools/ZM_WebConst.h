//
//  ZM_WebConst.h
//  ZM_Web
//
//  Created by ZM on 2018/1/26.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZM_WebConst : NSObject


//将特殊字符替换掉，图片自适应
+ (NSString *)htmlEntityDecode:(NSString *)string;


//获取web URL
+ (NSString *)webURLIP:(NSString *)webIP urlString:(NSString *)urlString;

+ (NSString *)webURLString:(NSString *)urlString;


// #pragma mark ======================="  WebView  "=========================

FOUNDATION_EXTERN NSString *const Web_document;
FOUNDATION_EXTERN NSString *const Web_documentTitle;
FOUNDATION_EXTERN NSString *const Web_documentBody;
FOUNDATION_EXTERN NSString *const Web_innerHTML;
FOUNDATION_EXTERN NSString *const Web_Selection;

FOUNDATION_EXTERN NSString *const Web_documentURL;
FOUNDATION_EXTERN NSString *const Web_documentLocation;
FOUNDATION_EXTERN NSString *const Web_documentLocationHref;
FOUNDATION_EXTERN NSString *const Web_selfLocationHref;
FOUNDATION_EXTERN NSString *const Web_parentDocumentLocation;

FOUNDATION_EXTERN NSString *const Web_topLocationHref;
FOUNDATION_EXTERN NSString *const Web_topLocationHostname;
FOUNDATION_EXTERN NSString *const Web_LocationHostname;
FOUNDATION_EXTERN NSString *const Web_documentLocationProtocol;
FOUNDATION_EXTERN NSString *const Web_documentLocationPort;
FOUNDATION_EXTERN NSString *const Web_documentLocationHash;
FOUNDATION_EXTERN NSString *const Web_documentLocationSearch;
FOUNDATION_EXTERN NSString *const Web_documentLocationPathname;
FOUNDATION_EXTERN NSString *const Web_;

FOUNDATION_EXTERN NSInteger const Web_loadTime;

FOUNDATION_EXTERN NSString *const Web_Demo;
FOUNDATION_EXTERN NSString *const Web_iosLogintTimeout;
FOUNDATION_EXTERN NSString *const Web_iosBackCallback;
FOUNDATION_EXTERN NSString *const Web_iosSelectSubscribe;
FOUNDATION_EXTERN NSString *const Web_iosShare;



@end
