//
//  UIImageView+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  图片动画类型
 */
typedef NS_ENUM(NSInteger,CATransitionAnimationType) {
	TransitionModeCube					=1,	//方块
	TransitionModeSuckEffect			=2, //三角
	TransitionModeRippleEffect			=3, //水波抖动
	TransitionModePageCurl				=4, //上翻页
	TransitionModePageUnCurl			=5, //下翻页
	TransitionModeOglFlip				=6, //上下翻转
	TransitionModeCameraIrisHollowOpen	=7, //镜头快门开
	TransitionModeCameraIrisHollowClose	=8, //镜头快门关

	// 以下API效果请慎用
	TransitionModeSpewEffect			=9,  // 新版面在屏幕下方中间位置被释放出来覆盖旧版面
	TransitionModeGenieEffect			=10, // 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
	TransitionModeUnGenieEffect			=11, // 新版面在屏幕左下方或右下方被释放出来覆盖旧版面
	TransitionModeTwist					=12, // 版面以水平方向像龙卷风式转出来
	TransitionModeTubey					=13, // 版面垂直附有弹性的转出来
	TransitionModeSwirl					=14, // 旧版面360度旋转并淡出, 显示出新版面
	TransitionModeCharminUltra			=15, // 旧版面淡出并显示新版面
	TransitionModeZoomyIn				=16, // 新版面由小放大走到前面, 旧版面放大由前面消失
	TransitionModeZoomyOut				=17, // 新版面屏幕外面缩放出现, 旧版面缩小消失
	TransitionModeOglApplicationSuspend	=18  // 像按”home” 按钮的效果
};


@interface UIImageView (ZMAdd)

@property (nonatomic, copy) NSString* imgName;

// 图片动画
- (void)zm_animationImageViewDuration:(NSTimeInterval)duration animationType:(CATransitionAnimationType)animationType;


@end

