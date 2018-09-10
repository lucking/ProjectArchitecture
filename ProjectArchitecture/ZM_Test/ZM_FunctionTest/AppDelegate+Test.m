//
//  AppDelegate+Test.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "AppDelegate+Test.h"
#import <IQKeyboardManager/IQKeyboardManager.h> 
//#import <Reachability/Reachability.h>
//#import <notify.h>  //检测app锁屏 私有API 上线审核不过（禁用）
//#define NotificationLock    CFSTR("com.apple.springboard.lockcomplete")
//#define NotificationChange    CFSTR("com.apple.springboard.lockstate")
//#define NotificationPwdUI    CFSTR("com.apple.springboard.hasBlankedScreen")

@implementation AppDelegate (Test)


- (void)BaseSetting {  
    //改变启动画面停留的时间
    [NSThread sleepForTimeInterval:1.0];
    
}

#pragma mark - 配置键盘处理：IQKeyboardManager
- (void)configurationIQKeyboard {
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    manager.enable = YES;                               // 控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;           // 控制点击背景是否收起键盘
    // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    // manager.toolbarManageBehaviour = IQAutoToolbarBySubviews; 
    // manager.shouldShowToolbarPlaceholder = NO;           // 是否显示占位文字
    // manager.shouldToolbarUsesTextFieldTintColor = YES;   // 控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar = NO;                             // 控制是否显示键盘上的工具条
    manager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    manager.keyboardDistanceFromTextField = 60.0f;              // 输入框距离键盘的距离
}


@end
