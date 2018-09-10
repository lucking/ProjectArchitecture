//
//  Test_UIImageView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_UIImageView.h"
#import "UIImageView+ZMAdd.h"

@implementation Test_UIImageView

+ (Test_UIImageView *)shareSingleton {
    static Test_UIImageView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)test_UIImageView {
    
    UIImageView* testImgView = [UIImageView new];
    testImgView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    testImgView.contentMode   = UIViewContentModeScaleAspectFill; // 内容扩展填充固定方面。部分内容可能剪。
    testImgView.contentScaleFactor = 100;
}


@end
