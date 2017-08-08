//
//  ZMProgressView.m
//  ZM_UIProgressView
//
//  Created by ZM on 16/3/21.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMProgressView.h"


@implementation ZMProgressView


- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		 // NSLog(@"---> progress = %f",self.progress);
	}
	return self;
}

/**
 *  进度条显示动画
 *
 *  @param newProgress 动画的结束值
 *  @param duration    动画执行的时间
 */
- (void)setProgress:(CGFloat)newProgress animateWithDuration:(NSTimeInterval)duration {

	NSTimeInterval timeInterval = duration/ 100;

	targetProgress = newProgress;
	
	timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector: @selector(starProgress:)
										   userInfo:nil repeats:YES] ;
	[timer fire] ;
}
/**
 *  每次增加 0.01，增加到1，需要100次
 */
- (void)starProgress:(id)objc {

	float progress = self.progress;

	if ( progress < targetProgress) {
		progress += 0.01f;
		[self setProgress:progress animated:YES];
	}else{
		[timer invalidate];
		timer = nil;
		// 结束后通知：怎样设计能够 Block 回调处理呢
		[[NSNotificationCenter defaultCenter] postNotificationName:@"FinishProgress" object:nil];

	}
}

@end
