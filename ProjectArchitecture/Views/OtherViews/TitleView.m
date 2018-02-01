
//
//  TitleView.m
//  HuiFang
//
//  Created by ZM on 15/12/2.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "TitleView.h"
#import "UIView+ZMFrame.h"
#import "NSString+ZMAdd.h"

@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		//如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，然后马上调用[view layoutIfNeeded]，实现布局
		//[self setNeedsLayout];
		//[self layoutIfNeeded];
		self.backgroundColor = GrayColor_titView;

		myWidth=	self.frame.size.width;
		myHeight=	self.frame.size.height;

		self.line.backgroundColor = NavBg_COLOR;
		self.titleLab.backgroundColor = Clear_COLOR;
		self.Btn.backgroundColor = Clear_COLOR;
	}
	return self;

}

-(void)layoutSubviews{

	if ([_Btn.titleLabel.text isEqualToString:@""] || _Btn.titleLabel.text==nil ) {
		_Btn.hidden = YES;
	}else{
		float width = [NSString getTextSizeWidth:_Btn.titleLabel.text Font:FFont(14) Height:myHeight];
		//[_Btn setTitleEdgeInsets:UIEdgeInsetsMake(_Btn.frame.size.width-width,0, width,myHeight)];
		_Btn.frame = CGRectMake(myWidth-width-20, 0, width+20, myHeight);
	}

//	if ([_titleLab.text isEqualToString:@""] || _titleLab.text==nil ) {
//		_titleLab.hidden = YES;
//	}
}

- (UIView *)line{

	if (_line==nil) {
		_line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, self.frame.size.height)];
		[self addSubview:_line];
	}
	return _line;
}

-(UILabel *)titleLab{
	if (_titleLab==nil) {
		_titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_line.frame)+10, 0, 200, self.frame.size.height)];
		_titleLab.textColor = Gray_333333;
		_titleLab.font = FFont(14);
		[self addSubview:_titleLab];
	}
	return _titleLab;
}

-(UIButton *)Btn{
	if (_Btn==nil) {
		_Btn = [[UIButton alloc] initWithFrame:CGRectMake(myWidth-100, 0, 100, myHeight)];
		_Btn.titleLabel.font = FFont(13);
		[_Btn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
		[_Btn setTitleColor:Gray_666666 forState:UIControlStateNormal];
		[self addSubview:_Btn];
	}
	return _Btn;
}

-(void)rightBtnClick{


	self.rightBtnBlock(@"");

}

@end

