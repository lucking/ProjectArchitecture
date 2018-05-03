//
//  LoginButton.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/8.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "LoginButton.h"

@interface LoginButton()
{
    int _Id;
}
@end

@implementation LoginButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"--------- drawRect: Drawing code");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"--------- awakeFromNib: Initialization code");
    [self configInit];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInit];
        NSLog(@"--------- initWithFrame");
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configInit];
        NSLog(@"--------- init");
    }
    return self;
}
// 初始化配置
- (void)configInit {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor cyanColor];
}
/*
 *  重新设置内部：imgageView 的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat xx = 20;
    CGFloat yy = 5;
    CGFloat ww = 0;
    CGFloat hh = 0;
    CGFloat spaceHH = self.frame.size.height- 26;

    if (self.frame.size.width >= spaceHH) {
        hh = spaceHH- yy*2;
        ww = hh;
        xx = (self.frame.size.width-ww)/2;
    }else{
        ww = self.frame.size.width- xx*2;
        hh = ww;
    }
//    NSLog(@"--- image_Id= %d",_Id);
//    NSLog(@"---> imageX = %f", xx);
//    NSLog(@"---> imageY = %f", yy);
//    NSLog(@"---> imageW = %f", ww);
//    NSLog(@"---> imageH = %f \n_ ", hh);
//    _Id++;
    return CGRectMake(xx, yy, ww, hh);
}
/*
 *  重新设置内部：label 的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat hh = 26;
    CGFloat xx = 0;
    CGFloat yy = self.frame.size.height-hh;;
    CGFloat ww = self.frame.size.width;
//    NSLog(@"--- title_Id= %d",_Id);
//    _Id++;
    return CGRectMake(xx, yy, ww, hh);
}
- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
//    NSLog(@"---> self.frame.size.width  = %f", self.frame.size.width);
//    NSLog(@"---> self.frame.size.height = %f", self.frame.size.height);
}


@end
