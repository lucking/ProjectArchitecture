//
//  TopBottomTextView.m
//  Architecture
//
//  Created by ZM on 16/9/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "TopBottomTextView.h"
#import "UIView+ZMFrame.h"

@implementation TopBottomTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myWidth	= self.frame.size.width;
        myHeight= self.frame.size.height;
        
    }
    return self;
}


- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textField.text = text;

}
// 两个控件之间的距离
- (void)setInterval:(float)interval {
    _interval = interval;
    
    float HH = 20;
    float yy = (myHeight-HH*2-interval)/2;
    _titleLab.frame = CGRectMake(10, yy, myWidth-10, HH);
    _textField.frame= CGRectMake(10, _titleLab.bottom+interval, myWidth-10, HH);
                  
}

#pragma mark - /************************  getters setters view **************************/
// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, myWidth-10, myHeight/2)];
        _titleLab.font = FFont(16);
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

- (UITextField *)textField {
    if (_textField==nil) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(10, _titleLab.bottom, myWidth-10, myHeight/2)];
        [self addSubview:_textField];
    }
    return _textField;
}

@end
