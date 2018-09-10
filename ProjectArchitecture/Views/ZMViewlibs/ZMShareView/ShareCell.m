//
//  ShareCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ShareCell.h"
#import "UIView+ZMShare.h"

@interface ShareCell()
@property (nonatomic, assign) CGFloat Width;
@property (nonatomic, assign) CGFloat Height;
@end

@implementation ShareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _Width = self.frame.size.width;
        _Height= self.frame.size.height;
        
        [self addSubview:self.imgBgView];
        [self addSubview:self.imgView];
        [self addSubview:self.label];
        
        CGFloat wwhh = 60;
        _imgBgView.frame = CGRectMake(0, 0, wwhh, wwhh);
        _imgBgView.center = CGPointMake(_Width/2, _Height/2-10);

        CGFloat WH = wwhh-20;
        _imgView.frame  = CGRectMake(0, 0, WH, WH);
        _imgView.center =  _imgBgView.center;
        _label.frame    = CGRectMake(0, _imgBgView.bottom, _Width, _Height-_imgBgView.bottom);
    }
    return self;
}

- (UIView *)imgBgView {
    if (_imgBgView==nil) {
        _imgBgView = [[UIImageView alloc] init];
    }return _imgBgView;
}
- (UIImageView *)imgView {
    if (_imgView==nil) {
        _imgView = [[UIImageView alloc] init];
        _imgBgView.layer.cornerRadius = 8;
        _imgBgView.clipsToBounds = YES;
        _imgBgView.backgroundColor = [UIColor whiteColor];
    }return _imgView;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor darkTextColor];
    }
    return _label;
}

@end
