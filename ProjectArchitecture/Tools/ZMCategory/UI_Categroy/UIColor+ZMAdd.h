//
//  UIColor+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZMAdd)
{
    
}
// 计算色值
// 16进制色值转化为RGB返回UIColor类型对象
+ (UIColor *)zm_colorHexString:(NSString *)hexValue;


// 将图像转化为颜色对象
+ (UIColor*)zm_colorWithImage:(UIImage*)image;
+ (void)zm_colorWithView:(UIView *)view imageNamed:(NSString *)name;


// 设置随机颜色
+ (UIColor *)zm_getRandomColor;


//颜色比较
+ (BOOL)zm_firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor;
/**
 颜色比较
 @param secondColor 另一种颜色
 @return 颜色相同返回YES，不相同返回NO
 */
- (BOOL)zm_isEqualToColor:(UIColor*)secondColor;

@end

