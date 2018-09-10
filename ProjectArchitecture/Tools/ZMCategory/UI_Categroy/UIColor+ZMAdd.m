//
//  UIColor+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIColor+ZMAdd.h"

@implementation UIColor (ZMAdd)


+ (UIColor *)zm_colorHexString:(NSString *)hexValue {
    
    //将一个 NSString = @“#FF0000”转换成 RGB的方法
    NSMutableString *color = [[NSMutableString alloc] initWithString:hexValue];
    [color insertString:@"0x" atIndex:0];
    
    // 转换成标准16进制数：十六进制字符串转成整形。
    long colorLong = strtoul([color cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    // 通过位与方法获取三色值
    int R = (colorLong & 0xFF0000 )>>16;
    int G = (colorLong & 0x00FF00 )>>8;
    int B =  colorLong & 0x0000FF;
    //string转color
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0];;
}


//将图像转化为颜色对象
+ (UIColor*)zm_colorWithImage:(UIImage*)image{
    return [UIColor colorWithPatternImage:image];
}
// 用colorWithPatternImage设置view背景色太占内存，替代方法
// 采用了此办法，省了很多多MB内存。
+ (void)zm_colorWithView:(UIView *)view imageNamed:(NSString *)name {
    
    UIImage *image = [UIImage imageNamed:name];
    view.layer.contents = (id) image.CGImage;
}

// 设置随机颜色
+ (UIColor *)zm_getRandomColor {
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0
                           green:arc4random_uniform(256)/255.0
                            blue:arc4random_uniform(256)/255.0 alpha:1.0];
}


//颜色比较
+ (BOOL)zm_firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor
{
    if (CGColorEqualToColor(firstColor.CGColor, secondColor.CGColor)) {
        //NSLog(@"颜色相同");
        return YES;
    }else{
        //NSLog(@"颜色不同");
        return NO;
    }
}

/**
 颜色比较
 @param secondColor 另一种颜色
 @return 颜色相同返回YES，不相同返回NO
 */
- (BOOL)zm_isEqualToColor:(UIColor*)secondColor
{
    if (CGColorEqualToColor(self.CGColor, secondColor.CGColor)) {
        return YES;
    }else{
        return NO;
    }
}





@end

