//
//  TableReusableViewA.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/12.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TableReusableViewA.h"
#import "UIView+ZMFrame.h"

static CGFloat HeaderViewHeight = 40.f; // 头部的高度

@implementation TableReusableViewA

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // self.contentView.backgroundColor = [UIColor whiteColor];
    // self.backgroundColor = [UIColor whiteColor];
    self.BgView.backgroundColor = [UIColor yellowColor];
    self.nameLab.backgroundColor = [UIColor clearColor];
    self.moreBtn.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化UI
        self.backgroundView = ({
            UIView * view = [[UIView alloc] initWithFrame:self.bounds];
            view.backgroundColor = [UIColor clearColor];
            view;
        });
        [self initUI];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)initUI {
    //NSLog(@"self.width= %f",self.width);
    CGFloat arrowImgWidth = 22;
    self.BgView.frame       = CGRectMake(0, 0, SSWIDTH-12, HeaderViewHeight);
    self.arrowImgView.frame = CGRectMake(5, (HeaderViewHeight-arrowImgWidth)/2.f, arrowImgWidth, arrowImgWidth);
    self.nameLab.frame      = CGRectMake(_arrowImgView.right, 5, 140, 30);
    self.coverView.frame    = CGRectMake(0, 0, self.BgView.width, 40);
    self.moreBtn.frame      = CGRectMake(self.BgView.width-40, 20, 20, 4);
    self.lineView.frame     = CGRectMake(2, _coverView.bottom-0.5, self.BgView.width-4, 0.5);
    self.BgView.backgroundColor= [UIColor whiteColor];
}

- (UIView *)BgView {
    if (_BgView==nil) {
        UIView *HeaderView=[[UIView alloc]init];
        [self addSubview:HeaderView];
        _BgView= HeaderView;
    }return _BgView;
}
//箭头
- (UIImageView *)arrowImgView{
    if (_arrowImgView==nil) {
        UIImageView *angleImgView= [[UIImageView alloc]init];
        angleImgView.image = [UIImage imageNamed:@"arrow.png"];
        [self.BgView addSubview:angleImgView];
        _arrowImgView = angleImgView;
    }return _arrowImgView;
}
//标题
- (UILabel *)nameLab {
    if (_nameLab==nil) {
        UILabel *titleLab=[[UILabel alloc] init];
        titleLab.textColor = Gray_777777;
        titleLab.font= FFont(14);
        titleLab.textAlignment = NSTextAlignmentLeft;
        //titleLab.backgroundColor = Yellow_COLOR;
        [self.BgView addSubview:titleLab];
        _nameLab= titleLab;
    }return _nameLab;
}
//手势遮罩
- (UIView *)coverView {
    if (_coverView==nil) {
        UIView *coverView=[[UIView alloc] init];
        [self.BgView addSubview:coverView];
        _coverView= coverView;
    }return _coverView;
}
//更多
- (UIButton *)moreBtn {
    if (_moreBtn==nil) {
        UIButton *moreBtn= [[UIButton alloc]init];
        [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [self.BgView addSubview:moreBtn];
        _moreBtn= moreBtn;
    }return _moreBtn;
}
//底线
- (UIView *)lineView {
    if (_lineView==nil) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = Gray_999999;
        [self.coverView addSubview:lineView];
        _lineView= lineView;
    }return _lineView;
}


@end
