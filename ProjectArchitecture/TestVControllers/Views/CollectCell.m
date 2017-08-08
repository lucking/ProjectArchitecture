//
//  CollectCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CollectCell.h"
#import "UIView+ZMFrame.h"
#import "YYWebImage.h"

@interface CollectCell()
{
    CGFloat myWidth;
    CGFloat myHeight;
}
@end

@implementation CollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        myWidth = SSWIDTH;
        myHeight= rowHeight;
        
        //可编辑view
        [self addSubview:self.checkBgView];
        [self.checkBgView addSubview:self.checkImgView];
        CGFloat wh= 26;
        _checkImgView.frame = CGRectMake(10, 10, wh, wh);
        _checkImgView.center= self.checkBgView.center;
        
        //内容view
        [self addSubview:self.BgView];
        [self.BgView addSubview:self.imgView];
        [self.BgView addSubview:self.contentLab];
        [self.BgView addSubview:self.detailLab];
        [self.BgView addSubview:self.lineLab];
        
        self.BgView.backgroundColor = White_COLOR;
        self.checkBgView.backgroundColor = BgLightColor;
        
    }
    return self;
}

//配置数据
- (void)setModel:(Collect *)model {
    _model = model;
    _contentLab.text = model.title;
    _detailLab.text = model.createtime;
    
    [_imgView yy_setImageWithURL:[NSURL URLWithString:model.imageURL]
                     placeholder:[UIImage imageNamed:@"bgColorAA"]];
}

#pragma mark ======================"  setUI  "==============================

- (UIView *)BgView {
    if (_BgView==nil) {
        _BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    }return _BgView;
}
- (UIImageView *)imgView {
    if (_imgView==nil) {
        CGFloat ww = 110;
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(myWidth-ww-10, 5, ww, myHeight-15)];
        _imgView.backgroundColor = [UIColor clearColor];
        _imgView.layer.cornerRadius = 3.0f;
        _imgView.clipsToBounds = YES;
    }return _imgView;
}
- (UILabel *)contentLab {
    if (_contentLab==nil) {
        CGFloat ww = myWidth-10- _imgView.width-10 -5;
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(10,10, ww, myHeight/2)];
        _contentLab.font = FFont(15);
        _contentLab.textColor = Gray_333333;
        _contentLab.numberOfLines = 0;
        _contentLab.backgroundColor = [UIColor clearColor];
    }return _contentLab;
}
- (UILabel *)detailLab {
    if (_detailLab==nil) {
        _detailLab = [[UILabel alloc]initWithFrame:CGRectMake(10,_contentLab.bottom, _contentLab.width, myHeight/2-10)];
        _detailLab.font = FFont(12);
        _detailLab.textColor = Gray_666666;
        _detailLab.backgroundColor = [UIColor clearColor];
    }return _detailLab;
}
- (UILabel *)lineLab {
    if (_lineLab==nil) {
        CGFloat hh = 0.3f;
        _lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, myHeight-hh, myWidth, hh)];
        _lineLab.backgroundColor = Gray_666666;
    }return _lineLab;
}

#pragma mark ======================"  可编辑 Check Box "==============================

- (UIView *)checkBgView {
    if (_checkBgView==nil) {
        _checkBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 58, myHeight)];
    }return _checkBgView;
}
- (UIImageView *)checkImgView {
    if (_checkImgView==nil) {
        _checkImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    }return _checkImgView;
}

@end
