//
//  UIAlertView_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIAlertView_VC.h"

@interface UIAlertView_VC ()

@end

@implementation UIAlertView_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];
    
}

//例一：
- (void)case1 {

}
//例二：
- (void)case2 {
    
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
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) Tag:i];
    }
    
}

@end
