//
//  NoDataButton.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NoDataButton.h"

@implementation NoDataButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
//        self.titleLabel.backgroundColor = CyanColor;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

/*
 *  重新设置内部：imgageView 的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = 0;
    CGFloat imageH = 0;
    CGFloat selfWidth = self.frame.size.width;
    //去掉lab 后的剩余高度
    CGFloat topSpaceHeight = (self.frame.size.height - self.titleLabel.frame.size.height);
    //图片的基本高度
    CGFloat wh = 40;
    //自适应宽高
    //1.自身宽度 大于 剩余高度
    if (selfWidth > topSpaceHeight) {
        if (topSpaceHeight>wh) {
            imageW = imageH = wh;
            imageX = (selfWidth-imageW)/2;
            imageY = (topSpaceHeight-imageH)/2;
        }else{
            imageW = imageH = topSpaceHeight;
            imageX = imageY = 0;
        }
    }
    //2.自身宽度 大于 剩余高度
    if (selfWidth < topSpaceHeight) {
        if (selfWidth>wh) {
            imageW = imageH = wh;
            imageX = (selfWidth-imageW)/2;
            imageY = (topSpaceHeight-imageH)/2;
        }else{
            imageW = imageH = selfWidth;
            imageX = imageY = 0;
        }
    }
//    NSLog(@"---> imageX = %f", imageX);
//    NSLog(@"---> imageY = %f", imageY);
//    NSLog(@"---> imageW = %f", imageW);
//    NSLog(@"---> imageH = %f", imageH);
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/*
 *  重新设置内部：label 的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleH = 26;
    CGFloat titleX = 0;
    CGFloat titleY = self.frame.size.height-titleH;;
    CGFloat titleW = self.frame.size.width;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
