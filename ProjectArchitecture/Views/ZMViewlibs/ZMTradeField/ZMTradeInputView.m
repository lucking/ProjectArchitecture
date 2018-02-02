//
//  ZMTradeInputView.m
//  LiCaiStandard
//
//  Created by ZM on 15/10/14.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "ZMTradeInputView.h"
#import "TestColorHeader.h"

@implementation ZMTradeInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        //蒙板
        self.coverView = [[UIView alloc]initWithFrame:self.bounds];
        self.coverView.backgroundColor = [UIColor grayColor];
        self.coverView.alpha = 0.5;
        [self addSubview:self.coverView];
        
        [self initView];
    }
    return self;
}

- (void)initView
{
	if (IsIPhone5) {
		self.BgView.frame = CGRectMake(10, 20, SSWIDTH-20, 260);
	}
	self.BgView.backgroundColor = [UIColor whiteColor];

	bgWidth = self.BgView.frame.size.width;//绝对坐标，
    bgHeight= self.frame.size.height;
    bgBoundsWidth =  self.BgView.bounds.size.width;//相对坐标
    bgBoundsHeight=  self.BgView.bounds.size.height;
    
    // x取消按钮
	self.cancleBtn.backgroundColor= [UIColor clearColor];
    // 标题
	self.titleLabel.text = @"向招商银行(尾号4273)提现";
	self.titleLabel.textColor = Gray_333333;
	self.titleLabel.font = FFont(14);
    //金额
	self.moneyLabel.textColor = Gray_333333;
	self.moneyLabel.font = FFont(15);
	self.moneyLabel.textAlignment = NSTextAlignmentCenter;
	self.moneyLabel.text = @"￥2000.00";
//    [Common changeTextColorLab:self.moneyLabel text:@"￥1000.00" color:Orange_ff7800];
    if (IsIPhone5) {
        self.moneyLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame)+ 5, bgWidth, 30);
    }

    //线
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.moneyLabel.frame), bgWidth, 1)];
    line.backgroundColor = Gray_DDDDDD;
    [_BgView addSubview:line];


    float yylineMax = CGRectGetMaxY(line.frame)+10 ;
    //银行名称
    self.bankNameLab = [[UILabel alloc] initWithFrame:CGRectMake(10, yylineMax, 150, 20)];
    self.bankNameLab.text = @"请输入支付密码";
    self.bankNameLab.textColor = Gray_666666;
    self.bankNameLab.font = [UIFont systemFontOfSize:14];
    [_BgView addSubview:self.bankNameLab];
    //右图(按钮)
    self.bankBtn = [[UIButton alloc] initWithFrame: CGRectMake(bgWidth-70, yylineMax, 60, 20)];
    self.bankBtn.backgroundColor = [UIColor clearColor];
	[self.bankBtn setTitle:@"找回密码" forState:UIControlStateNormal];
	[self.bankBtn setTitleColor:NavBg_COLOR forState:UIControlStateNormal];
	[self.bankBtn.titleLabel setFont:FFont(14)];
    self.bankBtn.tag = ZMTradeBankBtn;
    [_BgView addSubview:self.bankBtn];
    
    float yy = CGRectGetMaxY(self.bankNameLab.frame)+ 15;
    if (IsIPhone5) {
        self.moneyLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame)+ 5, bgWidth, 30);
        yy = CGRectGetMaxY(self.bankNameLab.frame)+ 10;
    }

	/**
	 *  输入框背景
	 */
    UIImageView* ImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, yy, bgWidth-40, 35)];
    ImgV.image = [UIImage imageNamed:@"password_in"];
    [_BgView addSubview:ImgV];
    //输入框
    self.tradeText= [[ZMTradeField alloc] initWithFrame:CGRectMake(20, yy, bgWidth-40, 35)];
    self.tradeText.backgroundColor = [UIColor clearColor];
    [_BgView addSubview:self.tradeText];


	self.pwdtsLab.textColor = Gray_999999;
	self.pwdtsLab.text = @"输入六位支付密码";
	self.pwdtsLab.font = FFont(12);

	self.yuELab.textColor = NavBg_COLOR;
	self.yuELab.text = @"汇房金融(余额200000.00)元";
	self.yuELab.font = FFont(14);

    // 确定按钮
    self.okBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_yuELab.frame)+5, bgWidth-20, 35)];
    self.okBtn.backgroundColor= Gray_999999;
    self.okBtn.layer.cornerRadius = 5;
    self.okBtn.layer.masksToBounds= YES;
    [self.okBtn setTitle:@"立即提现" forState:UIControlStateNormal];
    [self.okBtn setTintColor:[UIColor whiteColor]];
    self.okBtn.tag = ZMTradeOkBtn;
    [_BgView addSubview:self.okBtn];


    [self.cancleBtn addTarget:self action:@selector(tradeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bankBtn addTarget:self action:@selector(tradeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.okBtn addTarget:self action:@selector(tradeBtnClick:) forControlEvents:UIControlEventTouchUpInside];

	_okBtn.userInteractionEnabled = NO;
	[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

		if ([notificate.object isEqual:self.tradeText]){

			if (self.tradeText.text.length == 6) {
				_okBtn.backgroundColor= NavBg_COLOR;
				_okBtn.userInteractionEnabled = YES;
			}else {
				_okBtn.backgroundColor= Gray_999999;
				_okBtn.userInteractionEnabled = NO;
			}
		}
	}];

}

-(void)layoutSubviews
{
    
}
#pragma mark 设置代理：点击按钮
- (void)tradeBtnClick:(UIButton *)Btn
{
	NSLog(@"tradeText = %@",self.tradeText.text);
	_okBtn.backgroundColor= Gray_999999;
    
    if ([self.delegate respondsToSelector:@selector(tradeInputView:BtnClick:)]) {
        [self.delegate tradeInputView:self BtnClick:Btn];
    }
}
-(void)show
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *self_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    NSArray *self_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    [keyWindow addConstraints:self_H];
    [keyWindow addConstraints:self_V];
    
}

-(void)dismiss
{
    [UIView animateWithDuration:0.3f animations:^{
        
    }completion:^(BOOL finished) {
        if(finished)
        {
            [self removeFromSuperview];
        }
    }];
}

- (UIView *)BgView{

	if (_BgView==nil) {
		_BgView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, SSWIDTH-20, 290)];
		_BgView.backgroundColor = [UIColor whiteColor];
		_BgView.layer.cornerRadius = 5;
		_BgView.layer.masksToBounds= YES;
		[self addSubview:_BgView];
	}
	return _BgView;
}

- (UIButton *)cancleBtn{

	if (_cancleBtn==nil) {
		// x取消按钮
		self.cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(bgWidth-25, 2, 23, 23)];
		self.cancleBtn.backgroundColor= [UIColor clearColor];
		self.cancleBtn.layer.cornerRadius = 10;
		self.cancleBtn.layer.masksToBounds= YES;
		[self.cancleBtn setImage:[UIImage imageNamed:@"prompt_off_icon"] forState:UIControlStateNormal];
		self.cancleBtn.tag = ZMTradeCancleBtn;
		[_BgView addSubview:self.cancleBtn];
	}
	return _cancleBtn;
}
//标题
- (UILabel *)titleLabel{
	if (_titleLabel==nil) {
		_titleLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cancleBtn.frame), bgWidth, 20)];
		_titleLabel.textAlignment = NSTextAlignmentCenter;
		[_BgView addSubview:self.titleLabel];
	}
	return _titleLabel;
}
//金额
- (UILabel *)moneyLabel{
	if (_moneyLabel==nil) {
		_moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+ 20, bgWidth, 20)];
		_moneyLabel.textAlignment = NSTextAlignmentCenter;
		[_BgView addSubview:self.moneyLabel];
	}
	return _moneyLabel;
}
//线
//- (UIView *)line{
//	if (_line==nil) {
//		_line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_moneyLabel.frame), bgWidth, 1)];
//		[_BgView addSubview:_line];
//	}
//	return _line;
//}


- (UILabel *)pwdtsLab{

	if (_pwdtsLab==nil) {
		_pwdtsLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_tradeText.frame)+ 5,200, 20)];
		[_BgView addSubview:_pwdtsLab];
	}
	return _pwdtsLab;
}

- (UILabel *)yuELab{
	if (_yuELab==nil) {
		_yuELab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_pwdtsLab.frame)+ 5,bgWidth-20,20)];
		_yuELab.textAlignment = NSTextAlignmentCenter;
		[_BgView addSubview:_yuELab];
	}
	return _yuELab;
}

- (UIButton *)okBtn{

	if (_okBtn==nil) {
		_okBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_yuELab.frame)+5, bgWidth-20, 35)];
		_okBtn.backgroundColor= Blue_59A2E3;
		_okBtn.layer.cornerRadius = 5;
		_okBtn.layer.masksToBounds= YES;
		[_okBtn setTitle:@"立即提现" forState:UIControlStateNormal];
		[_okBtn setTintColor:[UIColor whiteColor]];
		_okBtn.tag = ZMTradeOkBtn;
//		[_BgView addSubview:_okBtn];
	}
	return _okBtn;
}
@end




