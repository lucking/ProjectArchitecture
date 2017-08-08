//
//  ZMUpperButton.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/20.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMUpperButton.h"

@implementation ZMUpperButton


+ (instancetype)plusButton {
    ZMUpperButton *button = [[ZMUpperButton alloc] init];
//    UIImage *buttonImage = [UIImage imageNamed:@"post_normal"];
//    [button setImage:buttonImage forState:UIControlStateNormal];
//    [button setTitle:@"发布" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
//    [button sizeToFit];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，然后马上调用[view layoutIfNeeded]，实现布局
        //[self setNeedsLayout];
        //[self layoutIfNeeded];
        
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.highlighted = YES;
    }
    return self;
}
/*
 *  重新设置内部：图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 46;
    CGFloat imageH = imageW;
    CGFloat imageX = (self.frame.size.width - imageW)/2;
    CGFloat imageY = 2;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/*
 *  重新设置内部：文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + 2;;
    //    CGFloat titleY = self.frame.size.height-22 + 2;;
    CGFloat titleX = 0;
    CGFloat titleH = 20;
    CGFloat titleW = self.frame.size.width;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}


#pragma mark -
#pragma mark - Event Response

- (void)clickPublish {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:nil
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %@", @(buttonIndex));
}

@end
