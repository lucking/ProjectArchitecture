//
//  TestVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/8/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestVController.h"

@interface TestVController ()

@end

@implementation TestVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = White_COLOR;
    //    self.navigationItem.titleView.backgroundColor = [UIColor purpleColor];
    //    self.title = @" ";

    //自定义：titleView
    [self nav_titleView];
}

//http://blog.csdn.net/u010212550/article/details/51547259
- (void)nav_titleView {
    
    CGFloat ScreenWidth= [UIScreen mainScreen].bounds.size.width;
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;  //设置titleview，不过这个view并不是我们需要的居中的view；
    
    __weak typeof(self) WSelf = self;
    //主线程列队一个block， 这样做 可以获取到autolayout布局后的frame，也就是titleview的frame。在viewDidLayoutSubviews中同样可以获取到布局后的坐标
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //设置居中的view
        CGFloat ScreenWidth= [UIScreen mainScreen].bounds.size.width;
        CGFloat width = 120; //要居中view的宽度
        UIView *centerView = [[UIView alloc]init];
        centerView.backgroundColor = [UIColor greenColor];
        centerView.frame = CGRectMake(ScreenWidth/2, 20, width, 44);//设置一个基于window居中的坐标
        //坐标系转换到titleview
        centerView.frame = [WSelf.view.window convertRect:centerView.frame
                                                   toView:WSelf.navigationItem.titleView];
        [WSelf.navigationItem.titleView addSubview:centerView]; //centerview添加到titleview
    });
    
}




@end
