//
//  ICarouselView.h
//  TDiPad
//
//  Created by ZM on 16/3/31.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "UIImageView+WebCache.h"


@interface ICarouselView : UIView<iCarouselDataSource, iCarouselDelegate>
{

}
@property (strong, nonatomic) iCarousel *carousel;
@property (nonatomic, assign) iCarouselType type;	// 类型设置

- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  View
 */
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) UIViewContentMode imageViewType;
@property (nonatomic, assign) CGSize imageViewSize; // viewSize

@property (nonatomic, assign) NSInteger index;
@property (strong, nonatomic) UIPageControl *pageControl;


/** 点击事件 会返回点击的index  和 数据数组 */
@property (nonatomic, copy) void (^clickAction)(NSInteger index, NSArray *dataArray);


@end
