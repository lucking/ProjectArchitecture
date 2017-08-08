//
//  SetTextView.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/31.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "SetTextView.h"
#import "UIView+ZMFrame.h"

#define hh  40

@implementation SetTextView

#pragma mark - /************************  getters setters view **************************/
/**
 *  setter getter view
 */
// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 20)];
        _titleLab.font = FFont(16);
        _titleLab.textColor = Gray_555555;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

- (UITextField *)textField {
    if (_textField==nil) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, _titleLab.bottom+10, self.width, hh)];
//        _textField.layer.borderWidth = 1.5f;
//        _textField.layer.borderColor = [UIColor colorWithWhite:0.902 alpha:1.000].CGColor;
        _textField.textColor = Green_COLOR;
        _textField.font = FFont(18);
        [self addSubview:_textField];
    }
    return _textField;
}


@end
