//
//  UIViewController+UMShare.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIViewController+UMShare.h"


//设置网页地址
//static NSString* const UMS_webpageUrl = @"http://mobile.umeng.com/social";
//static NSString* const UMS_webpageUrl = @"https://www.baidu.com/";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_IMAGE       = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";


#define UM_thumbURL     @"https://mobile.umeng.com/images/pic/home/social/img-1.png"
#define UM_title        @"欢迎使用【友盟+】社会化组件U-Share"
#define UM_descr        @"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！"
#define UM_webpageUrl   @"http://mobile.umeng.com/social"
//纯文本
#define UM_text             @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。"
//缩略图
#define UM_thumbImage       [UIImage imageNamed:@"icon"]
//网络图
#define UM_shareImageUrl    @"https://mobile.umeng.com/images/pic/home/social/img-1.png"
//音乐网页播放地址
#define UM_musicUrl         @"http://c.y.qq.com/v8/playsong.html?songid=108782194&source=yqq#wechat_redirect"
//视频网页播放地址
#define UM_videoUrl         @"http://video.sina.com.cn/p/sports/cba/v/2013-10-22/144463050817.html"

#define UMAlertView(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


@implementation UIViewController (UMShare)


#pragma mark ======================"  使用测试  "==============================

- (void)share_Test {
    
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    NSString* title = @"欢迎使用【友盟+】社会化组件U-Share";
    NSString* descr = @"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
    
    thumbURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492079587991&di=1e036f0368a0ab260b94c8b6b8767643&imgtype=0&src=http%3A%2F%2Fattachment.mcbbs.net%2Fforum%2F201407%2F10%2F185629lgpede3zurtr6nzs.jpg";
    
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        //[MMBProgress hudShowMessage:@"请安装微信" afterDelay:1.5f];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatTimeLine]) {
        //[MMBProgress hudShowMessage:@"请安装微信" afterDelay:1.5f];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
        //[MMBProgress hudShowMessage:@"请安装QQ" afterDelay:1.5f];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Qzone]) {
        //[MMBProgress hudShowMessage:@"请安装QQ" afterDelay:1.5f];
        return;
    } else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
        //[MMBProgress hudShowMessage:@"请安装新浪" afterDelay:1.5f];
        return;
    }
    
    UMSocialPlatformType platformType;
    //微信朋友圈
    platformType = UMSocialPlatformType_WechatTimeLine;
    //微信好友
    platformType = UMSocialPlatformType_WechatSession;
    //新浪微博
    platformType = UMSocialPlatformType_Sina;
    //qq空间
    platformType = UMSocialPlatformType_Qzone;
    // 分享LinkCard(网页链接)
    [self shareWebPageToPlatformType:platformType
                          shareTitle:title
                               descr:descr
                          webpageUrl:UMS_webpageUrl
                           thumImage:thumbURL completion:^(id data, NSError *error) {
                           }];
    
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
            NSLog(@"response data is %@",data);
        }
    }];
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

#pragma mark 2.5  分享LinkCard(网页链接)
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                        shareTitle:(NSString *)title
                             descr:(NSString *)descr
                        webpageUrl:(NSString *)webpageUrl
                         thumImage:(id)thumImage
                        completion:(void (^)(id data, NSError *error) )completion
{
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
    NSLog(@"---> platformType=  %ld \n ",platformType);
    NSLog(@"---> Share_fail_with_error=  %@ \n ",error);
    NSLog(@"---> localError=  %@ \n ",[error localizedDescription]);
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
            //[MMBProgress hudShowSucceed:@"分享成功" afterDelay:1.0f];
        }
    }else{
        NSLog(@"---> 分享成功_data=  %@ ",data);
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
