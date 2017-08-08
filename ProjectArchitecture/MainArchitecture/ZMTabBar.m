//
//  ZMTabBar.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMTabBar.h"

@implementation ZMTabBar


/**
 * 单例
 */
+ (ZMTabBar *)singleton
{
    static ZMTabBar *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


/**
 *  解决：超出父视图的按钮点击事件响应处理
    核心代码：在自定义的UIView视图类中，我们重写点击视图的方法，
 
 @param point 点击的点位置
 @param event 处理事件
 @return 响应的视图
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden) {
        return nil;
    }
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tempoint = [self.UpperBtn convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.UpperBtn.bounds, tempoint))
        {
            view = self.UpperBtn;
        }
    }
    return view;
}




@end
