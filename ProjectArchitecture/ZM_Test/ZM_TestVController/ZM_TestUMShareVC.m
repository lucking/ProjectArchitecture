//
//  ZM_TestUMShareVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_TestUMShareVC.h"
#import "ZM_UITools.h"
//分享
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "ZMShareView.h"
#import "UMShareManager.h"
//#import "ZMNewsDetailHandleView.h"
//#import "ZMChangeFontView.h"
//#import "ZMNewsDetailHandleView.h"
//#import "ZM_HomeTableHeaderView.h"
#import "ZInputToolbar.h"
#import "UIView+LSExtension.h"
#import "UIViewController+UMShare.h"
//#import "UMSocialSnsService.h"

@interface ZM_TestUMShareVC ()
@property (nonatomic, strong) ZMShareView *shareView;
@end

@implementation ZM_TestUMShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self zm_setNavTitle:@"ZM_TestUMShareVC" backBtnHidden:NO originalBack:YES];
    [self.zmNavBarView rightItemTitle:@"" font:0 imgName:@"zm_share_707070"];
    self.zmNavBarView.backgroundColor = UIColorRGB(233,233,233);
//    self.zmNavBarView.zmBackBlock = ^{
//        NSLog(@"---zmBackBlock 特殊返回情况下使用");
//    };
    self.zmNavBarView.rightItemBlock = ^{
        NSLog(@"---rightItemBlock ");
    };
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.shareView];
    [self.shareView zm_configUIOfBottomHeight:0];
    [self configShare];
    //分享 数据配置
    [self.shareView setTitleArray:@[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间",@"新浪微博",]
                         imgArray:@[@"shareWX2",@"shareWX1",@"shareQQ",@"qzone",@"shareSina"]];
    
    
    UIButton *testBtn = [ZM_UITools zm_createBtnTitle:@"去分享" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:16] bgColor:RandomColor frame:CGRectMake(100, 200, 100, 38)];
    LLayerRadiusView(testBtn,5.f);
    [self.view addSubview:testBtn];
    [testBtn addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];  
    
}
- (void)testClick {
    [self.shareView showView];
//    [self share_Test];
//    [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
    
}

#pragma mark--- 分享模式
- (void)configShare {
    
    __weak typeof(self) WSelf = self;
    self.shareView.shareBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath) {
        NSLog(@"--> share_row = %ld",(long)indexPath.row);

        NSString *title   = @"测试";
        NSString *content = @"测试-information Description";
        NSString *webpageUrl = @"http://www.lianqing365.com/";
        NSString *imgURL = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
        [UMShareManager shareWebPageTitle:title content:content 
                                imageName:imgURL webpageUrl:webpageUrl indexPath:indexPath superVC:WSelf completion:^(id data, NSError *error) {
                                    [WSelf.shareView hiddenView];
                                    if (!error) {
                                        [HHudProgress hudShowMsg:@"分享成功" delay:1.0 addSubview:nil];
                                    }
                                }];
        //[WSelf share_Test];
    };
}

#pragma mark ======================"  使用测试  "==============================


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    //    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享标题" descr:@"分享内容描述" thumImage:[UIImage imageNamed:@"Photo.png"]];
    
    NSString *ss = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    NSLog(@"---imageNamed= %@",[UIImage imageNamed:@"Photo.png"]);
    
    UMShareWebpageObject *shareObject = [[UMShareWebpageObject alloc] init];
    [shareObject setThumbImage:ss];
    [shareObject setTitle:@"分享开发测试_标题"];
    [shareObject setDescr:@"分享开发测试_内容描述"];
    //设置网页地址
    shareObject.webpageUrl =@"http://mobile.umeng.com/social";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}


- (void)share_Test {
    
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    NSString* title = @"欢迎使用【友盟+】社会化组件U-Share";
    NSString* descr = @"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
    
    thumbURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492079587991&di=1e036f0368a0ab260b94c8b6b8767643&imgtype=0&src=http%3A%2F%2Fattachment.mcbbs.net%2Fforum%2F201407%2F10%2F185629lgpede3zurtr6nzs.jpg";
    
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        [HHudProgress hudShowMsg:@"请安装微信" delay:Hud_AlertTime addSubview:nil];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatTimeLine]) {
        [HHudProgress hudShowMsg:@"请安装微信" delay:Hud_AlertTime addSubview:nil];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
        [HHudProgress hudShowMsg:@"请安装QQ" delay:Hud_AlertTime addSubview:nil];
        return;
    }
    else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Qzone]) {
        [HHudProgress hudShowMsg:@"请安装QQ" delay:Hud_AlertTime addSubview:nil];
        return;
    } else if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
        [HHudProgress hudShowMsg:@"请安装新浪" delay:Hud_AlertTime addSubview:nil];
        return;
    }
    
    UMSocialPlatformType platformType;
    //    //微信朋友圈
    //    platformType = UMSocialPlatformType_WechatTimeLine;
    //    //微信好友
    //    platformType = UMSocialPlatformType_WechatSession;
    //新浪微博
    platformType = UMSocialPlatformType_Sina;
    //    //qq空间
    //    platformType = UMSocialPlatformType_Qzone;
    // 分享LinkCard(网页链接)
    [self shareWebPageToPlatformType:platformType
                          shareTitle:title
                               descr:descr
                          webpageUrl:UMS_webpageUrl
                           thumImage:thumbURL completion:^(id data, NSError *error) {
                           }];
    
    
}



- (ZMShareView *)shareView {
    if (!_shareView) {
        _shareView = [[ZMShareView alloc] init];
    }return _shareView;
}

@end
