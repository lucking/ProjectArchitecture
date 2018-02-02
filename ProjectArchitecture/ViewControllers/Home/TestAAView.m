//
//  TestAAView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestAAView.h"

@implementation TestAAView

- (instancetype)init {
    if ([super init]) {
        [self addSubview:self.acceptBtn];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.acceptBtn];
    }
    return self;
}

- (UIButton *)acceptBtn {
    if (_acceptBtn==nil) {
        _acceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _acceptBtn.backgroundColor = [UIColor orangeColor];
        _acceptBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_acceptBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_acceptBtn setTitle:@"接单" forState:UIControlStateNormal];
        _acceptBtn.layer.cornerRadius = 3.f;
        _acceptBtn.clipsToBounds = YES;
    }
    return _acceptBtn;
}

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
