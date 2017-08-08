//
//  ViewStandard.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/17.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ViewStandard.h"

@implementation ViewStandard


- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {
		myWidth=	self.frame.size.width;
		myHeight=	self.frame.size.height;
		

	}

	return self;
}


#pragma mark ------------" getter and setter View------------

// 标题
- (UILabel *)titleLab {
	if (_titleLab==nil) {
		UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
		titleLab.font = FFont(18);
		titleLab.textColor = Black_COLOR;
		titleLab.textAlignment = NSTextAlignmentCenter;
		[self addSubview:titleLab];
		_titleLab = titleLab;
	}
	return _titleLab;
}



@end
