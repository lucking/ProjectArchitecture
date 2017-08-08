//
//  SuccessViewController.m
//  HuiFang
//
//  Created by ZM on 15/12/1.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "SuccessViewController.h"
#import "LoginViewController.h"

@interface SuccessViewController ()
{
	UIButton* nextBtn;
}
@property(nonatomic,strong)  UILabel *tisiLab;
@property(nonatomic,strong)  UIImageView *dgImgv;
@property(nonatomic,strong)  UIImageView *cztxBgImgv;
@property(nonatomic,strong)  UILabel *titleLab;
@property(nonatomic,strong)  UILabel *dateLabAA;
@property(nonatomic,strong)  UILabel *moneyLab;
@property(nonatomic,strong)  UILabel *dateLabBB;

@end

@implementation SuccessViewController

- (void)viewDidAppear:(BOOL)animated{
	//隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
	//返回
//	[self returnViewWhite];
	//标题
//	[self setTitle:@"用户登录" TitleColor:[UIColor whiteColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];

	nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	nextBtn.backgroundColor= NavBg_COLOR;
	[nextBtn setTintColor:[UIColor whiteColor]];
	nextBtn.titleLabel.font = FFont(16);
	nextBtn.layer.cornerRadius = 3;
	nextBtn.layer.masksToBounds= YES;
	[nextBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:nextBtn];

	 //隐藏系统的
	self.navigationItem.hidesBackButton = YES;


	if ([self.type isEqualToString:@"register"]) {
		[self setTitle:@"用户注册" TitleColor:[UIColor whiteColor]];
		[self initRegisterUI];

		nextBtn.frame= CGRectMake(20, CGRectGetMaxY(_tisiLab.frame)+20, 150, 35);
		nextBtn.center = CGPointMake(SSWIDTH/2, CGRectGetMaxY(_tisiLab.frame)+40);
		[nextBtn setTitle:@"立即跳转" forState:UIControlStateNormal];


	}else if ([self.type isEqualToString:@"chongZhi"]){
		[self setTitle:@"充值成功" TitleColor:[UIColor whiteColor]];
		[self initChongZhiUI];

		nextBtn.frame= CGRectMake(20, CGRectGetMaxY(_cztxBgImgv.frame)+20, SSWIDTH-40, 35);
		[nextBtn setTitle:@"返回" forState:UIControlStateNormal];

	}else if ([self.type isEqualToString:@"tiXian"]){
		[self setTitle:@"提现成功" TitleColor:[UIColor whiteColor]];
		[self initChongZhiUI];

		nextBtn.frame= CGRectMake(20, CGRectGetMaxY(_cztxBgImgv.frame)+20, SSWIDTH-40, 35);
		[nextBtn setTitle:@"返回" forState:UIControlStateNormal];

	}


}
#pragma mark 按钮
-(void)BtnClick:(UIButton *)Btn{

	if ([self.type isEqualToString:@"register"]) {

		LoginViewController* loginVC= [[LoginViewController alloc] init];
		[self.navigationController pushViewController:loginVC animated:NO];

	}else if ([self.type isEqualToString:@"chongZhi"] || [self.type isEqualToString:@"tiXian"]){

		[self.navigationController popToRootViewControllerAnimated:YES];
	}
	
	
}

/**
 *  注册成功
 */
- (void)initRegisterUI
{
	_tisiLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, SSWIDTH-40, 20)];
	_tisiLab.backgroundColor = Clear_COLOR;
	_tisiLab.font = FFont(16);
	_tisiLab.text = @"注册成功即将跳转到登录页面";
	_tisiLab.textColor = Gray_666666;
	_tisiLab.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:_tisiLab];
}
/**
 *  充值成功
 */
- (void)initChongZhiUI{

	self.dgImgv = [[UIImageView alloc] initWithFrame:CGRectMake(20,  64+80, 20, 20)];
	self.dgImgv.backgroundColor = NavBg_COLOR;
	[self.view addSubview:self.dgImgv];

	/**
	 *  背景
	 */
	float bgWidth = SSWIDTH - CGRectGetMaxX(_dgImgv.frame) - 10*2;
	self.cztxBgImgv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_dgImgv.frame)+10, 64+20, bgWidth, 110)];
	self.cztxBgImgv.center = CGPointMake( bgWidth/2+CGRectGetMaxX(_dgImgv.frame)+10, _dgImgv.center.y);
	self.cztxBgImgv.backgroundColor = Gray_EEEEEE;
	[self.view addSubview:self.cztxBgImgv];
	//
	self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 20)];
	self.titleLab.backgroundColor = Clear_COLOR;
	self.titleLab.font = FFont(14);
	self.titleLab.textColor = Gray_444444;
	self.titleLab.textAlignment = NSTextAlignmentLeft;
	[_cztxBgImgv addSubview:self.titleLab];
	//
	self.dateLabAA = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_titleLab.frame), 150, 20)];
	self.dateLabAA.backgroundColor = Clear_COLOR;
	self.dateLabAA.font = FFont(12);
	self.dateLabAA.text = @"2015-10-09 09:22";
	self.dateLabAA.textColor = Gray_888888;
	self.dateLabAA.textAlignment = NSTextAlignmentLeft;
	[_cztxBgImgv addSubview:self.dateLabAA];
	//
	self.moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_dateLabAA.frame)+20, 150, 20)];
	self.moneyLab.backgroundColor = Clear_COLOR;
	self.moneyLab.font = FFont(12);
	self.moneyLab.textColor = Gray_555555;
	self.moneyLab.textAlignment = NSTextAlignmentLeft;
	[_cztxBgImgv addSubview:self.moneyLab];


	self.dateLabBB = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_moneyLab.frame), 200, 20)];
	self.dateLabBB.backgroundColor = Clear_COLOR;
	self.dateLabBB.font = FFont(12);
	self.dateLabBB.text = @"预计到账时间 2015-10-10 23:59前";
	self.dateLabBB.textColor = Gray_888888;
	self.dateLabBB.textAlignment = NSTextAlignmentLeft;
	[_cztxBgImgv addSubview:self.dateLabBB];



	if ([self.type isEqualToString:@"chongZhi"]) {

		self.moneyLab.frame = CGRectMake(20, CGRectGetMaxY(_dateLabAA.frame)+20, 150, 20);
		self.dateLabBB.hidden = YES;
		self.titleLab.text = @"充值成功";
		self.moneyLab.text = @"充值金额（元）2000.00";

	}else if ([self.type isEqualToString:@"tiXian"]){

		self.moneyLab.frame = CGRectMake(20, CGRectGetMaxY(_dateLabAA.frame)+10, 150, 20);
		self.dateLabBB.frame= CGRectMake(20, CGRectGetMaxY(_moneyLab.frame), 200, 20);
		self.titleLab.text = @"提现成功";
		self.moneyLab.text = @"提现金额（元）2000.00";
	}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
