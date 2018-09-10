//
//  LQ_TestVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "LQ_TestVController.h"
//#import "Home_SearchBarVC.h"
//#import "LQ_TestHeader.h"
#import "TestModel.h"
#import <Masonry.h>

#import "ZM_ThirdLoginView.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMManager.h"
#import "LoginManager.h"
//#import "ThirdLogin_BindingPhoneVC.h"
//#import "ThirdLogin_ConfirmLoginVC.h"
#import "ZM_ThirdLoginManager.h"

//网络测试
#import "NetworkManager.h"
#import "NetworkSession.h"
#import "ServerURL.h"
#import "RequestErrorManager.h"
//#import "ProtocolViewController.h"
#import "UserModel.h"
#import "ZMBaseHeader.h"
#import "DeviceInfo.h"
#import "NSObject+ZMAdd.h"

@interface LQ_TestVController ()<ZM_ThirdLoginViewDelegate>
//@property (nonatomic,strong) ZM_ADScrollStringView *adScrollStringView;
//@property (nonatomic,strong) ZM_BarOwnerView *barOwnerView;
@property (nonatomic,copy) NSString *myName;
@property (nonatomic,assign) int myAge;
@end

@implementation LQ_TestVController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载
//    [self test_config];
//    [self test_barOwnerView];
    [self thirdLogin];

}

- (void)thirdLogin {
    ZM_ThirdLoginView *thirdLoginView = [[ZM_ThirdLoginView alloc] init];
    thirdLoginView.frame = CGRectMake(0, SSHEIGHT-200, SSWIDTH, 130);
    thirdLoginView.delegate = self;
    [self.view addSubview:thirdLoginView];   
    //thirdLoginView.backgroundColor = RandomColor;
    [thirdLoginView zm_ThirdLoginViewDataArray:[[LoginManager singleton] thirdLoginViewDataArray]];
}

#pragma mark --- ZM_ThirdLoginViewDelegate
//第三方登录
- (void)myView:(ZM_ThirdLoginView *)myView didSelectAtIndex:(NSInteger)index {
    
    UMSocialPlatformType platformType;
    if (index==0) {         platformType = UMSocialPlatformType_WechatSession;  //微信
    }else if (index==1) {   platformType = UMSocialPlatformType_QQ;             //QQ
    }else if (index==2) {   platformType = UMSocialPlatformType_Sina;           //新浪微博
    }else{                  platformType = UMSocialPlatformType_UnKnown;        //未知
        return;
    }
    [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
    zmWS(weakSf);
    
//    //绑定手机号
//    [weakSf toLoginInfo:nil];
    
    //对应平台 是否安装App
    if ([UMManager sharePlatformType:platformType]) { 
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController: self completion:^(id result, NSError *error) {
            UMSocialUserInfoResponse *resp = result;
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:resp.originalResponse];
            NSLog(@"---result= %@",result);
            NSLog(@"---dic= %@",dic); 
            NSLog(@"---error= %@",error); 

            NSLog(@"---unionId= %@",resp.unionId); 
            NSLog(@"---usid= %@",resp.usid);     
            //确认登录
//            ThirdLogin_ConfirmLoginVC *myVC= [[ThirdLogin_ConfirmLoginVC alloc] init];
            
            NSMutableDictionary *infoDic = [[NSMutableDictionary alloc] init];
            if (index==0) {        
                //微信 
//                myVC.usid       = resp.usid;
//                myVC.nickname   = dic[@"nickname"];
//                myVC.sex        = dic[@"sex"];
//                myVC.headimgurl = dic[@"headimgurl"];
                [infoDic setObject:dic[@"1"] forKey:@"type"];
                [infoDic setObject:resp.usid forKey:@"openId"];
                [infoDic setObject:dic[@"nickname"] forKey:@"nickname"];
                [infoDic setObject:dic[@"headimgurl"] forKey:@"headImgURL"];
                [infoDic setObject:dic[@"sex"]      forKey:@"sex"];
                
            }else if (index==1) {   
                //QQ
//                myVC.usid       = resp.usid;
//                myVC.nickname   = dic[@"nickname"];
//                myVC.sex        = [ZM_ThirdLoginManager QQ_getSex:dic[@"gender"]];
//                myVC.headimgurl = dic[@"figureurl_2"];
                [infoDic setObject:dic[@"2"] forKey:@"type"];
                [infoDic setObject:resp.usid forKey:@"openId"];
                [infoDic setObject:dic[@"nickname"] forKey:@"nickname"];
                [infoDic setObject:dic[@"figureurl_2"] forKey:@"headImgURL"];
                [infoDic setObject:[ZM_ThirdLoginManager QQ_getSex:dic[@"gender"]] forKey:@"sex"];

            }else if (index==2) {   
                //新浪微博
//                myVC.usid       = resp.usid;
//                myVC.nickname   = dic[@"screen_name"];
//                myVC.sex        = [ZM_ThirdLoginManager Sina_getSex:dic[@"gender"]];
//                myVC.headimgurl = dic[@"profile_image_url"];
                [infoDic setObject:dic[@"3"] forKey:@"type"];
                [infoDic setObject:resp.usid forKey:@"openId"];
                [infoDic setObject:dic[@"screen_name"] forKey:@"nickname"];
                [infoDic setObject:dic[@"profile_image_url"] forKey:@"headImgURL"];
                [infoDic setObject:[ZM_ThirdLoginManager Sina_getSex:dic[@"gender"]] forKey:@"sex"];

            }            
            //三方登录_登录判定
            [weakSf toLoginInfo:infoDic];            
//            [weakSf presentViewController:myVC animated:NO completion:^{
//                NSLog(@"---presentVC：确认登录 ConfirmLoginVC ");
//                [HHudProgress hudHidden];
//            }];
        }];
    }   
}


//三方登录_登录（该第三方是否登录过，1.登录过：登陆成功、2.没登录过：去绑定手机号，然后自动登录）
- (void)toLoginInfo:(NSDictionary *)infoDic { 
    
    //type：三方来源(1->微信、2->QQ、3->微博) @"123456789",
//    NSDictionary *params = @{@"openId":@"1234567890",
//                             @"type":@"1",
//                             @"clientNo":[DeviceInfo getIDFV]}; 
    

}
//登陆成功：通知、延迟返回
- (void)loginSuccessInfoDic:(NSDictionary *)infoDic {
    NSLog(@"---登录成功 ");  
   // [[LoginManager singleton] dealUserDataDic:infoDic]
    [self hudShowSucceed:@"登录成功" afterDelay:Hud_SuccessTime];
    [self performSelector:@selector(loginSuccess) withObject:nil afterDelay:Hud_SuccessTime];
//    [[NSNotificationCenter defaultCenter] postNotificationName:LQ_Login object:nil userInfo:nil];
}
- (void)loginSuccess {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//去绑定手机号
- (void)toBingPhoneInfo:(NSDictionary *)infoDic {
//    ThirdLogin_BindingPhoneVC *myVC= [[ThirdLogin_BindingPhoneVC alloc] init];
////    myVC.openId = @"123456789";
//    myVC.navController = self.navigationController;
//    myVC.infoDic = infoDic;
//    [self presentViewController:myVC animated:YES completion:^{
//        NSLog(@"---presentVC：绑定手机号 BindingPhoneVC ");
//        [HHudProgress hudHidden];
//    }];
}

- (void)test_config {
    //  [self test_barOwnerView];
    //  [self test_contentView];
//      [self test_adScrollStringView]; 
}
// 按钮
- (void)testClick:(UIButton *)Btn {
   
}
//- (void)searchHome {
//    //NSLog(@"---搜索= %@",searchText);
//}



- (void)test_contentView {
    
    UIScrollView *_sscrollview = [[UIScrollView alloc]init];
    //_sscrollview.contentSize = CGSizeMake(0,SSHEIGHT*3);
    _sscrollview.showsVerticalScrollIndicator = NO;
    _sscrollview.showsHorizontalScrollIndicator= NO;
    _sscrollview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_sscrollview];
    
    UIView *_contentView = [[UIView alloc] init];
    [_sscrollview addSubview:_contentView];    
    [_sscrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_sscrollview);
        make.width.equalTo(_sscrollview);
        make.height.greaterThanOrEqualTo(@0.f);//此处保证容器View高度的动态变化 大于等于0.f的高度
    }];
    
//    ZM_BarTieDetailContentView *contentView = [[ZM_BarTieDetailContentView alloc] init];
//    contentView.backgroundColor = [UIColor cyanColor];
//    [_contentView addSubview:contentView];
//    
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(_contentView);
//        make.top.mas_equalTo(10);
//        make.width.equalTo(_contentView.mas_width);
//        make.bottom.equalTo(_contentView).offset(-10);
//    }];
//    [contentView setData];
}

#pragma mark ------------------  setter getter ------------------
//
//- (ZM_ADScrollStringView *)adScrollStringView {
//    if (_adScrollStringView==nil) {
//        _adScrollStringView = [[ZM_ADScrollStringView alloc] init];
//    } return _adScrollStringView;
//}
//
//- (ZM_BarOwnerView *)barOwnerView {
//    if (_barOwnerView==nil) {
//        _barOwnerView = [[ZM_BarOwnerView alloc] init];
//    } return _barOwnerView;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    NSLog(@"---内存警告_%@：",NSStringFromClass([self class]));
}

- (void)dealloc {
//    NSLog(@"---dealloc: %@：",NSStringFromClass([self class]));
}

@end
