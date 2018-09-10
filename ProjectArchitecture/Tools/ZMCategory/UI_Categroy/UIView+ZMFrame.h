//
//  UIView+ZMFrame.h
//  ProjectArchitecture
//
//  Created by ZM on 2015/9/23.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZMFrame)
{
    
}
@property (nonatomic,strong) UILabel* lab;

// 自己模仿frame写出他的四个属性
@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;

@property (nonatomic, assign) CGPoint  origin;
@property (nonatomic, assign) CGSize   size;


@property (nonatomic, assign) CGFloat  minX;
@property (nonatomic, assign) CGFloat  maxX;
@property (nonatomic, assign) CGFloat  centerX;

@property (nonatomic, assign) CGFloat  minY;
@property (nonatomic, assign) CGFloat  maxY;
@property (nonatomic, assign) CGFloat  centerY;


@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height


-(void)removeAllSubview;


/**
 * 设置上边圆角
 */
- (void)setCornerOnTop:(CGFloat) conner;

/**
 * 设置下边圆角
 */
- (void)setCornerOnBottom:(CGFloat) conner;
/**
 * 设置左边圆角
 */
- (void)setCornerOnLeft:(CGFloat) conner;
/**
 * 设置右边圆角
 */
- (void)setCornerOnRight:(CGFloat) conner;

/**
 * 设置左上圆角
 */
- (void)setCornerOnTopLeft:(CGFloat) conner;
/**
 * 设置右上圆角
 */
- (void)setCornerOnTopRight:(CGFloat) conner;
/**
 * 设置左下圆角
 */
- (void)setCornerOnBottomLeft:(CGFloat) conner;
/**
 * 设置右下圆角
 */
- (void)setCornerOnBottomRight:(CGFloat) conner;


/**
 * 设置所有圆角
 */
- (void)setAllCorner:(CGFloat) conner;



@end
