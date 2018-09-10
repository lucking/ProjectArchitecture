//
//  UMShareManager.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UMShareManager.h"
//#import "UMSocialQQHandler.h"       //QQ的头文件
#import "UMSocialWechatHandler.h"   //微信的头文件
//#import "UMSocialSinaHandler.h"     //新浪的头文件
#import "UIViewController+UMShare.h"

#define  Title          @"欢迎使用【友盟+】社会化组件U-Share"
#define  descrContent   @"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！"

static NSString *NomalThumImage = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492079587991&di=1e036f0368a0ab260b94c8b6b8767643&imgtype=0&src=http%3A%2F%2Fattachment.mcbbs.net%2Fforum%2F201407%2F10%2F185629lgpede3zurtr6nzs.jpg";

//static NSString* const UMS_webpageUrl = @"http://www.ycjf111.com/";
//#define CompanyTopText	@""

@implementation UMShareManager

- (void)test {
    
//    [UMSocialQQHandler defaultManager];
    //    [QQApi isQQInstalled]
    //    if (![QQApiInterface isQQInstalled]) {
    //        
    //        NSLog(@"没安装qq或qq空间");
    //        [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ, UMShareToQzone]];
    //    }
    
}

+ (UMShareManager *)singleton
{
    static UMShareManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (void)shareWebPageTitle:(NSString *)title
                  content:(NSString *)content
                imageName:(NSString *)imageName
               webpageUrl:(id)webpageUrl
                indexPath:(NSIndexPath *)indexPath
                  superVC:(UIViewController *)superVC 
               completion:(void(^)(id data, NSError *error))completion {
    
    // __weak typeof(self) WS = self;
    // NSLog(@"---> content: %@",content);
    NSLog(@"--> share_row = %ld",(long)indexPath.row);
    NSLog(@"---> title: %@",title);
    NSLog(@"---> imageName: %@ \n",imageName);
    NSString* myTitle = @"";
    NSString* myDescr = @"";
    id thumImage = nil;
    if ([UMShareManager isNotBlankString:title]) {        myTitle = title;}
    if ([UMShareManager isNotBlankString:content]) {      myDescr = content;}
    if ([UMShareManager isNotBlankString:thumImage]) {    thumImage = imageName;
    }
    //分享的Url 图片必须是https的前缀
    //thumImage = NomalThumImage;
    if ([imageName hasPrefix:@"https"]) {
        thumImage = imageName;
    }else{
        thumImage = [UIImage imageNamed:@"appIcon"];
    }
    NSLog(@"---> thumbURL: %@ \n \n ",thumImage);
    UMSocialPlatformType platformType;
    if (indexPath.row==0) {         platformType = UMSocialPlatformType_WechatSession;  //微信好友        
    }else if (indexPath.row==1) {   platformType = UMSocialPlatformType_WechatTimeLine; //微信朋友圈       
    }else if (indexPath.row==2) {   platformType = UMSocialPlatformType_QQ;             //qq好友        
    }else if (indexPath.row==3) {   platformType = UMSocialPlatformType_Qzone;          //qq空间        
    }else if (indexPath.row==4) {   platformType = UMSocialPlatformType_Sina;           //新浪微博        
    }else{                          platformType = UMSocialPlatformType_UnKnown; //未知平台        
    }
    // 分享LinkCard(网页链接)
    [superVC shareWebPageToPlatformType:platformType
                             shareTitle:myTitle
                                  descr:myDescr
                             webpageUrl:webpageUrl
                              thumImage:thumImage completion:^(id data, NSError *error) {
                                  //回调
                                  completion(data,error);
                              }];
}

//字符串 非空判断
+ (BOOL)isNotBlankString:(NSString *)str {
    if ( (str.length>0) && (str!=nil) ) {
        return YES;
    }else{
        return NO;
    }
}




- (void)setPinterstInfo:(UMSocialMessageObject *)messageObj
{
    messageObj.moreInfo = @{@"source_url": @"http://www.umeng.com",
                            @"app_name": @"U-Share",
                            @"suggested_board_name": @"UShareProduce",
                            @"description": @"U-Share: best social bridge"};
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




#pragma mark - share type
//分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
                           text:(NSString *)UMS_Text
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = UMS_Text;

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

//分享图片
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
                      thumbImage:(UIImage *)thumbImage
                      shareImage:(UIImage *)shareImage
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图本地
    shareObject.thumbImage = thumbImage;
    
    [shareObject setShareImage:shareImage];
    
    // 设置Pinterest参数
    if (platformType == UMSocialPlatformType_Pinterest) {
        [self setPinterstInfo:messageObject];
    }
    
    // 设置Kakao参数
    if (platformType == UMSocialPlatformType_KakaoTalk) {
        messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
    }
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
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

static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";


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
                        completion:(void (^)(id data, NSError *error) )completion
{
    //    //创建分享消息对象
    //    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //    //创建网页内容对象
    //    NSString* thumbURL = thumImage;
    //    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title
    //                                                                             descr:descr
    //                                                                         thumImage:thumbURL];
    //    //设置网页地址
    //    shareObject.webpageUrl = RedirectURL;
    //    //分享消息对象设置分享内容对象
    //    messageObject.shareObject = shareObject;
    //    //调用分享接口
    //    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
    //
    //        completion(data,error);
    //
    //    }];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title
                                                                             descr:descr
                                                                         thumImage:thumImage];
    //设置网页地址
    shareObject.webpageUrl = @"http://mobile.umeng.com/social";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        
        completion(data,error);
        //        if (error) {
        //            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        //        }else{
        //            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
        //                UMSocialShareResponse *resp = data;
        //                //分享结果消息
        //                UMSocialLogInfo(@"response message is %@",resp.message);
        //                //第三方原始返回的数据
        //                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
        //                
        //            }else{
        //                UMSocialLogInfo(@"response data is %@",data);
        //            }
        //        }
    }];
}

// 3.分享图片和文字
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                                   text:(NSString *)UMS_Text
                             thumbImage:(UIImage *)thumbImage
                             shareImage:(UIImage *)shareImage
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = UMS_Text;
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    if (platformType == UMSocialPlatformType_Linkedin) {
        // linkedin仅支持URL图片
        shareObject.thumbImage = UMS_THUMB_IMAGE;
        [shareObject setShareImage: UMS_IMAGE];
    } else {
        shareObject.thumbImage = [UIImage imageNamed:@"icon"];
        shareObject.shareImage = [UIImage imageNamed:@"logo"];
    }
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
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



- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:Title
                                                                             descr:descrContent
                                                                         thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = @"http://mobile.umeng.com/social";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
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








@end
