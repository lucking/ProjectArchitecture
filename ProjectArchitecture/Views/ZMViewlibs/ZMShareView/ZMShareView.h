//
//  ShareView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ShareBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);


@interface ZMShareView : UIView

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, copy) ShareBlock shareBlock;

/**
 配置UI
 */
- (void)zm_configUIOfBottomHeight:(CGFloat)bottomHeight;

- (void)setTitleArray:(NSArray *)titleArray imgArray:(NSArray *)imgArray;
//展示
- (void)showView;
//隐藏
- (void)hiddenView;
//移除
- (void)removeView;

@end
