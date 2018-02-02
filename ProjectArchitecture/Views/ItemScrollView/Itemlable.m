//
//  Itemlable.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/9.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Itemlable.h"

#define ItemColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]

@implementation Itemlable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
        self.scale = 0.0;
        
        WWidth = self.frame.size.width;
        HHeight= self.frame.size.height;

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
    self.textColor =ItemColorRGB(250*scale, 100*scale, 10*scale);
    
//    CGFloat minScale = 0.9;
//    CGFloat trueScale = minScale + (1-minScale)*scale;
    //self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
    //self.font = [UIFont systemFontOfSize:(16*trueScale)];
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
