//
//  ZMNavigationBarView.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/23.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 * #warning 请用<Masonry.h>更新 或 更改布局
 */

@interface ZMNavigationBarView : UIView

@property (nonatomic,weak) UIView *statusBarView;
@property (nonatomic,weak) UIView *titleView;
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UIButton *backButton;

@property (nonatomic,copy) void (^zmBackBlock)(void);
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *backImg;


@end
