//
//  UIColor+APPTheme.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/8/1.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIColor+APPTheme.h"

@implementation UIColor (APPTheme)

#define UIColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
+ (UIColor *)colorWithHex:(UInt32)hex {
    return [UIColor colorWithHex:hex alpha:1.f];
}
+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}


/************************************  APP颜色配置  ***************************************/


/**
 *  整体背景颜色
 */
+(UIColor *)Theme_BgColor { return [UIColor colorWithHex:0xffffff]; }

// 导航栏
+(UIColor *)NavBar_Color {   return UIColorRGB(112,174,225); }
// 主题模块栏
+(UIColor *)TabBar_Color {   return [UIColor colorWithHex:0x96CDCD]; }

// 导航栏标题
+(UIColor *)NavBarTitle_Color {     return [UIColor whiteColor]; }
// 辅助线颜色
+(UIColor *)AuxiliaryLine_Color {   return [UIColor colorWithHex:0xEDEDED]; }
// 虚线颜色
+(UIColor *)DottedLine_Color {      return [UIColor colorWithHex:0xEDEDED]; }






@end


