//
//  CALayer+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CALayer+ZMAdd.h"

@implementation CALayer (ZMAdd)

/**
 Xib 中设置圆角、边框
 
 设置圆角：      Key Path:layer.cornerRadius   Type:Number Value:8
 设置边框宽度：   Key Path:layer.borderWidth    Type:Number Value:1
 设置边框的颜色： Key Path:layer.borderColor    Type:Color Value值默认，此时边框颜色为黑色
 
 设置任意的边框颜色，首先要对CALayer添加category，然后在category中添加一个方法
 添加属性       Key Path:layer.borderCGColor  Type:Color 此时Value可以任意选择
 */

// borderCGColor
//- (void)setBorderCGColor:(UIColor *)color{
//    self.borderColor = color.CGColor;
//}

// borderUIColor
- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}
- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

// contentsUIImage
-(void)setContentsUIImage:(UIImage*)bgImage{
    self.contents=(__bridge id)(bgImage.CGImage);
}
-(UIImage*)contentsUIImage{
    return self.contents;
}

@end
