//
//  NSObject+UMShare.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "NSObject+UMShare.h"
#import "UMShareManager.h"
#import "UMManager.h"
#import "UMConst.h"

@implementation NSObject (UMShare)

#pragma mark ======================"  使用测试  "==============================

- (void)share_Test {
    
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    NSString* title = @"欢迎使用【友盟+】社会化组件U-Share";
    NSString* descr = @"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
    
    UMSocialPlatformType platformType;
    //微信朋友圈
    platformType = UMSocialPlatformType_WechatTimeLine;
    //微信好友
    platformType = UMSocialPlatformType_WechatSession;
    //新浪微博
    platformType = UMSocialPlatformType_Sina;
    //qq空间
    platformType = UMSocialPlatformType_Qzone;
    
    if ([UMManager sharePlatformType:platformType]) { //是否安装对应App
        // 分享LinkCard(网页链接)
        [self shareWebPageToPlatformType:platformType
                              shareTitle:title
                                   descr:descr
                              webpageUrl:UMS_webpageUrl
                               thumImage:thumbURL completion:^(id data, NSError *error) {
                               }];
    }    
}

#pragma mark - /************************  分享类型  **************************/

#pragma mark 2.2  分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
                      shareText:(NSString *)text
                     completion:(void (^)(id data, NSError *error) )completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = text;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        //回调
        completion(data,error);
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

#pragma mark 2.3  分享图片
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
                       thumImage:(id)thumImage
                      shareImage:(id)shareImage
                      completion:(void (^)(id data, NSError *error) )completion
{
    if ([UMManager sharePlatformType:platformType]) {
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        //如果有缩略图，则设置缩略图
        shareObject.thumbImage = thumImage;
        [shareObject setShareImage:shareImage];
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            //回调
            completion(data,error);
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"成功 %@",data);
            }
        }];
    }
}

#pragma mark 2.4  分享图文（新浪支持，微信/QQ仅支持图或文本分享）
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                              shareText:(NSString *)text
                              thumImage:(id)thumImage
                             shareImage:(id)shareImage
                             completion:(void (^)(id data, NSError *error) )completion
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = text;
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = thumImage;
    [shareObject setShareImage:shareImage];
    //设置分享内容对象
    messageObject.shareObject = shareObject;
    __weak typeof(self) WSelf = self;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        //回调
        completion(data,error);
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
            //错误处理
            [WSelf errorDeal:error toPlatformType:platformType];
        }else{
            NSLog(@"---> 分享回调_Response= %@ ",data);
            //成功处理
            [WSelf successDeal:data toPlatformType:platformType];
        }        
    }];
}

#pragma mark 2.5  分享LinkCard(网页链接)
/**_shareimage 是UIImage格式，分享的图片
 * _contentStr 是NSString格式，分享文字内容
 * _shareurlStr 是NSString格式，分享的链接
 */
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                        shareTitle:(NSString *)title
                             descr:(NSString *)descr
                        webpageUrl:(NSString *)webpageUrl
                         thumImage:(id)thumImage
                        completion:(void (^)(id data, NSError *error) )completion
{
    //    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title 
                                                                             descr:descr
                                                                         thumImage:thumImage];
    //设置网页地址
    shareObject.webpageUrl = webpageUrl;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    __weak typeof(self) WSelf = self;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        //回调
        completion(data,error);
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
            //错误处理
            [WSelf errorDeal:error toPlatformType:platformType];
        }else{
            NSLog(@"---> 分享回调_Response= %@ ",data);
            //成功处理
            [WSelf successDeal:data toPlatformType:platformType];
        }
    }];
}

#pragma mark 2.6  分享音乐
- (void)shareMusicToPlatformType:(UMSocialPlatformType)platformType
                      shareTitle:(NSString *)title
                           descr:(NSString *)descr
                       thumImage:(id)thumImage
                        musicUrl:(NSString *)musicUrl
                      completion:(UMShareCompletionHandler)completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建音乐内容对象
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:title
                                                                         descr:descr
                                                                     thumImage:thumImage];
    //设置音乐网页播放地址
    shareObject.musicUrl = musicUrl;
    //shareObject.musicDataUrl = @"这里设置音乐数据流地址（如果有的话，而且也要看所分享的平台支不支持）";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        //回调
        completion(data,error);
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

#pragma mark 2.7  分享视频
- (void)shareVedioToPlatformType:(UMSocialPlatformType)platformType
                      shareTitle:(NSString *)title
                           descr:(NSString *)descr
                       thumImage:(id)thumImage
                        videoUrl:(NSString *)videoUrl
                      completion:(UMShareCompletionHandler)completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建视频内容对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:title
                                                                         descr:descr
                                                                     thumImage:thumImage];
    //设置视频网页播放地址
    shareObject.videoUrl = videoUrl;
    //shareObject.videoStreamUrl = @"这里设置视频数据流地址（如果有的话，而且也要看所分享的平台支不支持）";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        //回调
        completion(data,error);
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

#pragma mark 2.8  分享微信小程序
- (void)shareMiniProgramToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //    UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:@"小程序标题" descr:@"小程序内容描述" thumImage:[UIImage imageNamed:@"icon"]];
    //    shareObject.webpageUrl = @"兼容微信低版本网页地址";
    //    shareObject.userName = @"小程序username，如 gh_3ac2059ac66f";
    //    shareObject.path = @"小程序页面路径，如 pages/page10007/page10007";
    //    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}


#pragma mark 2.9  示例 分享文本到微信：
- (void)shareTextToWechat
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.text = UM_text;
    
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                        message:message delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}



#pragma mark - /************************  分享结果处理  **************************/

- (void)errorDeal:(NSError *)error toPlatformType:(UMSocialPlatformType)platformType
{
    NSLog(@"---> platformType=  %ld ",(long)platformType);
    NSLog(@"---> Share_fail_with_error=  %@ ",error);
    NSLog(@"---> localError=  %@ ",[error localizedDescription]);
    NSDictionary *errorDic = [NSDictionary dictionaryWithDictionary:[error userInfo]];
    NSLog(@"---> userInfo=  %@ \n message= %@",[error userInfo], errorDic[@"message"]);
    
    if ([errorDic[@"message"] isEqualToString:@"APP Not Install"]) {
        if (platformType==UMSocialPlatformType_Sina) {                  UMAlertView(@"未安装 新浪APP ");
        }else if (platformType==UMSocialPlatformType_WechatTimeLine){   UMAlertView(@"未安装 微信APP");
        }else if (platformType==UMSocialPlatformType_WechatSession){    UMAlertView(@"未安装 微信APP");
        }else if (platformType==UMSocialPlatformType_QQ){               UMAlertView(@"未安装 QQAPP");
        }else if (platformType==UMSocialPlatformType_Qzone){            UMAlertView(@"未安装 QQAPP");
        }
    }else if ([errorDic[@"message"] isEqualToString:@"QQ not support api"]) {
        UMAlertView(@"未安装 QQAPP");
        
    }else if ([errorDic[@"message"] isEqualToString:@"Operation is cancel"]) {
        [HHudProgress hudShowMsg:@"取消分享" delay:1.0 addSubview:nil];
    }else{
        UMAlertView(errorDic[@"message"]);
    }
}
- (void)successDeal:(id)data toPlatformType:(UMSocialPlatformType)platformType
{
    if ([data isKindOfClass:[UMSocialShareResponse class]]) {
        UMSocialShareResponse *resp = data;
        NSString* response = [NSString stringWithFormat:@"%@",resp.originalResponse];
        NSLog(@"---> 分享成功_Response= %@ ",response);
        if ([response isEqualToString:@"0"]) {
            //AlertView(@"分享成功");
        }
        //分享结果消息
        UMSocialLogInfo(@"response message is %@",resp.message);
        //第三方原始返回的数据
        UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
    }else{
        NSLog(@"---> 分享成功_data=  %@ ",data);
        UMSocialLogInfo(@"response data is %@",data);
    }
}

- (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"Share succeed"];
    }else{
        NSMutableString *str = [NSMutableString string];
        if (error.userInfo) {
            for (NSString *key in error.userInfo) {
                [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
            }
        }
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
        }else{
            result = [NSString stringWithFormat:@"Share fail"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share" message:result delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}


@end

