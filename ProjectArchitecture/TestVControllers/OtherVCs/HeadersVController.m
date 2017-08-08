//
//  HeadersVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/20.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "HeadersVController.h"

//7.2设置 view 圆角和边框
#define RRadiusBorderView(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


//7.1设置 view 圆角
#define RRadiusView(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

// 设置随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


@interface HeadersVController ()

@end

@implementation HeadersVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HeadersVC";
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];

    [self case1];

}


- (void)case1 {
    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 120, 250, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"hello,girl";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    RRadiusView(label, 10);
    RRadiusBorderView(label, 10, 1, Blue_2599FA);
    label.backgroundColor = RandomColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
