//
//  ZMProgressView.h
//  ZM_UIProgressView
//
//  Created by ZM on 16/3/21.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMProgressView;

typedef void (^ProgressFinish)(ZMProgressView *progress);

@interface ZMProgressView : UIProgressView
{
	CGFloat targetProgress;
	NSTimer *timer;
}
@property (nonatomic, copy) void (^GoBtnClickBlock)(UIButton *goBtn);

@property (nonatomic, strong) ProgressFinish completionBlock;


- (void)setProgress:(CGFloat)newProgress animateWithDuration:(NSTimeInterval)duration;
- (void)starProgress:(id)objc;


//- (void)setProgress:(CGFloat)newProgress animateWithDuration:(NSTimeInterval)duration finish:(void(^)(void))finish;
//- (void)starProgress:(ProgressFinish)finishBlock;




@end
