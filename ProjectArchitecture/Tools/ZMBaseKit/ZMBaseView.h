//
//  ZMBaseView.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMBaseView : UIView

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)drawRect:(CGRect)rect;

// 初始化配置
- (void)zm_configInit;

@end
