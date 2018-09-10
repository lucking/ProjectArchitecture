//
//  ZM_WebConst.m
//  ZM_Web
//
//  Created by ZM on 2018/1/26.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_WebConst.h"

@implementation ZM_WebConst

/************************************** Test Use **********************************/
- (void)test {
    
}

/** 将特殊字符替换掉，图片自适应
 现象：UIWebView 加载内容用三个方法，其中 loadHTMLString 用来加载字符或者文本内容。当内容来自 json 数据时，
 特殊字符比如“<”、“>”、" “ "、" ” "等会被编码，
 */
+ (NSString *)htmlEntityDecode:(NSString *)string
{
    //将特殊字符替换了
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    // 图片自适应
    string = [NSString stringWithFormat:@"<html> \n"
              "<head> \n"
              "<style type=\"text/css\"> \n"
              "body {font-size:15px;}\n"
              "</style> \n"
              "</head> \n"
              "<body>"
              "<script type='text/JavaScript'>"
              "window.onload = function(){\n"
              "var $img = document.getElementsByTagName('img');\n"
              "for(var p in  $img){\n"
              " $img[p].style.width = '100%%';\n"
              "$img[p].style.height ='auto'\n"
              "}\n"
              "}"
              "</script>%@"
              "</body>"
              "</html>",string];
    return string;
}



// #pragma mark ======================="  WebView：Const  "=========================

/// web IP
NSString *const  WebIP     = @"http://172.16.1.156/"; 

+ (NSString *)webURLIP:(NSString *)webIP urlString:(NSString *)urlString 
{
    return [NSString stringWithFormat:@"%@%@%@",WebIP, @"chatRoomSystem/",urlString];
}

+ (NSString *)webURLString:(NSString *)urlString {
    // NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",[DX_ServerConfig getServerIP],@"chatRoomSystem/",urlString];
    return [NSString stringWithFormat:@"%@%@%@",WebIP,@"chatRoomSystem/",urlString];
}
// javascript document.cookie
// 
NSString *const  Web_document       = @"document";
//获取网页 title
NSString *const  Web_documentTitle  = @"document.title";
//获取网页 body
NSString *const  Web_documentBody   = @"document.body";
//获取所有 HTML 元素
NSString *const  Web_innerHTML      = @"document.documentElement.innerHTML"; //同：document.body.innerText
//获取节点值 
NSString *const  Web_Selection      = @"window.getSelection().toString()";

// 
NSString *const  Web_documentURL                = @"document.URL";
// 
NSString *const  Web_documentLocation           = @"document.location";
// 
NSString *const  Web_documentLocationHref       = @"document.location.href";
// 
NSString *const  Web_selfLocationHref           = @"self.location.href";
// 
NSString *const  Web_parentDocumentLocation     = @"parent.document.location";

// 
NSString *const  Web_topLocationHref            = @"top.location.href";
// 
NSString *const  Web_topLocationHostname        = @"top.location.hostname";
// 
NSString *const  Web_LocationHostname           = @"location.hostname";

// 
NSString *const  Web_documentLocationProtocol   = @"document.location.protocol";
// 获取URL关联的端口号
NSString *const  Web_documentLocationPort       = @"document.location.port";
// 获取链接属性中在井号“#”后面的分段
NSString *const  Web_documentLocationHash       = @"document.location.hash";
// 
NSString *const  Web_documentLocationSearch     = @"document.location.search";
// 
NSString *const  Web_documentLocationPathname   = @"document.location.pathname";
// 
NSString *const  Web_   = @"";
// 
NSInteger const  Web_loadTime       = 60;


// 
NSString *const  Web_Demo   = @"http://172.16.1.156/company/15_app/code/demo.html";
// 
NSString *const  Web_iosLogintTimeout       = @"iosLogintTimeout";
// 
NSString *const  Web_iosBackCallback        = @"iosBackCallback";
// 
NSString *const  Web_iosSelectSubscribe     = @"iosSelectSubscribe";
// 
NSString *const  Web_iosShare               = @"iosShare";


// #pragma mark ======================="  WKWebView：Const  "=========================



@end
