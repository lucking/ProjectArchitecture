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

@interface LoginViewController ()<UITextFieldDelegate>
{
	UIButton* nextBtn;
	
}
@property(nonatomic,strong)  ImageTextField* phoneText;
@property(nonatomic,strong)  ImageTextField* pwdText;


@end

@implementation LoginViewController

- (void)viewDidAppear:(BOOL)animated{
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
	//标题
	[self setTitle:@"用户登录" TitleColor:[UIColor whiteColor]];
	self.navigationController.navigationBar.hidden = NO;
	//如果登陆了就退出
	if ([UUserDefaults isLogin]) {
		[self.navigationController popViewControllerAnimated:NO];
	}
}
- (void)viewDidLoad {
    [super viewDidLoad];

	[self initUI];


}
- (void)initUI
{
	_phoneText = [[ImageTextField alloc]initWithFrame:CGRectMake(20, 100, SSWIDTH-40, 35)];
	_phoneText.leftImgView.image = [UIImage imageNamed:@"phone_icon"];
	_phoneText.mainText.placeholder = @"请输入手机号";
	[_phoneText.rightBtn setTitle:@"注册" forState:UIControlStateNormal];
	_phoneText.mainText.tag = 10010;
	_phoneText.mainText.delegate = self;
	_phoneText.mainText.text = @"13022155071";
	[self.view addSubview:_phoneText];
	
	if (_phoneText.mainText.text.length==11) {
		_phoneText.mainText.userInteractionEnabled = NO;
		NSString *str =[_phoneText.mainText.text substringWithRange:NSMakeRange(3,4)];
		NSLog(@"--->3: 从指定位置截取制定的宽度：%@",str);
		_phoneText.mainText.text =[_phoneText.mainText.text stringByReplacingOccurrencesOfString:str withString:@"****"];
		NSLog(@"--->str= %@",_phoneText.mainText.text);
	}
    
	_pwdText = [[ImageTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_phoneText.frame)+10, SSWIDTH-40, 35)];
	_pwdText.leftImgView.image = [UIImage imageNamed:@"mail_icon"];
	_pwdText.mainText.placeholder = @"请输入密码";
	[_pwdText.rightBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
	_pwdText.mainText.tag = 10010;
	_pwdText.mainText.delegate = self;
	_pwdText.mainText.secureTextEntry = YES;
	[self.view addSubview:_pwdText];


    nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	nextBtn.frame= CGRectMake(20, CGRectGetMaxY(_pwdText.frame)+20, SSWIDTH-40, 35);
	nextBtn.backgroundColor= Gray_AAAAAA;
	[nextBtn setTitle:@"登录" forState:UIControlStateNormal];
	[nextBtn setTintColor:[UIColor whiteColor]];
	nextBtn.titleLabel.font = FFont(14);
	nextBtn.layer.cornerRadius = 5;
	nextBtn.layer.masksToBounds= YES;
	[nextBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:nextBtn];


    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

		if ([notificate.object isEqual:_phoneText.mainText] || [notificate.object isEqual:_pwdText.mainText]){
			if (_phoneText.mainText.text.length > 11) {
				_phoneText.mainText.text = [_phoneText.mainText.text substringToIndex:11];
			}
			if (_pwdText.mainText.text.length > 6) {
				_pwdText.mainText.text = [_pwdText.mainText.text substringToIndex:6];
			}
			if (_phoneText.mainText.text.length == 11) {

				if (_pwdText.mainText.text.length == 6) {
					nextBtn.backgroundColor= NavBg_COLOR;
					
				}else nextBtn.backgroundColor= Gray_AAAAAA;
			}else	nextBtn.backgroundColor= Gray_AAAAAA;
		}
	}];
	//注册按钮
	_phoneText.rightBtnBlock = ^(NSString *backStr, UIButton *Btn, ImageTextField *imgTextField){

	};
	//忘记密码按钮
	_pwdText.rightBtnBlock = ^(NSString *backStr, UIButton *Btn, ImageTextField *imgTextField){

	};

}
// 登录
- (void)loginBtnClick {

	
}

@end
