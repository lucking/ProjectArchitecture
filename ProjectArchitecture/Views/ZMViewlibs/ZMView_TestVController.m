//
//  ZMView_TestVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/9/10.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMView_TestVController.h"
#import "ZMUIButton.h"

@interface ZMView_TestVController ()

@end

@implementation ZMView_TestVController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)demo0_test {
    
    //----- 实现链式编程 -----
    //基本使用：测试
    ZMUIButton *Btn0 = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 50, 180, 36)];
    Btn0.addSubview(self.view);
    Btn0.bgColor([UIColor yellowColor]);
    Btn0.title(@"基本使用", UIControlStateNormal);
    Btn0.titleColor([UIColor blackColor], UIControlStateNormal);
    Btn0.font([UIFont systemFontOfSize:18]);
    Btn0.clickAction(^(UIButton *btn) {
        NSLog(@"---ZMUIButton actionBlock0 ");
        
    }, UIControlEventTouchUpInside);
    
    //方法一：添加系统方法（绑定事件 ）
    ZMUIButton *Btn = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 120, 100, 50)];
    [Btn.addSubview(self.view)
     .bgColor([UIColor yellowColor])
     .title(@"111", UIControlStateNormal)
     .titleColor([UIColor blueColor], UIControlStateNormal)
     .font([UIFont systemFontOfSize:18])
     addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //方法二：添加Block方法（绑定事件 ）
    ZMUIButton *Btn2 = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 200, 180, 100)];
    [Btn2.addSubview(self.view)
     .bgColor([UIColor yellowColor])
     addClickAction:^(UIButton *btn) {
         NSLog(@"---ZMUIButton clickAction2 ");
         
     } forEvents:UIControlEventTouchUpInside]
    .title(@" AAAAA", UIControlStateNormal)
    .titleColor([UIColor redColor], UIControlStateNormal)
    .font([UIFont systemFontOfSize:20])
    .image([UIImage imageNamed:@"locate4"], UIControlStateNormal)
    .bgImage([UIImage imageNamed:@"scene9.jpg"], UIControlStateNormal);
    
    
    //方法三：添加属性_系统方法（绑定事件 ）
    //1、action系统
    ZMUIButton *Btn3 = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 360, 180, 50)];
    Btn3.addSubview(self.view)
    .bgColor([UIColor yellowColor])
    .title(@"333", UIControlStateNormal)
    .titleColor([UIColor blackColor], UIControlStateNormal)
    .font([UIFont systemFontOfSize:18])
    .click(self, @selector(btnClick3), UIControlEventTouchUpInside);
    
    //方法三：添加属性_Block方法（绑定事件 ）
    //2、actionBlock
    ZMUIButton *Btn4 = [[ZMUIButton alloc] initWithFrame:CGRectMake(60, 430, 180, 50)];
    Btn4.addSubview(self.view)
    .bgColor([UIColor yellowColor])
    .title(@"444", UIControlStateNormal)
    .titleColor([UIColor blackColor], UIControlStateNormal)
    .font([UIFont systemFontOfSize:18])
    .clickAction(^(UIButton *btn) {
        NSLog(@"---ZMUIButton actionBlock4 ");
        
    }, UIControlEventTouchUpInside);
    
}

- (void)btnClick {
    NSLog(@"---ZMUIButton btnClick1 ");
}
- (void)btnClick3 {
    NSLog(@"---ZMUIButton btnClick3 ");
}

@end
