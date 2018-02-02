//
//  ImageTextField.m
//  LiCaiStandard
//
//  Created by ZM on 15/10/2.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ImageTextField.h"
#import "TestColorHeader.h"

//#define myWidth		self.frame.size.width
//#define myHeight	self.frame.size.height
#define ImgvWidth	20	//的宽
#define ImgvHeight	30	//的高
#define BtnWidth	70	//
//#define BtnHeight	30	//

@implementation ImageTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

		self.backgroundColor = Gray_EEEEEE;
		self.layer.cornerRadius = 3;
		self.layer.masksToBounds= YES;
		self.layer.borderWidth  = 1;
		self.layer.borderColor  = Gray_CCCCCC.CGColor;

		myWidth	= self.frame.size.width;
		myHeight= self.frame.size.height;


		self.leftImgView.backgroundColor = Clear_COLOR;
		self.rightBtn.backgroundColor = Clear_COLOR;
		self.mainText.backgroundColor = Clear_COLOR;
		self.rightLine.backgroundColor = Gray_CCCCCC;

		self.mainText.font = FFont(14);
		self.mainText.textColor = Black_COLOR;

		self.rightBtn.titleLabel.font = FFont(14);
		[self.rightBtn setTitleColor:Gray_666666 forState:UIControlStateNormal];


		// 监听输入框： 开始编辑时
		[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
			if ([notificate.object isEqual:self.mainText]){
				self.layer.borderColor  = NavBg_COLOR.CGColor;
			}
		}];
		// 监听输入框： 结束编辑时
		[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidEndEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

			if ([notificate.object isEqual:self.mainText]){
				self.layer.borderColor  = Gray_CCCCCC.CGColor;
			}
		}];

    }
    
    return self;
}
- (void)reloadUIwithDic:(NSDictionary *)parameter withType:(NSString *)type
{
	NSLog(@"type= %@ ",type);
	//输入新密码
	if ([type isEqualToString:@"SetNewPwd"]) {

		float textWidth = myWidth-0-0-20;
		_leftImgView.frame = CGRectMake(0, 0, 0, 0);
		_rightBtn.frame = CGRectMake(0, 0, 0, 0);
		_mainText.frame= CGRectMake(5, 0, textWidth, myHeight);
	}

	//来自：忘记密码
	if ([type isEqualToString:@"foregetIdCard"]) {

		if ([parameter[@"rightBtnx"] isEqualToString:@"0"]) {

			float textWidth = myWidth-ImgvWidth-0-20;
			_rightBtn.frame = CGRectMake(0, 0, 0, 0);
			_mainText.frame= CGRectMake(CGRectGetMaxX(_leftImgView.frame)+5, 0, textWidth, myHeight);
		}
	}
	
	//来自：添加银行卡
	if ([type isEqualToString:@"addBank"]) {
		_rightBtn.frame = CGRectMake(myWidth-30, (myHeight-15)/2, 10, 15);
	}
	
}

- (void)methodA
{

}
- (void)methodB
{
	
}

- (void)ImageTextFieldBtnClick:(UIButton *)Btn{
    
//    self.rightBtnBlock(@"按钮点击了",Btn, self);
    
    
    if ([self.delegate respondsToSelector:@selector(imageTextField:BtnClick:)]) {
        [self.delegate imageTextField:self BtnClick:Btn];
        NSLog(@"代理_按钮点击了");
    }
}

//左图
- (UIImageView *)leftImgView
{
	if (_leftImgView==nil) {
		_leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(2, 3, ImgvWidth, myHeight-6)];
//		_leftImgView.sizeToFit;
		_leftImgView.contentMode= UIViewContentModeScaleAspectFit;
		[self addSubview:_leftImgView];
	}
	return _leftImgView;
}
//右图按钮
- (UIButton *)rightBtn
{
	if (_rightBtn==nil) {
		_rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(myWidth-BtnWidth, 0, BtnWidth, myHeight)];
		[_rightBtn addTarget:self action:@selector(ImageTextFieldBtnClick:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_rightBtn];
	}
	return _rightBtn;
}
//输入框
- (UITextField *)mainText
{
	if (_mainText==nil) {
		float textWidth = myWidth-ImgvWidth-BtnWidth-20;
		_mainText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImgView.frame)+5, 0, textWidth, myHeight)];
		// [_mainText becomeFirstResponder]; //页面出现时：就显示keyboard
		_mainText.clearButtonMode = UITextFieldViewModeWhileEditing;
		[self addSubview:_mainText];
	}
	return _mainText;
}
//竖线
- (UIView *)rightLine
{
	if (_rightLine==nil) {
		_rightLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_rightBtn.frame), 0, 1, myHeight)];
		_rightLine.backgroundColor = Gray_666666;
		[self addSubview:_rightLine];
	}
	return _rightLine;
}

@end
