//
//  LoginViewController.m
//  HuiFang
//
//  Created by ZM on 15/12/1.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "LoginViewController.h"
#import "ImageTextField.h"
#import "TestColorHeader.h"
#import "RegisterViewController.h"
#import "LoginUser.h"
#import "LoginManager.h"
#import "MJExtension.h"
#import <YYWebImage.h>
#import <UMSocialCore/UMSocialCore.h>
//#import <TencentOpenAPI/QQApiInterface.h>  


@interface LoginViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
}
@property (weak, nonatomic) IBOutlet UITextField *phoneEmailTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *headButton;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *WXloginBtn;
@property (weak, nonatomic) IBOutlet UIButton *QQloginBtn;
@property (weak, nonatomic) IBOutlet UIButton *XLloginBtn;
@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	[self setTitle:@"用户登录" TitleColor:[UIColor whiteColor]];//标题
	//如果登陆了就退出
	if ([UUserDefaults isLogin]) {
		[self.navigationController popViewControllerAnimated:NO];
	}
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    [self initUI];
    //给导航条添加一个返回按钮
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    _phoneEmailTF.text = @"13022155071";
    _phoneEmailTF.text = @"111111";
}
- (void)initUI
{
    _pwdText.secureTextEntry = YES;

    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

		if ([notificate.object isEqual:_phoneEmailTF] || [notificate.object isEqual:_pwdText]){
			if (_phoneEmailTF.text.length > 11) {
				_phoneEmailTF.text = [_phoneEmailTF.text substringToIndex:11];
			}
			if (_pwdText.text.length > 6) {
				_pwdText.text = [_pwdText.text substringToIndex:6];
			}
			if (_phoneEmailTF.text.length == 11) {

				if (_pwdText.text.length == 6) {
					_loginBtn.backgroundColor= NavBg_COLOR;
					
				}else _loginBtn.backgroundColor= Gray_AAAAAA;
			}else	_loginBtn.backgroundColor= Gray_AAAAAA;
		}
	}];

}

//返回
- (IBAction)backClick:(id)sender {
    // 模态控制器：有导航
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"--> 移除模态窗口");
    }];
    NSLog(@"-->  模态dismiss之后");
    // 模态控制器：无导航
    // [self dismissViewControllerAnimated:YES completion:^{
    //      NSLog(@"移除");
    // }];
}
//去登录： 账户登录
- (IBAction)loginClick:(id)sender {
    [self Login];
}
//去登录：第三方登录
- (IBAction)thirdLoginClick:(UIButton *)btn {
    if (btn.tag==11) {
        [self weixinLogin];

    }else if (btn.tag==22){
        [self QQLogin];

    }else if (btn.tag==33){
        [self sinaLogin];

    }
}
//去注册
- (IBAction)toRegisterClick:(id)sender {
    RegisterViewController *pushVC = [RegisterViewController new];
    [self.navigationController pushViewController:pushVC animated:YES];
}
//忘记密码
- (IBAction)forgetClick:(id)sender {

}
#pragma mark - 第三方登录
//微信登录
- (void)weixinLogin {
    NSLog(@"---微信登录");
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        [HHudProgress hudShowMsg:@"请安装微信" delay:1.0f addSubview:self.view];
        return;
    }
    WS(weakSelf);
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController : self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:resp.originalResponse];
        // [DX_ShowLoginView DX_showLoginSuccessfulView];
        [weakSelf zm_LoginGetUserInfo:dic];
    }];
    
}
//QQ登录
- (void)QQLogin {
    NSLog(@"---QQ登录");
 
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
        [HHudProgress hudShowMsg:@"请安装QQ" delay:1.0f addSubview:self.view];
        return;
    }
    WS(weakSelf);
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController : self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:resp.originalResponse];
        // [DX_ShowLoginView DX_showLoginSuccessfulView];
        [weakSelf zm_LoginGetUserInfo:dic];
    }];
    
//    ---zm_LoginGetUserInfo= {
//        city = "东城";
//        figureurl = "http://qzapp.qlogo.cn/qzapp/1106530559/AA664123667A193C1D930090C02CC597/30";
//        "figureurl_1" = "http://qzapp.qlogo.cn/qzapp/1106530559/AA664123667A193C1D930090C02CC597/50";
//        "figureurl_2" = "http://qzapp.qlogo.cn/qzapp/1106530559/AA664123667A193C1D930090C02CC597/100";
//        "figureurl_qq_1" = "http://q.qlogo.cn/qqapp/1106530559/AA664123667A193C1D930090C02CC597/40";
//        "figureurl_qq_2" = "http://q.qlogo.cn/qqapp/1106530559/AA664123667A193C1D930090C02CC597/100";
//        gender = "男";
//        "is_lost" = 0;
//        "is_yellow_vip" = 0;
//        "is_yellow_year_vip" = 0;
//        level = 0;
//        msg = "";
//        nickname = "";
//        province = "北京";
//        ret = 0;
//        vip = 0;
//        "yellow_vip_level" = 0;
//    }
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:self completion:^(id result, NSError *error) {
//        if (error) {
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            // 授权信息
//            NSLog(@"QQ uid: %@", resp.uid);
//            NSLog(@"QQ openid: %@", resp.openid);
//            NSLog(@"QQ accessToken: %@", resp.accessToken);
//            NSLog(@"QQ expiration: %@", resp.expiration);
//            // 用户信息
//            NSLog(@"QQ name: %@", resp.name);
//            NSLog(@"QQ iconurl: %@", resp.iconurl);
//            NSLog(@"QQ gender: %@", resp.gender);
//            // 第三方平台SDK源数据
//            NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//        }
//    }];
    
 
}
//新浪登录
- (void)sinaLogin {
    NSLog(@"---新浪登录");
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
        [HHudProgress hudShowMsg:@"请安装新浪" delay:1.0f addSubview:self.view];
        return;
    }
    WS(weakSelf);
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController : self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:resp.originalResponse];
        // [DX_ShowLoginView DX_showLoginSuccessfulView];
        [weakSelf zm_LoginGetUserInfo:dic];
    }];
}
- (void)zm_LoginGetUserInfo:(NSDictionary *)dic {
    NSLog(@"---zm_LoginGetUserInfo= %@",dic);

}

#pragma mark - 账户登录 （模拟用户信息）
- (void)Login {
    
    NSDictionary *responseObject = [LoginManager getTestUserInfo];
    NSLog(@"---responseObject= %@",responseObject);
    NSString *status = [NSString stringWithFormat:@"%@",responseObject[@"status"]];
    if ([status isEqualToString:@"1"]) {
        
        LoginUser *model =  [LoginUser mj_objectWithKeyValues:[responseObject objectForKey:@"LoginUser"]];
        //登陆信息存储本地
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:ZM_LoginUserMODEL];
                
        [HHudProgress hudShowMsg:@"登录成功" delay:1.0f addSubview:self.view];
        [self performSelector:@selector(zm_delaySuccess) withObject:@"延时返回" afterDelay:1.0f];
    }else{
        [HHudProgress hudShowMsg:@"登录失败" delay:1.5f addSubview:self.view];
        [self performSelector:@selector(zm_delayFailure) withObject:@"延时返回" afterDelay:1.5f];
    }
}
//登录成功：延时返回
- (void)zm_delaySuccess { 
    // 模态控制器：有导航
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
//登录失败：延时返回
- (void)zm_delayFailure {
    if ([self.fromVCId isEqualToString:@"DX_ConsultVController"]){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end
