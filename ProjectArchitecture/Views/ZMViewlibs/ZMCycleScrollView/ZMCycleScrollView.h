//
//  ZMCycleScrollView.h
//  MyADScrollView
//
//  Created by ZM on 15/4/30.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZMCycleScrollViewDelegate;
@protocol ZMCycleScrollViewDatasource;

@interface ZMCycleScrollView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
    //    id<XLCycleScrollViewDelegate> _delegate;
    //    id<XLCycleScrollViewDatasource> _datasource;
    
    NSInteger _totalPages;
    int _curPage;
    NSMutableArray *_curViews;
}

@property (nonatomic,readonly) UIScrollView *scrollView;
@property (nonatomic,readonly) UIPageControl *pageControl;
@property (nonatomic,assign) int currentPage;
@property (nonatomic,assign,setter= setDataource:)id<ZMCycleScrollViewDatasource> datasource;
@property (nonatomic,assign,setter= setDelegate:) id<ZMCycleScrollViewDelegate> delegate;

- (void)reloadData;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;
- (id)initWithFrame:(CGRect)frame  animationDuration:(NSTimeInterval)animationDuration;
@end

@protocol ZMCycleScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(ZMCycleScrollView *)csView atIndex:(long)index;

@end

@protocol ZMCycleScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfPages;
- (UIView *)pageAtIndex:(int)index;

@end







