//
//  InputTextField.m
//  HuiFang
//
//  Created by ZM on 15/12/12.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField


- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {

		self.backgroundColor = GrayColor_Text;
		self.layer.cornerRadius = 3;
		self.layer.masksToBounds= YES;
		self.layer.borderWidth  = 1;
		self.layer.borderColor  = Gray_cccccc.CGColor;

		myWidth	= self.frame.size.width;
		myHeight= self.frame.size.height;
		ImgvWidth = 20;
		ImgvHeight=	myHeight;

		self.mainText.backgroundColor = Clear_COLOR;
		self.rightImgView.backgroundColor = Clear_COLOR;
		self.rightImgView.layer.cornerRadius = ImgvWidth/2;
		self.rightImgView.layer.masksToBounds= YES;
		self.rightImgView.hidden = YES;
		self.rightImgView.frame = CGRectMake(0, 0, 0, 0);

		self.mainText.font = FFont(14);
		self.mainText.textColor = Black_COLOR;

		// 监听输入框： 开始编辑时
		[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
			if ([notificate.object isEqual:self.mainText]){
				self.layer.borderColor  = NavBg_COLOR.CGColor;
			}
		}];
		// 监听输入框： 结束编辑时
		[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidEndEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

			if ([notificate.object isEqual:self.mainText]){
				self.layer.borderColor  = Gray_cccccc.CGColor;
			}
		}];

	}
	return self;
}
- (void)reloadUIwithType:(NSString *)type
{
	NSSLog(@"type= %@ ",type);
	//输入新密码
	if ([type isEqualToString:@"onePwdTextJiaoYi"]) {

		[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

			if ([notificate.object isEqual:self.mainText] ){

				if (self.mainText.text.length > 6) {
					self.mainText.text = [self.mainText.text substringToIndex:6];
				}
				if (self.mainText.text.length == 6) {
					_rightImgView.frame = CGRectMake(myWidth-30, (myHeight-20)/2, 20, 20);
					_rightImgView.hidden = NO;
					_rightImgView.image = [UIImage imageNamed:@"success"];
				}else
					_rightImgView.hidden = YES;
			}
		}];
	}
}
//右图
- (UIImageView *)rightImgView
{
	if (_rightImgView==nil) {
		_rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(myWidth-30, (myHeight-20)/2, 20, 20)];
		[self addSubview:_rightImgView];
	}
	return _rightImgView;
}
//输入框
- (UITextField *)mainText
{
	if (_mainText==nil) {

		float textWidth = myWidth-10-ImgvWidth-10;
		_mainText = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, textWidth, myHeight)];
		// [_mainText becomeFirstResponder]; //页面出现时：就显示keyboard
		_mainText.clearButtonMode = UITextFieldViewModeWhileEditing;
		[self addSubview:_mainText];
	}
	return _mainText;
}



@end

