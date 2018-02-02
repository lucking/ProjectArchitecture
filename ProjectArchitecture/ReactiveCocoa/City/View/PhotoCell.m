//
//  PhotoCell.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/25.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		myWidth = SSWIDTH;
		myHeight= 60.f;
//		NSLog(@"myWidth = %f", myWidth);
//		NSLog(@"myHeight= %f", myHeight);
        [self addSubview:self.label];
	}
	return self;
}

/**
 *  数据模型赋值
 */
- (void)setPhotoModel:(Photo *)photoModel {

	_photoModel = photoModel;
    self.label.text = _photoModel.name; //@"高清照相机";
}
//
- (UILabel *)label {
	if (_label==nil) {
		_label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, myWidth-40, myHeight-20)];
		_label.font = FFont(14);
		_label.textColor = Gray_333333;
	}
	return _label;
}


void (^configureCellBlock)(PhotoCell*, Photo*) = ^(PhotoCell* cell, Photo* photo) {
    cell.label.text = photo.name;
};



@end
