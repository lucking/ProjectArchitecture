//
//  BBTestVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "BBTestVController.h"

@interface BBTestVController ()

@end

@implementation BBTestVController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"TestVC";
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    

}


- (void)case1 {
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 300)];
    textView.text = @"Hello textView";
    [self.view addSubview:textView];
    
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 300) textContainer:textContainer];

    //textView.textContainer = textContainer;
        
}

@end
