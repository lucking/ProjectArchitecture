//
//  UIApplication_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIApplication_VC.h"
#import "UIViewController+ZMAdd.h"

@interface UIApplication_VC ()

@end

@implementation UIApplication_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];

}

//例一：
- (void)case1 {
    //跳转到“About”(关于本机)页面 不可用
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=About"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        NSLog(@"can not open");
    }
}
//例二：
- (void)case2 {
    //iOS，利用URL Schemes跳转到设置wifi、蜂窝移动网络页面
    //一. 跳转到“设置”
    //>=iOS8.0可用
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

}
//例三：
- (void)case3 {
}
//例四：
- (void)case4 {
}
//例五：
- (void)case5 {
}
//例六：
- (void)case6 {
}
//例七：
- (void)case7 {
}
//例八：
- (void)case8 {
}
//例九：
- (void)case9 {
}

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) tag:i];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
