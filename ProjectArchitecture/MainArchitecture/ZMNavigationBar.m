//
//  ZMNavigationBar.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/10/11.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMNavigationBar.h"

static CGFloat naviBarHeight = 64;  // cell的高度
static CGFloat statusBarHeight = 145;  // cell的高度

@implementation ZMNavigationBar

//所以如果你的项目是自定义的navigationBar，那么在iOS11上运行就可能出现布局错乱的bug，解决办法是重写UINavigationBar的layoutSubviews方法，调整布局，上代码：
- (void)layoutSubviews {
    [super layoutSubviews];

    //注意导航栏及状态栏高度适配
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), naviBarHeight);
    for (UIView *view in self.subviews) {
        if([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.frame = self.bounds;
        }
        else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            CGRect frame = view.frame;
            frame.origin.y = statusBarHeight;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            view.frame = frame;
        }
    }
}

//再补充一点，看了简书App适配iOS11发现titleView支持autolayout，这要求titleView必须是能够自撑开的或实现了- intrinsicContentSize方法
- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
