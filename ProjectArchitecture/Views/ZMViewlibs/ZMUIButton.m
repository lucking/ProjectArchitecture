//
//  UIButtonHandler.m
//  ZM_Block
//
//  Created by ZM on 2017/5/2.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMUIButton.h"
#import "UIButton+ZMAdd.h"

@implementation ZMUIButton

- (void)test {
    
    UIView *superView;
    //实现链式编程
    ZMUIButton *Btn1 = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 100, 100, 36)];
    //添加属性
    Btn1.addSubview(superView).bgColor([UIColor grayColor]).title(@"aaa", UIControlStateNormal);
    //修改属性
    Btn1.bgColor([UIColor redColor]);
    Btn1.title(@"bbb", UIControlStateNormal);
    //绑定方法
    Btn1.btnClick = ^(UIButton *btn){
        NSLog(@"---> addTarget_11 ");
    };
    //方法五：（类别runtime实现）UIButton之Block回调：实现绑定方法的响应
    [Btn1 addEventHandler:^(id obj) {
        NSLog(@"---> addTarget_33 ");
    } forControlEvents:UIControlEventTouchUpInside];
}


/**
 *  方法二：添加Block方法（绑定事件 ）
 */
- (ZMUIButton *)addClickAction:(BtnClick)clickAction forEvents:(UIControlEvents)event {
    
    [self addTarget:self action:@selector(clickAction:) forControlEvents:event];
    self.btnClick = clickAction;
    return self;
}

- (ZMUIButton *)addTarget:(nullable id)target 
              clickAction:(BtnClick)clickAction forEvents:(UIControlEvents)event {
    
    [self addTarget:target action:@selector(clickAction:) forControlEvents:event];
    self.btnClick = clickAction;
    return self;
}
- (void)clickAction:(UIButton *)Btn {
    if (self.btnClick) {
        self.btnClick(Btn);
    }
}


#pragma mark ======================"  setter getter  "==============================

/*
 * 同上：可以继续添加属性
 */
// 添加到父视图
- (ZMUIButton *(^)(UIView *))addSubview {
    __weak typeof(self) wSelf = self;
    return ^(UIView *superView){
        [superView addSubview:wSelf];
        return wSelf;
    };
}
// 背景颜色：backgroundColor
- (ZMUIButton *(^)(UIColor *))bgColor {
    __weak typeof(self) wSelf = self;
    return ^(UIColor *backgroundColor){
        [wSelf setBackgroundColor:backgroundColor];
        return wSelf;
    };
}
// 标题：title
- (ZMUIButton *(^)(NSString *, UIControlState))title {
    __weak typeof(self) wSelf = self;
    return ^(NSString *title, UIControlState state){
        [wSelf setTitle:title forState:state];
        return wSelf;
    };
}
// 标题颜色：titleColor
- (ZMUIButton *(^)(UIColor *, UIControlState))titleColor {
    __weak typeof(self) wSelf = self;
    return ^(UIColor *titleColor, UIControlState state) {
        [wSelf setTitleColor:titleColor forState:state];
        return wSelf;
    };
}
// 标题字体：font
- (ZMUIButton *(^)(UIFont *))font {
    __weak typeof(self) wSelf = self;
    return ^(UIFont *font){
        [wSelf.titleLabel setFont:font];
        return wSelf;
    };
}
// 图片：image
- (ZMUIButton *(^)(UIImage *, UIControlState))image {
    __weak typeof(self) wSelf = self;
    return ^(UIImage *image, UIControlState state) {
        [wSelf setImage:image forState:state];
        return wSelf;
    };
}
// 背景图片：backgroundImage
- (ZMUIButton *(^)(UIImage *, UIControlState))bgImage {
    __weak typeof(self) wSelf = self;
    return ^(UIImage *bgImage, UIControlState state) {
        [wSelf setBackgroundImage:bgImage forState:state];
        return wSelf;
    };
}

//---添加方法：addTarget---
//1、action系统
- (ZMUIButton *(^)(id, SEL, UIControlEvents))click {
    __weak typeof(self) wSelf = self;
    return ^(id target, SEL action, UIControlEvents event) {
        [wSelf addTarget:target action:action forControlEvents:event];
        return wSelf;
    };
}
//2、actionBlock
- (ZMUIButton *(^)(BtnClick, UIControlEvents))clickAction {
    __weak typeof(self) wSelf = self;
    return ^(BtnClick clickBlock , UIControlEvents event) {
        [wSelf addTarget:self action:@selector(clickAction:) forControlEvents:event];
        self.btnClick = clickBlock;
        return wSelf;
    };
}


@end
