//
//  UIView+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZMAdd)

/**
 设置
 @param cornerRadius 圆弧半径
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 */
-(void)zm_cornerRadius:(CGFloat)cornerRadius
        borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor;
/**
 设置view的四个边角圆弧
 
 @param myView  要设置的View
 @param corners 不同的角度
 @param radii   每个角的半径.
 @param fillColor 内部颜色（注意：myView.backgroundColor= 设为透明色，用fillColor代替背景色）
 @param lineWidth 边线宽度
 @param lineColor 边线颜色
 */
- (void)zm_setCornersOfView:(UIView *)myView
               byCorners:(UIRectCorner)corners
             cornerRadii:(CGSize)radii
               fillColor:(UIColor *)fillColor
               lineWidth:(CGFloat )lineWidth
               lineColor:(UIColor *)lineColor;

/**
 阴影设置：shadow
 
 @param myView  主视图
 @param shadowOffset  阴影偏移
 @param shadowColor   阴影颜色
 @param shadowOpacity 阴影透明度
 @param shadowRadius  阴影角弧度
 */
- (void)zm_setshadowOfView:(UIView *)myView
           shadowOffset:(CGSize)shadowOffset
            shadowColor:(UIColor *)shadowColor
          shadowOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius;


/**
 画虚线
 
 @param dashArray 虚线间隙数组
 @param startPoint  开始点 坐标
 @param endPoint    结束点 坐标
 @param lineWidth 线宽
 @param lineColor 线颜色
 */
- (void)zm_drawDashLineOfDashArray:(const CGFloat *)dashArray
                     startPoint:(CGPoint)startPoint
                       endPoint:(CGPoint)endPoint
                      lineWidth:(CGFloat)lineWidth
                      lineColor:(UIColor *)lineColor;


// 清除UITableView底部多余的分割线
+ (void)zm_clearTableViewLine:(UITableView *)tabelView
              isHeaderView:(BOOL)isHeader
              isFooterView:(BOOL)isFooter;


#pragma mark 导航视图 动画
- (void)zm_pushViewController:(UIViewController *)nav;

#pragma mark 普通动画
- (void)zm_flipView:(UIView *)myView
            Rect:(CGRect)myRect
         forView:(UIView *)view
    timeInterval:(NSTimeInterval)durationTime;



// 动画 (模仿系统方法)
- (void)zm_animationDuration:(NSTimeInterval)duration animation:(void (^)(void) )animationBlock;

// 翻页动画
- (void)zm_animationDuration:(NSTimeInterval)duration
               transition:(UIViewAnimationTransition)transition
                    curve:(UIViewAnimationCurve)curve
                animation:(void (^)(void) )animationBlock;

@end
