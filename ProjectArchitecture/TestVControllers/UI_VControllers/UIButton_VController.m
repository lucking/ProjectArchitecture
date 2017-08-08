//
//  UIButton_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIButton_VController.h"

@interface UIButton_VController ()

@end

@implementation UIButton_VController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    
    
}



@end
