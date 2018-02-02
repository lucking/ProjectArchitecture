//
//  RegisterViewController.m
//  HuiFang
//
//  Created by ZM on 15/12/1.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "RegisterViewController.h"
#import "ImageTextField.h"
#import "ZMReadProtocolView.h"
#import "SuccessViewController.h"
#import "NSString+ZMAdd.h"
#import "NSObject+AlertView.h"
#import "TestColorHeader.h"

#define  ValidTime      10
#define  RefreshTime    1.0 //5.0

@interface RegisterViewController ()<UITextFieldDelegate,ZMReadProtocolViewDelegate,ImageTextFieldDelegate>
{
	UIButton* nextBtn;
	NSTimer *timers;        //到计时
	int secondsCountDown;   // 秒
}
@property(nonatomic,strong)  ImageTextField* phoneText;
@property(nonatomic,strong)  ImageTextField* pwdText;
@property(nonatomic,strong)  ImageTextField* yzmText;
@property(nonatomic,strong)  UILabel *tisiLab;
@property(nonatomic,assign)  BOOL isCanUse;
/**
 *  阅读协议
 */
@property (nonatomic,strong) ZMReadProtocolView* readProtView;

@end

@implementation RegisterViewController

- (void)viewDidAppear:(BOOL)animated{
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
	//标题
	[self setTitle:@"用户注册" TitleColor:[UIColor whiteColor]];
	self.navigationController.navigationBar.hidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];

	[self initUI];


}
- (void)initUI
{
	_phoneText = [[ImageTextField alloc]initWithFrame:CGRectMake(20, 100, SSWIDTH-40, 35)];
	_phoneText.leftImgView.image = [UIImage imageNamed:@"phone_icon"];
	_phoneText.mainText.placeholder = @"请输入大陆手机号";
	_phoneText.rightLine.hidden = YES;
	_phoneText.mainText.tag = 10010;
	_phoneText.mainText.delegate = self;
	[self.view addSubview:_phoneText];

	_phoneText.mainText.text = @"";

	_yzmText = [[ImageTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_phoneText.frame)+10, SSWIDTH-40, 35)];
	_yzmText.leftImgView.image = [UIImage imageNamed:@"mail_icon"];
	_yzmText.mainText.placeholder = @"请输入短信验证码";
	[_yzmText.rightBtn setTitle:@"发送验证" forState:UIControlStateNormal];
	[_yzmText.rightBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
	_yzmText.rightBtn.backgroundColor = NavBg_COLOR;
	_yzmText.rightLine.hidden = YES;
	_yzmText.mainText.tag = 10010;
	_yzmText.mainText.delegate = self;
	_yzmText.delegate = self;
	[self.view addSubview:_yzmText];

	_pwdText = [[ImageTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_yzmText.frame)+10, SSWIDTH-40, 35)];
	_pwdText.leftImgView.image = [UIImage imageNamed:@"password_icon"];
	_pwdText.mainText.placeholder = @"请输入登录密码";
	_pwdText.rightLine.hidden = YES;
	_pwdText.mainText.tag = 10010;
	_pwdText.mainText.delegate = self;
	[self.view addSubview:_pwdText];


	NSString* 	_message = @"你有账户现在有 2亿 金额！";
	// 测试
	[self showAlertTitle:nil message:_message okTitle:@"确定" cancelTitle:nil okAction:^{
		NSLog(@"---> 确定");

	}  cancelAction:^{
		NSLog(@"---> 取消");

	} completion:^{
		NSLog(@"---> 弹出时");

	}];
//	AlertView(@"");


	
	// 阅读协议
	self.readProtView = [[ZMReadProtocolView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_pwdText.frame)+5, 0, 25)];
	self.readProtView.backgroundColor = [UIColor clearColor];
	self.readProtView.delegate = self;
	[self.readProtView setNormalImg:@"off" selectImg:@"right" normalTitle:@"我同意" selectTitle:@"已经阅读" proTitle:@"《用户使用协议》"];
	[self.view addSubview:self.readProtView];


	nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	nextBtn.frame= CGRectMake(20, CGRectGetMaxY(self.readProtView.frame)+10, SSWIDTH-40, 35);
	nextBtn.backgroundColor= Gray_AAAAAA;
	[nextBtn setTitle:@"提交注册" forState:UIControlStateNormal];
	[nextBtn setTintColor:[UIColor whiteColor]];
	nextBtn.titleLabel.font = FFont(14);
	nextBtn.layer.cornerRadius = 5;
	nextBtn.layer.masksToBounds= YES;
	[nextBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:nextBtn];


	_tisiLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nextBtn.frame)+10, SSWIDTH-40, 20)];
	_tisiLab.backgroundColor = Clear_COLOR;
	_tisiLab.font = FFont(12);
	_tisiLab.text = @"密码需由6-16字母和数字组成";
	_tisiLab.textColor = Gray_666666;
	_tisiLab.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:_tisiLab];


	[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

		if ([notificate.object isEqual:_phoneText.mainText] || [notificate.object isEqual:_pwdText.mainText]  || [notificate.object isEqual:_yzmText.mainText]){
			if (_phoneText.mainText.text.length > 11) {
				_phoneText.mainText.text = [_phoneText.mainText.text substringToIndex:11];
			}
			if (_yzmText.mainText.text.length > 6) {
				_yzmText.mainText.text = [_yzmText.mainText.text substringToIndex:6];
			}
			if (_pwdText.mainText.text.length > 16) {
				_pwdText.mainText.text = [_pwdText.mainText.text substringToIndex:16];
			}

			if (_phoneText.mainText.text.length == 11) {

				if (_yzmText.mainText.text.length == 6) {

					if (_pwdText.mainText.text.length >= 6) {

						nextBtn.backgroundColor= NavBg_COLOR;
						self.isCanUse = YES;

					}else {nextBtn.backgroundColor= Gray_AAAAAA; self.isCanUse = NO;}
					
				}else{nextBtn.backgroundColor= Gray_AAAAAA; self.isCanUse = NO;}

			}else {nextBtn.backgroundColor= Gray_AAAAAA; self.isCanUse = NO;}

		}
	}];

	//发送验证按钮
	_yzmText.rightBtnBlock = ^(NSString *backStr, UIButton *Btn, ImageTextField *imgTextField){
		

	};

}
#pragma mark ========="  ImageTextFieldDelegate：发送验证   "========

-(void)imageTextField:(ImageTextField *)ITView BtnClick:(UIButton *)Btn{

	secondsCountDown = ValidTime;//设定原始时间
	//不允许点击
	_yzmText.rightBtn.userInteractionEnabled = NO;
	//NStimer 到计时
	timers= [NSTimer scheduledTimerWithTimeInterval:RefreshTime target:self selector:@selector(timeFireMethods) userInfo:nil repeats:YES];
}
//到计时
-(void)timeFireMethods
{
	NSLog(@"--->seconds: %d",secondsCountDown);
	secondsCountDown--;
	NSString* BtnTitle= [NSString stringWithFormat:@"已发送%d",secondsCountDown];
	[_yzmText.rightBtn setTitle:BtnTitle forState:UIControlStateNormal];

	if(secondsCountDown==0)
	{
		NSLog(@"--->释放前_isValid: %d",[timers isValid]);
		//允许点击
		if ([timers isValid]) {
			[timers invalidate];//释放方法
			timers=nil;
			NSLog(@"--->释放后_isValid: %d",[timers isValid]);
		}
		secondsCountDown = ValidTime;//恢复时间
		[_yzmText.rightBtn setTitle:@"重新发送" forState:UIControlStateNormal];
		[_yzmText.rightBtn setUserInteractionEnabled:YES];//允许点击
	}

}

/**
 *  提交注册
 */
-(void)registerBtnClick{
	NSLog(@"registerBtnClick");
	
	if ([NSString isCharAndNumber:self.pwdText.mainText.text]) {

	}

	if (self.isCanUse == YES) {
		SuccessViewController* successVC= [[SuccessViewController alloc] init];
		successVC.type = @"register";
		[self.navigationController pushViewController:successVC animated:NO];
	}

}

#pragma mark ========="  ZMReadProtocolViewDelegate：阅读协议   "========
#pragma
- (void)readProtocolView:(ZMReadProtocolView *)RPView BtnClick:(UIButton*)Btn
{
	if (Btn.tag == 100) {
//		NSLog(@"readBtn");

	}else if (Btn.tag == 200){
		NSLog(@"protBtn");

	}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
