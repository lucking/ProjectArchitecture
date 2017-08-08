//
//  TestAAView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestAAView.h"

@implementation TestAAView


//核心代码：在自定义的UIView视图类中，我们重写点击视图的方法，

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tempoint = [self.acceptBtn convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.acceptBtn.bounds, tempoint))
        {
            view = self.acceptBtn;
        }
    }
    return view;
}  




@end
