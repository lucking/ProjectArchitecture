//
//  ZMBaseView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMBaseView.h"

@implementation ZMBaseView

- (instancetype)init {
    if ([super init]) {
        [self zm_configInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self zm_configInit];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

// 初始化配置
- (void)zm_configInit {
    
}


@end
