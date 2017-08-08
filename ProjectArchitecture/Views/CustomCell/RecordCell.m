//
//  RecordCell.m
//  HuiFang
//
//  Created by ZM on 15/12/7.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "RecordCell.h"

//#define myWidth		self.frame.size.width
//#define myHeight	self.frame.size.height

@implementation RecordCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {

//		_nameRateLab.backgroundColor = Clear_COLOR;
//		_monthMoneyLab.backgroundColor=Clear_COLOR;
//		_investBtn.backgroundColor = Clear_COLOR;
//		_line.backgroundColor =  Clear_COLOR;

		myWidth = SSWIDTH - 10;
		myHeight= 60;


		self.moneyLab.textColor = NavBg_COLOR;
		self.moneyLab.textAlignment = NSTextAlignmentLeft;

		self.dateyLab.textColor = Gray_666666;
		self.dateyLab.textAlignment = NSTextAlignmentLeft;

		self.signLab.textColor = Gray_666666;
		self.signLab.textAlignment = NSTextAlignmentRight;

		self.line.backgroundColor =  Gray_BBBBBB;
	}
	return self;
}

//
- (UILabel *)moneyLab {
	if (_moneyLab==nil) {
		_moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 30)];
		_moneyLab.font = FFont(14);
		[self addSubview:_moneyLab];
	}
	return _moneyLab;
}
//
- (UILabel *)dateyLab {
	if (_dateyLab==nil) {
		_dateyLab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_moneyLab.frame), 150, 30)];
		_dateyLab.font = FFont(12);
		[self addSubview:_dateyLab];
	}
	return _dateyLab;
}
//
- (UILabel *)signLab {
	if (_signLab==nil) {
		_signLab = [[UILabel alloc]initWithFrame:CGRectMake(myWidth-150, myHeight/2-15, 120, 30)];
		_signLab.font = FFont(12);
		[self addSubview:_signLab];
	}
	return _signLab;
}
- (UIView *)line {
	if (_line==nil) {
		_line = [[UILabel alloc] initWithFrame:CGRectMake(1,myHeight-0.5, myWidth-2, 0.5)];
		[self addSubview:_line];
	}
	return _line;
}

@end



