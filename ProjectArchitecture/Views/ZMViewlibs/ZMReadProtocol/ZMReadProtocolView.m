//
//  ZMReadProtocolView.m
//  ZM_ReadProtocol
//
//  Created by ZM on 15/10/16.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "ZMReadProtocolView.h"

@implementation ZMReadProtocolView

#define RPwidth     self.bounds.size.width
#define RPheight    self.bounds.size.height

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        //初始化
        [self initView];
    }
    
    return self;
}

-(void)initView
{
    // 是否阅读按钮
    self.readBtn = [[ZMReadButton alloc] initWithFrame:CGRectMake(0, 0, 60, RPheight)];
    [self.readBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.readBtn.tag = ZMReadBtnTag;
    [self addSubview: self.readBtn];
    
    // 协议按钮
    self.protBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_readBtn.frame), 0, 60, RPheight)];
    [self.protBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.protBtn.tag = ZMProtBtnTag;
    [self addSubview:self.protBtn];
    
    UIColor* readColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1.0];
    UIColor* protColor = [UIColor colorWithRed:37/255.f green:153/255.f blue:250/255.f alpha:1.0];
    [self.readBtn setTitleColor:readColor forState:UIControlStateNormal];
    [self.protBtn setTitleColor:protColor forState:UIControlStateNormal];
    
    self.readBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.protBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.protBtn.backgroundColor = [UIColor clearColor];

}
// 是否阅读按钮：默认与选择的设置
// 协议按钮：标题
- (void)setNormalImg:(NSString*)nameA selectImg:(NSString*)nameB normalTitle:(NSString*)nameAA selectTitle:(NSString*)nameBB proTitle:(NSString*)nameCC
{
    [self.readBtn setImage:[UIImage imageNamed:nameA] forState:UIControlStateNormal];
    [self.readBtn setImage:[UIImage imageNamed:nameB] forState:UIControlStateSelected];
    [self.readBtn setTitle:nameAA forState:UIControlStateNormal];
    [self.readBtn setTitle:nameBB forState:UIControlStateSelected];
    [self.protBtn setTitle:nameCC forState:UIControlStateNormal];

    UIFont *fontAB = self.readBtn.titleLabel.font;
    UIFont *fontC  = self.protBtn.titleLabel.font;
    float widthA = [self getTextSizeWidth:nameAA Font:fontAB Height:RPheight];
    float widthB = [self getTextSizeWidth:nameBB Font:fontAB Height:RPheight];
    float widthC = [self getTextSizeWidth:nameCC Font:fontC Height:RPheight];

    if (widthA > widthB) {
        self.readBtn.frame = CGRectMake(0, 0, widthA+RPheight, RPheight);
        self.protBtn.frame = CGRectMake(CGRectGetMaxX(self.readBtn.frame)-5, 0, widthC, RPheight);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, widthA +RPheight +widthC, RPheight);
    }else{
        self.readBtn.frame = CGRectMake(0, 0, widthB+RPheight, RPheight);
        self.protBtn.frame = CGRectMake(CGRectGetMaxX(self.readBtn.frame)-5, 0, widthC, RPheight);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, widthB +RPheight +widthC, RPheight);
    }
}

-(void)BtnClick:(UIButton *)Btn
{
    // 取消按钮
    if (Btn.tag == ZMReadBtnTag) {
        
        Btn.selected = !Btn.selected;

        if ([self.delegate respondsToSelector:@selector(readProtocolView:BtnClick:)]) {
            [self.delegate readProtocolView:self BtnClick:Btn];
        }
    }else if (Btn.tag == ZMProtBtnTag){
        if ([self.delegate respondsToSelector:@selector(readProtocolView:BtnClick:)]) {
            [self.delegate readProtocolView:self BtnClick:Btn];
        }
    }
}

#pragma mark 计算字符串的尺寸宽度_width
- (float)getTextSizeWidth:(NSString*)string Font:(UIFont *)myfont Height:(float)height{
    //获取文本
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName:myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    return mySize.width + 1;
}


@end





