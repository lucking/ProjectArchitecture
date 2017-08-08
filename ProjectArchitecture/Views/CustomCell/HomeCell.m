//
//  HomeCell.m
//  HuiFang
//
//  Created by ZM on 15/12/2.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "HomeCell.h"

//#define myWidth		self.frame.size.width
//#define myHeight	self.frame.size.height

@implementation HomeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		myWidth = SSWIDTH;
		myHeight= 60.f;

		[self addSubview:self.nameRateLab];	  // [self addSubview:_nameRateLab];
		[self addSubview:self.monthMoneyLab];
		[self addSubview:self.investBtn];
		[self addSubview:self.line];

		NSSLog(@"myWidth = %f", myWidth);
		NSSLog(@"myHeight= %f", myHeight);

	}
	return self;
}


//void (^configureCellBlock)(PhotoCell*, Photo*) = ^(PhotoCell* cell, Photo* photo) {
//	cell.nameLab.text = photo.name;
//};
//- (void)setModel
//{
//	MapLogo *mapLogoModel =	[[MapLogo alloc] init];
//	ProvinceList *provModel=[[ProvinceList alloc] init];
//	Page *pageModel =		[[Page alloc] init];
//	HomeCellConfigureBlock2(self,mapLogoModel,provModel,pageModel);
//}
//void (^HomeCellConfigureBlock2)(HomeCell*, id, id, id) = ^(HomeCell* cell, MapLogo* mapLogo, ProvinceList *provinc, Page *page){
//
//	cell.nameRateLab.text = page.borrowTitle;
//
//};
//- (void)configureForPhoto:(Finance *)finance
//{
////	self.photoTitleLabel.text = photo.name;
////	self.photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
//}



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

/**
 *
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
