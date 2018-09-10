//
//  TestAAView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestAAView.h"

#define zzWidth     self.bounds.size.width
#define zzHeight    self.bounds.size.height

@implementation TestAAView

- (instancetype)init {
    self = [super init];
    if (self) { 
        [self configInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInit];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.frame.size.width > 0.f) {
        [self configFrame];
    }    
}
- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark -----------"  private  "------------
// 初始化配置
- (void)configInit {  
    
    UITapGestureRecognizer * gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick:)];
    gesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:gesture];
}
// 配置 frame
- (void)configFrame {  
    [self addSubview:self.acceptBtn];

}
//手势绑定的事件
-(void) tapGestureClick:(UITapGestureRecognizer *)sender
{
    if (self.zmTestAAViewBlock) {
        self.zmTestAAViewBlock(@"99");
    }
    self.zmTestAAViewBlock = ^(NSString *msgCount) {
        
    };
    
}


// xib 使用
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    self = [[[NSBundle mainBundle] loadNibNamed:@"ZMChangeFontView" owner:self options:nil] lastObject];
//    if (self) {
//        [self configInit];
//    }
//    return self;
//}
//- (instancetype)init {
//    self = [super init];
//    self = [[[NSBundle mainBundle] loadNibNamed:@"ZMChangeFontView" owner:self options:nil] lastObject];
//    if (self) {
//        [self configInit];
//    }
//    return self;
//}

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
