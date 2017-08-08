//
//  Rectangle.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

+ (Rectangle *)singleton {
    static Rectangle *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)test {
    
    Rectangle *rectangle1 = [[Rectangle alloc] init];
    rectangle1.frame = CGRectMake(0, 0, 0, 0);
    
    
    Rectangle *rectangle2 = [[Rectangle alloc] init];
    rectangle2.frame = CGRectMake(0, 0, 0, 0);
}

//判断连个 矩形是否相交
- (BOOL)overLap:(Rectangle *)rectangleA rectangle2:(Rectangle *)rectangleB
{
    // A的左边 大于 B的右边
    if (rectangleA.right > rectangleB.x) {
        return NO;
    }
    else if (rectangleA.bottom > rectangleB.y) {
        return NO;
    }
    else if (rectangleA.x > rectangleB.right) {
        return NO;
    }
    else if (rectangleA.y > rectangleB.bottom) {
        return NO;
    }
    else{
        return YES;
    }
}

/**
 *  基本参数
 */
- (CGFloat)x		{	return self.frame.origin.x;			}
- (CGFloat)y		{	return self.frame.origin.y;			}
- (CGFloat)width	{   return self.frame.size.width;       }
- (CGFloat)height	{   return self.frame.size.height;      }
- (CGPoint)origin	{   return self.frame.origin;           }
- (CGSize)size		{   return self.frame.size;             }
- (CGFloat)left		{	return self.frame.origin.x;	}
- (CGFloat)top		{	return self.frame.origin.y; }
- (CGFloat)right	{	return self.frame.origin.x + self.frame.size.width;	}
- (CGFloat)bottom	{	return self.frame.origin.y + self.frame.size.height;}


// xx
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
// yy
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
// width
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
// height
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

// origin
- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
// size
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


// 左边：Left
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
// 上边：Top
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
// 右边：Right
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}// 下边：Bottom
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}



@end
