//
//  ZMWebProgressLayer.h
//  ZM_WebProgressView
//
//  Created by ZM on 2017/10/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ZMWebProgressLayer : CAShapeLayer

//+ (instancetype)layerWithFrame:(CGRect)frame;

- (void)finishedLoad;
- (void)startLoad;
- (void)closeTimer;


@end
