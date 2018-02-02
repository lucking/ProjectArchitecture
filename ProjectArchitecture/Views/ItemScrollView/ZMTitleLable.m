//
//  ZMTitleLable.m
//  ZM_BaseViewController
//
//  Created by ZM on 15/9/1.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ZMTitleLable.h"
#import "TestColorHeader.h"

@implementation ZMTitleLable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
        self.scale = 0.0;
        self.textColor = Gray_333333;
        
        WWidth = self.frame.size.width;
        HHeight= self.frame.size.height;
		// NSLog(@"WWidth = %f",WWidth);
		// NSLog(@"HHeight = %f",HHeight);

//        //竖线
//        self.verticalLine = [[UIView alloc]initWithFrame:CGRectMake(WWidth-1, 10, 1, HHeight-20)];
//        self.verticalLine.backgroundColor = [UIColor lightGrayColor];
//        [self addSubview:self.verticalLine];

        //横线
		float xx = 5;
        self.horizontallLine = [[UIView alloc]initWithFrame:CGRectMake(xx, HHeight-4, WWidth-(xx*2), 2)];
        self.horizontallLine.backgroundColor = [UIColor orangeColor];
        self.horizontallLine.hidden = YES;
        [self addSubview:self.horizontallLine];

    }
    return self;
}

/** 通过scale的改变改变多种参数 */
- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    //红色
	//self.textColor = Orange_ff7800;
    if (scale==1) {
        self.textColor = [UIColor colorWithRed:(250/255.f)*scale green:(100/255.f)*scale blue:(10/255.f)*scale alpha:1];
    }else{
        self.textColor = Gray_333333;
    }    
    CGFloat minScale = 0.9;
    CGFloat trueScale = minScale + (1-minScale)*scale;
//    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
    
    self.font = [UIFont systemFontOfSize:(16*trueScale)];    
}
//竖线
- (UIView *)verticalLine {
	if (_verticalLine==nil) {
		_verticalLine = [[UIView alloc]initWithFrame:CGRectMake(WWidth-1, 10, 1, HHeight-20)];
		_verticalLine.backgroundColor = [UIColor lightGrayColor];
		[self addSubview:self.verticalLine];
	}
	return _verticalLine;
}

@end

