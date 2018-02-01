//
//  LetfRightTextView.m
//  ZMArchitecture
//
//  Created by ZM on 16/9/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "LetfRightTextView.h"
#import "UIView+ZMFrame.h"

@interface LetfRightTextView ()
{
    
}
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIView *verticalLine;
@end


@implementation LetfRightTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myWidth	= self.frame.size.width;
        myHeight= self.frame.size.height;
        
    }
    return self;
}



#pragma mark - /************************  setters data **************************/

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textField.text = text;
    
}
- (void)setTopLineX:(float)topLineX {
    _topLineX = topLineX;
    self.topLine.frame = CGRectMake(topLineX, 0, SSWIDTH-topLineX, 0.5f);
}

- (void)setBottomLineX:(float)bottomLineX {
    _bottomLineX = bottomLineX;
    self.bottomLine.frame = CGRectMake(bottomLineX, myHeight-1, SSWIDTH-bottomLineX, 1.0f);
}


#pragma mark - /************************  getters setters view **************************/
// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 90, myHeight)];
        _titleLab.font = FFont(16);
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

- (UITextField *)textField {
    if (_textField==nil) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(_titleLab.right+10, 0, SSWIDTH-_titleLab.right-10, myHeight)];
        [self addSubview:_textField];
    }
    return _textField;
}

- (UIView *)topLine {
    if (_topLine==nil) {
        _topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SSWIDTH, 0.5f)];
        _topLine.backgroundColor= Gray_CCCCCC;
        _topLine.alpha= 1.0;
        [self addSubview:_topLine];
    }
    return _topLine;
}

- (UIView *)bottomLine {
    if (_bottomLine==nil) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, myHeight-1, SSWIDTH, 1.0f)];
        _bottomLine.backgroundColor= Gray_CCCCCC;
        _bottomLine.alpha= 1.0;
        [self addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (UIView *)verticalLine {
    if (_verticalLine==nil) {
        _verticalLine = [[UIView alloc]initWithFrame:CGRectMake(_titleLab.right-1, 0, 1.0f, myHeight)];
        _verticalLine.backgroundColor= Gray_CCCCCC;
        _verticalLine.alpha= 1.0;
        [self addSubview:_verticalLine];
    }
    return _verticalLine;
}

@end
