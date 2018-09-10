//
//  ZMUIView.h
//  ZM_OC_建造者模式
//
//  Created by ZM on 2018/8/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class ZMUIView;
//typedef ZMUIView *(^UIViewBlock)(UIView *);
//typedef ZMUIView *(^BackgroundColorBlock)(UIColor *);
//typedef ZMUIView *(^FrameBlock)(CGRect);

@interface ZMUIView : UIView

//@property (nonatomic, copy) UIViewBlock addSubview;
//@property (nonatomic, copy) BackgroundColorBlock bbackgroundColor;
//@property (nonatomic, copy) FrameBlock fframe;
//同上
@property (nonatomic, copy) ZMUIView *(^addSubview)(UIView *) ;
@property (nonatomic, copy) ZMUIView *(^bbackgroundColor)(UIColor *) ;
@property (nonatomic, copy) ZMUIView *(^fframe)(CGRect) ;

@end
