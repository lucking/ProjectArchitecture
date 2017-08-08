//
//  ZMCarouselView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMCarouselView : UIView

/** 自动滚动间隔时间,默认0.1s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 图片圆角大小 */
@property (nonatomic, assign) CGFloat cornerRadius;

/** 占位图 */
@property (nonatomic, copy) NSString *placeholder;

/** 监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);

/** 监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);
/**  url string 信号 */
@property (strong, nonatomic) RACSignal *imageURLSignal;


//2017.5.23 添加
- (void)startAnimation;
- (void)stopAnimation;

@end
