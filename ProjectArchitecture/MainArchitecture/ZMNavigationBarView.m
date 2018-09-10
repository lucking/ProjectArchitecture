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
    self.frame = CGRectMake(0, 0, SSWIDTH, ZM_NavBarHeight);
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
        make.height.equalTo(@(ZM_NavBarStatusHeight));
    }];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(statusBarView.mas_bottom);
        make.left.right.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleView);
        make.left.equalTo(titleView).mas_offset(0);
        make.width.equalTo(@(60));
        make.height.equalTo(@(44));
    }];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView);
        make.centerY.equalTo(titleView);
        make.top.bottom.equalTo(titleView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    // 赋值 
    [backButton setImage:[UIImage imageNamed:@"arrow_left_g1"] forState:UIControlStateNormal]; //backWhite52px
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [backButton addTarget:self action:@selector(zm_backClick) forControlEvents:UIControlEventTouchUpInside];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    backButton.hidden   = YES;

    self.statusBarView  = statusBarView;
    self.titleView      = titleView;
    self.backButton     = backButton;
    self.titleLab       = titleLab;
    self.backgroundColor = Gray_DDDDDD;
    //statusBarView.backgroundColor = [UIColor yellowColor];
}

- (void)rightItemTitle:(NSString *)title font:(CGFloat)font imgName:(NSString *)imgName {
    
    UIButton *rightItem = [[UIButton alloc] init];
    [rightItem setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [rightItem setTitle:title forState:UIControlStateNormal];
    [rightItem.titleLabel setFont:[UIFont systemFontOfSize:font]];
    [rightItem addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:rightItem];
    
    [rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView);
        make.right.equalTo(self.titleView).mas_offset(-10);
        make.width.equalTo(@(40));
        make.height.equalTo(@(44));
    }];
}
- (void)rightItemClick {
    if (self.rightItemBlock) {
        self.rightItemBlock();  
    }
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
    //代理响应
    if ([self.delegate respondsToSelector:@selector(zmNavBarView:originalBack:)]) {
        [self.delegate zmNavBarView:self originalBack:self.originalBack];
    }
}

// 测试  
- (void)test {
    self.titleLab.text = @"我的标题";
    self.statusBarView.backgroundColor = [UIColor yellowColor];
    self.titleView.backgroundColor     = [UIColor blueColor];
    self.backButton.backgroundColor    = [UIColor orangeColor];
    self.titleLab.backgroundColor      = [UIColor lightGrayColor];    
}

@end
