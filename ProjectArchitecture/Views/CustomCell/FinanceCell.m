//
//  FinanceCell.m
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "FinanceCell.h"

@implementation FinanceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		myWidth = SSWIDTH;
		myHeight= 60.f;

		[self addSubview:self.nameRateLab];	  // [self addSubview:_nameRateLab];
		[self addSubview:self.monthMoneyLab];
		[self addSubview:self.investBtn];
		[self addSubview:self.line];

//		NSSLog(@"myWidth = %f", myWidth);
//		NSSLog(@"myHeight= %f", myHeight);
	}
	return self;
}
/**
 *  方式一
 */
- (void)configureWithModelMapLogo:(MapLogo* )mapLogo provinc:(ProvinceList *)provinc page:(Page *)page;
{
	self.nameRateLab.text = page.borrowTitle;
	// ...
}
/**
 *  方式二：使用 getters and setters  如果只有一种模型可以引用（此处有多个，则没有使用）
 */
- (void)setFinanceModel:(Finance *)financeModel {

	_financeModel = financeModel;

	NSLog(@"retMsg = %@",financeModel.retMsg);
	self.nameRateLab.text = financeModel.retMsg;
	// ...
}
/**
 *  同方式一：如果只有一种模型可以引用（此处有多个，则没有使用）
 */
- (void)configureDataWithModelArray:(NSMutableArray *)modelArray cellForRowAtIndex:(long)index
{
	Finance* financeModel = (Finance *)modelArray[index];
	NSLog(@"retMsg = %@",financeModel.retMsg);
	self.nameRateLab.text = financeModel.retMsg;
	// ...
}


-(void)layoutSubviews{
	//	NSSLog(@"myHeight = %f",myHeight);
	_nameRateLab.frame = CGRectMake(20, 10, myWidth/3*2, 20);
	_monthMoneyLab.frame = CGRectMake(20, CGRectGetMaxY(_nameRateLab.frame), myWidth/2, 20);
	_investBtn.frame = CGRectMake(myWidth-100,60/2-10, 80, 20);
	_line = [[UILabel alloc] initWithFrame:CGRectMake(0,myHeight-1, myWidth, 1)];
}
- (void)setNeedsLayout{
	//	NSSLog(@"myHeight_111 = %f",myHeight);

}
- (void)layoutIfNeeded{
	NSSLog(@"myHeight_222 = %f",myHeight);
}

#pragma mark - getters and setters
/**
 *  setter getter view
 */
- (UILabel *)nameRateLab {
	if (_nameRateLab==nil) {
		_nameRateLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, myWidth/3*2, 20)];
		_nameRateLab.font = FFont(14);
		_nameRateLab.textColor = Gray_333333;
	}
	return _nameRateLab;
}
//
- (UILabel *)monthMoneyLab {
	if (_monthMoneyLab==nil) {
		_monthMoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_nameRateLab.frame), myWidth/2, 20)];
		_monthMoneyLab.font = FFont(12);
		_monthMoneyLab.textColor = Gray_999999;
	}
	return _monthMoneyLab;
}
//
- (UIButton *)investBtn {
	if (_investBtn==nil) {
		_investBtn = [[UIButton alloc]initWithFrame:CGRectMake(myWidth-100,60/2-10, 80, 20)];
		_investBtn.titleLabel.font = FFont(14);
		[_investBtn setTitleColor:NavBg_COLOR forState:UIControlStateNormal];
	}
	return _investBtn;
}
//
- (UIView *)line {
	if (_line==nil) {
		_line = [[UILabel alloc] initWithFrame:CGRectMake(0,59, myWidth, 1)];
		_line.backgroundColor =  Gray_BBBBBB;
	}
	return _line;
}


@end

