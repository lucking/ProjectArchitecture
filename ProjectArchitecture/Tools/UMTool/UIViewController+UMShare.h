//
//  UIViewController+UMShare.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>

static NSString* const UMS_webpageUrl = @"http://www.ycjf111.com/";
typedef void (^UMShareCompletionHandler)(id result,NSError *error);

@interface UIViewController (UMShare)
{
    
}
#pragma mark 2.1  第三方平台支持的分享类型总览
//http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#2_1

#pragma mark 2.2  分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
                      shareText:(NSString *)text
                     completion:(void (^)(id data, NSError *error) )completion;

#pragma mark 2.3  分享图片
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
                       thumImage:(id)thumImage
                      shareImage:(id)shareImage
                      completion:(void (^)(id data, NSError *error) )completion;

#pragma mark 2.4  分享图文（新浪支持，微信/QQ仅支持图或文本分享）
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                              shareText:(NSString *)text
                              thumImage:(id)thumImage
                             shareImage:(id)shareImage
                             completion:(void (^)(id data, NSError *error) )completion;

#pragma mark 2.5  分享LinkCard(网页链接)
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                        shareTitle:(NSString *)title
                             descr:(NSString *)descr
                        webpageUrl:(NSString *)webpageUrl
                         thumImage:(id)thumImage
                        completion:(void (^)(id data, NSError *error) )completion;

#pragma mark 2.6  分享音乐
- (void)shareMusicToPlatformType:(UMSocialPlatformType)platformType
                      shareTitle:(NSString *)title
                           descr:(NSString *)descr
                       thumImage:(id)thumImage
                        musicUrl:(NSString *)musicUrl
                      completion:(UMShareCompletionHandler)completion;


#pragma mark 2.7  分享视频
- (void)shareVedioToPlatformType:(UMSocialPlatformType)platformType
                      shareTitle:(NSString *)title
                           descr:(NSString *)descr
                       thumImage:(id)thumImage
                        videoUrl:(NSString *)videoUrl
                      completion:(UMShareCompletionHandler)completion;

#pragma mark 2.8  分享微信小程序
- (void)shareMiniProgramToPlatformType:(UMSocialPlatformType)platformType;

#pragma mark 2.9  示例 分享文本到微信：
- (void)shareTextToWechat;

@end
