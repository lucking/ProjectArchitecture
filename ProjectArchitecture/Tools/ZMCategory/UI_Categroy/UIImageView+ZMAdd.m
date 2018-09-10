//
//  UIImageView+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIImageView+ZMAdd.h"

#import "UIImage+ZMAdd.h"
#import "UIImageView+WebCache.h"
#import "YYWebImage.h"

@implementation UIImageView (ZMAdd)
@dynamic imgName;

- (void)testUse {

	self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
	self.layer.cornerRadius = 5;
	self.layer.masksToBounds= YES;
	self.clipsToBounds = YES;
	self.contentMode   = UIViewContentModeScaleAspectFill; // 内容扩展填充固定方面。部分内容可能剪。
	self.contentScaleFactor = 100;
}



- (void)zm_animationImageViewDuration:(NSTimeInterval)duration animationType:(CATransitionAnimationType)animationType {

	CATransition *tranAn = [CATransition animation];
	tranAn.duration = duration;
	if (animationType == TransitionModeCube ) {					tranAn.type = @"cube";}
	else if (animationType == TransitionModeSuckEffect)			tranAn.type = @"suckEffect";
	else if (animationType == TransitionModeRippleEffect)		tranAn.type = @"suckEffect"; // 水波抖动
	else if (animationType == TransitionModePageCurl)			tranAn.type = @"pageCurl";
	else if (animationType == TransitionModePageUnCurl)			tranAn.type = @"pageUnCurl";
	else if (animationType == TransitionModeOglFlip)				tranAn.type = @"oglFlip";
	else if (animationType == TransitionModeCameraIrisHollowOpen)	tranAn.type = @"cameraIrisHollowOpen";
	else if (animationType == TransitionModeCameraIrisHollowClose)	tranAn.type = @"cameraIrisHollowClose";
	// 以下API效果请慎用
	else if (animationType == TransitionModeSpewEffect)		        tranAn.type = @"spewEffect";
	else if (animationType == TransitionModeGenieEffect)			tranAn.type = @"genieEffect";
	else if (animationType == TransitionModeUnGenieEffect)			tranAn.type = @"unGenieEffect";
	else if (animationType == TransitionModeTwist)					tranAn.type = @"twist";
	else if (animationType == TransitionModeTubey)					tranAn.type = @"tubey";
	else if (animationType == TransitionModeSwirl)					tranAn.type = @"swirl";
	else if (animationType == TransitionModeCharminUltra)			tranAn.type = @"charminUltra";
	else if (animationType == TransitionModeZoomyIn)				tranAn.type = @"zoomyIn";
	else if (animationType == TransitionModeZoomyOut)				tranAn.type = @"zoomyOut";
	else if (animationType == TransitionModeOglApplicationSuspend)	tranAn.type = @"oglApplicationSuspend";

	[self.layer addAnimation:tranAn forKey:nil];
}


- (void)setImgName:(NSString *)imgName {

	//NSLog(@"---> imgName = %@",imgName);
//    if ([imgName hasPrefix:@"http"]) {
//        [self sd_setImageWithURL:[NSURL URLWithString:imgName] placeholderImage:[UIImage imageNamed:@"placeholderImg"]];
//    }else {
//        self.image = [UIImage imageNamed:imgName];
//    }
    
	if ([imgName hasPrefix:@"http"] | [imgName hasPrefix:@"https"]) {

		[self yy_setImageWithURL:[NSURL URLWithString:imgName]
					 placeholder:[UIImage imageNamed:@"placeholderImg"]
						 options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity |YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {

						 }transform:nil completion:^(UIImage *image, NSURL *url,YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
						 }];
//        //方式一：
//        [self yy_setImageWithURL:[NSURL URLWithString:imgName] options:YYWebImageOptionProgressive];
//        //方式二：
//        [self yy_setImageWithURL:[NSURL URLWithString:imgName]
//                     placeholder:[UIImage imageNamed:@"placeholderImg"]];
//        //方式三：
//        [self yy_setImageWithURL:[NSURL URLWithString:imgName]
//                     placeholder:[UIImage imageNamed:@"placeholderImg"]
//                         options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity |YYWebImageOptionSetImageWithFadeAnimation
//                      completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
//            
//        }];
        
	}else{
		self.image = [UIImage zm_compressPngImageName:imgName];
	}
}


@end
