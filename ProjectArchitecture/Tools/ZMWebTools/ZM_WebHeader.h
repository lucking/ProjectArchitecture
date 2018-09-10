//
//  ZM_WebHeader.h
//  ZM_Web
//
//  Created by ZM on 2018/1/26.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZM_WebHeader_h
#define ZM_WebHeader_h


#define  ZM_WebAlertViewMsg(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:mmessage message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


//注意这里的url为手机端的网址 m.baidu.com，不要写成 www.baidu.com（网页端的网址）。

#define  Baidu          @"https://www.baidu.com"
#define  WebBaidu       @"https://m.baidu.com/"

#define  Taobao_shop    @"https://www.taobao.com/?spm=2013.1.0.0.5d03545bUhgGrk"
#define  Tongfudun      @"https://www.tongfudun.com/"
#define  Youku          @"http://www.youku.com"
#define  WangYi         @"http://news.163.com/"
//今日头条
#define  ToutTiao       @"https://www.toutiao.com/"

#define  ArticleDetails @"http://blog.csdn.net/hello2me/article/details/44100943"

#define  CCBline        @"http://mtest.spider.com.cn/netpay/ccbline.html?orderid=14260949&orderpayid=12658087&userid=967713&productName=spider_orders:12658087&cardNo=&p_source=baokan&psource=wapTwo"



#define  HtmlString1    @"<a href=\"http://172.16.1.150:8080/HQ1.0.0/index.jsp?code=600346&market=sh\">酒钢宏兴</a>"

#define  HtmlString2    @"<p><span style=\"color: rgb(105, 105, 105); font-family: Helvetica, Arial, sans-serif; line-height: 30px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">1、新疆燕窝水世界园区面积约1万平方米，主要游乐设备有：海浪池、漂流河、冲天回旋滑道、翻江倒海组合滑道、水寨、儿童嬉水设备等。该项目于2016年开业，填补了西北地区缺乏大型水上游乐设施的空白，成为最受瞩目的游乐项目。</span><br/><span style=\"color: rgb(105, 105, 105); font-family: Helvetica, Arial, sans-serif; line-height: 30px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">2、现酒店增加马术俱乐部会所，主要有纯血马、小矮马等优质品种的马匹60余匹。骑马是所有运动项目中对身体最有益处的高贵运动，它是主动与被动运动的最佳结合，为了推广我国马术文化，普及马术知识，让更多的骑马爱好者了解马和马术运动的基数常识，使每个人人都能安全、愉快的享受骑马的乐趣，神木源马术俱乐部特别推出马术专业指导。为广大马术爱好者提供专业、最优质的骑术训练课程。</span><br/><span style=\"color: rgb(105, 105, 105); font-family: Helvetica, Arial, sans-serif; line-height: 30px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">3、位于天山区燕儿窝路788号。</span></p ><p><img src=\"http://app.aixiangdao.com/ueditor/php/upload/image/20170621/1498034749348867.jpg\" title=\"1498034749348867.jpg\" alt=\"神木源 加水印的.jpg\" style=\"width: 100%;\" /></p>"


#endif /* ZM_WebHeader_h */
