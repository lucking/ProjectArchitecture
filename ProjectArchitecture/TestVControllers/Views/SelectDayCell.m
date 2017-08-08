//
//  SelectDayCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "SelectDayCell.h"

@implementation SelectDayCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.Width = self.frame.size.width;
        self.Height= self.frame.size.height;
        
        [self addSubview:self.label];
        [self addSubview:self.line];

    }
    return self;
}
- (UILabel *)label {
    if (_label == nil) {

        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.Width, self.Height)];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor grayColor];
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}
- (UIView *)line {
    if (!_line) {
        _line= [[UIView alloc]initWithFrame:CGRectMake(5, self.Height-2, self.Width-10, 2)];
        _line.backgroundColor= [UIColor grayColor];
//        _line.alpha= 0.5f;
        _line.hidden = YES;
    }
    return _line;
}


@end
