//
//  ZMUIView.m
//  ZM_OC_建造者模式
//
//  Created by ZM on 2018/8/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMUIView.h"

@implementation ZMUIView

#pragma mark ======================"  setter getter  "==============================

//// 添加到父视图
//- (UIViewBlock)addSubview {
//    __weak typeof(self) wSelf = self;
//    return ^(UIView *superView){
//        [superView addSubview:wSelf];
//        return wSelf;
//    };
//}
//// 背景颜色
//- (BackgroundColorBlock)bbackgroundColor {
//    __weak typeof(self) wSelf = self;
//    return ^(UIColor *backgroundColor){
//        [wSelf setBackgroundColor:backgroundColor];
//        return wSelf;
//    };
//}
//// 大小
//- (FrameBlock)fframe {
//    __weak typeof(self) wSelf = self;
//    return ^(CGRect frame){ wSelf.frame = frame;
//        return wSelf;
//    };
//}



/*
 * 同上：可以继续添加属性
 */
// 添加到父视图
- (ZMUIView *(^)(UIView *))addSubview
{
    __weak typeof(self) wSelf = self;
    return ^(UIView *superView){
        [superView addSubview:wSelf];
        return wSelf;
    };
}
// 背景颜色
- (ZMUIView *(^)(UIColor *))bbackgroundColor
{
    __weak typeof(self) wSelf = self;
    return ^(UIColor *backgroundColor){
        wSelf.backgroundColor = backgroundColor;
        return wSelf;
    };
}
// 大小
- (ZMUIView *(^)(CGRect))fframe
{
    __weak typeof(self) wSelf = self;
    return ^(CGRect frame){
        wSelf.frame = frame;        
        return wSelf;
    };
}






@end
