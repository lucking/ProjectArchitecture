//
//  UIButtonHandler.h
//  ZM_Block
//
//  Created by ZM on 2017/5/2.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BtnClick) (UIButton *btn);

@interface ZMUIButton : UIButton

@property (nonatomic, copy) void (^btnClick) (UIButton *btn) ;

@property (nonatomic, copy) ZMUIButton *(^addSubview)(UIView *superView) ;
@property (nonatomic, copy) ZMUIButton *(^bgColor)(UIColor *backgroundColor) ;
@property (nonatomic, copy) ZMUIButton *(^title)(NSString *title, UIControlState state) ;
@property (nonatomic, copy) ZMUIButton *(^titleColor)(UIColor *titleColor, UIControlState state) ;
@property (nonatomic, copy) ZMUIButton *(^font)(UIFont *font) ;
@property (nonatomic, copy) ZMUIButton *(^image)(UIImage *image, UIControlState state) ;
@property (nonatomic, copy) ZMUIButton *(^bgImage)(UIImage *bgImage, UIControlState state) ;
//添加方法：addTarget
//1、action系统
@property (nonatomic, copy) ZMUIButton *(^click) (id target, SEL action, UIControlEvents events);
//2、actionBlock
@property (nonatomic, copy) ZMUIButton *(^clickAction) (BtnClick clickBlock, UIControlEvents events);


//[self addTarget:self action:@selector(BtnClick2:) forControlEvents:event];
//- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (ZMUIButton *)addClickAction:(BtnClick)clickAction forEvents:(UIControlEvents)event;

//- (ZMUIButton *)addTarget:(nullable id)target clickAction:(BtnClick)clickAction forEvents:(UIControlEvents)event;

@end
