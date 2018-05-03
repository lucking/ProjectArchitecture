//
//  ZMNavigationBarView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/23.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMNavigationBarView.h"
#import <Masonry.h>

@interface ZMNavigationBarView()

@end


@implementation ZMNavigationBarView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInit];
    }
    return self;
}

#pragma mark -----------"  private  "------------

// 初始化配置
- (void)configInit {  
    self.frame = CGRectMake(0, 0, SSWIDTH, zmNavHeight);
    self.backgroundColor = Gray_CCCCCC;
    UIView *statusBarView   = [[UIView alloc] init];
    UIView *titleView       = [[UIView alloc] init];
    UIButton *backButton    = [[UIButton alloc] init];
    UILabel *titleLab       = [[UILabel alloc] init];

    [self addSubview:statusBarView];
    [self addSubview:titleView];
    [titleView addSubview:backButton];
    [titleView addSubview:titleLab];
    
    [statusBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(zmStatusBarHeight));
    }];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(statusBarView.mas_bottom);
        make.left.right.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleView);
        make.left.equalTo(titleView).mas_offset(0);
        make.width.equalTo(@(60));
        // make.height.equalTo(titleView.mas_height);
        // make.top.bottom.equalTo(titleView);
        make.height.equalTo(@(44));
    }];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView);
        make.centerY.equalTo(titleView);
        make.top.bottom.equalTo(titleView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    // 赋值 
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [backButton setImage:[UIImage imageNamed:@"backWhite52px"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"backBlack1"] forState:UIControlStateHighlighted];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [backButton addTarget:self action:@selector(zm_backClick) forControlEvents:UIControlEventTouchUpInside];

    self.statusBarView  = statusBarView;
    self.titleView      = titleView;
    self.backButton     = backButton;
    self.titleLab       = titleLab;
    // 测试 
    self.titleLab.text = @"我的标题";
//    self.statusBarView.backgroundColor = [UIColor yellowColor];
//    self.titleView.backgroundColor     = [UIColor blueColor];
//    self.backButton.backgroundColor    = [UIColor orangeColor];
//    self.titleLab.backgroundColor      = [UIColor lightGrayColor];    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}
//返回事件
-(void)zm_backClick
{
    if (self.zmBackBlock) {
        self.zmBackBlock();
    }
}


@end
