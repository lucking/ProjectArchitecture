//
//  ShareConst.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/12/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMConst : NSObject

// #pragma mark =======================" Share： define  "=========================

#define UMAlertView(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


#define YCShareTitleArray   @[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间",@"新浪微博"]
#define YCShareImgArray     @[@"shareWX2",@"shareWX1",@"shareQQ",@"qzone",@"shareSina"]


FOUNDATION_EXTERN NSString *const Share;

FOUNDATION_EXTERN NSString *const UM_thumbURL;
FOUNDATION_EXTERN NSString *const UM_title;
FOUNDATION_EXTERN NSString *const UM_descr;
FOUNDATION_EXTERN NSString *const UM_webpageUrl;
//纯文本
FOUNDATION_EXTERN NSString *const UM_text;
//缩略图
#define UM_thumbImage       [UIImage imageNamed:@"icon"]
//网络图
FOUNDATION_EXTERN NSString *const UM_shareImageUrl;
//音乐网页播放地址
FOUNDATION_EXTERN NSString *const UM_musicUrl;
//视频网页播放地址
FOUNDATION_EXTERN NSString *const UM_videoUrl;

//App的官网
FOUNDATION_EXTERN NSString *const UMS_webpageUrl;



@end
