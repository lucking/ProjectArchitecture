//
//  CheckmarkCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CheckmarkCell.h"
#import "UIView+ZMFrame.h"

@interface CheckmarkCell()
{
    CGFloat myWidth;
    CGFloat myHeight;
}
@end

@implementation CheckmarkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        myWidth = SSWIDTH;
        myHeight= 60.f;
//        //可编辑view
//        [self addSubview:self.checkBgView];
//        [self.checkBgView addSubview:self.selectBtn];
//        CGFloat wh= 26;
//        _selectBtn.frame = CGRectMake(10, 10, wh, wh);
//        _selectBtn.center= self.checkBgView.center;
//
//        //内容view
//        [self addSubview:self.BgView];
//        [self.BgView addSubview:self.titleLab];
        
        [self addSubview:self.selectBtn];

    }
    return self;
}



- (UIView *)BgView {
    if (_BgView==nil) {
        _BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
        _BgView.backgroundColor = Yellow_COLOR;
    }
    return _BgView;
}

- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, myHeight)];
        _titleLab.font = FFont(16);
    }
    return _titleLab;
}

- (UIView *)checkBgView {
    if (_checkBgView==nil) {
        _checkBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 58, myHeight)];
        _checkBgView.backgroundColor = BgLightColor;
    }
    return _checkBgView;
}
- (UIButton *)selectBtn {
    if (_selectBtn==nil) {
//        _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 10, 30, 30)];

        [_selectBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
        [_selectBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        _selectBtn.backgroundColor = Gray_666666;
    }
    return _selectBtn;
}




@end
