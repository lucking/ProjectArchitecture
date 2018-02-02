//
//  UMShareManager.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

@interface UMShareManager : NSObject


+ (UMShareManager *)singleton;

//配置分享
+ (void)shareWebPageTitle:(NSString *)title
                  content:(NSString *)content
                imageName:(NSString *)imageName
               webpageUrl:(id)webpageUrl
                indexPath:(NSIndexPath *)indexPath
                  superVC:(UIViewController *)superVC 
               completion:(void(^)(id data, NSError *error))completion;
//字符串 非空判断
+ (BOOL)isNotBlankString:(NSString *)str;



//分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
                           text:(NSString *)UMS_Text;

//分享图片
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
                      thumbImage:(UIImage *)thumbImage
                      shareImage:(UIImage *)shareImage;

//分享图片和文字
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                                   text:(NSString *)UMS_Text
                             thumbImage:(UIImage *)thumbImage
                             shareImage:(UIImage *)shareImage;

/**
 分享
 
 @param platformType 分享平台
 @param title 标题
 @param descr 描述
 @param thumImage 网页内容
 @param completion 回调信息
 */
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                        shareTitle:(NSString *)title
                             descr:(NSString *)descr
                         thumImage:(id)thumImage
                        completion:(void (^)(id data, NSError *error) )completion;


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType;


@end
