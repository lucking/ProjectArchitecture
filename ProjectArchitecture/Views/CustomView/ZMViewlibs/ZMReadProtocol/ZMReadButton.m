//
//  ZMReadButton.m
//  ZM_ReadProtocol
//
//  Created by ZM on 15/10/16.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "ZMReadButton.h"

#define RBWidth   self.frame.size.width
#define RBHeight  self.frame.size.height
#define RBboundsWidth   self.bounds.size.width
#define RBboundsHeight  self.bounds.size.height

@implementation ZMReadButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        self.ImgWH = 0;
        
    }
    return self;
}
/**
 *  重新设置内部：图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 2;
    CGFloat imageY = 5;
    CGFloat imageW = (self.frame.size.height- imageY*2);
    CGFloat imageH = imageW;
    
    self.ImgWH= imageX + imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/**
 *  重新设置内部：文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // CGFloat titleX = CGRectGetMaxX(self.imageView.frame) +10.0f; //这个不行，有影子，不知为什么

    CGFloat titleX = self.ImgWH + 8;
    CGFloat titleY = 0;
    CGFloat titleH = self.frame.size.height;
    CGFloat titleW = RBWidth - titleX;

    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

@end




