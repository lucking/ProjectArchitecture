//
//  NSObject+ZMWebAlertView.h
//  ZM_Web
//
//  Created by ZM on 2018/1/30.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (ZMWebAlertView)

// 警告框函数：alert
- (void)zm_AlertPanelMessage:(NSString *_Nullable)message 
               completionHandler:(void (^_Nonnull)(void))completionHandler 
                        animated:(BOOL )animated
                         superVC:(UIViewController *_Nonnull)superVC;

// 确认框函数：confirm
- (void)zm_ConfirmPanelMessage:(NSString *_Nullable)message 
                 completionHandler:(void (^_Nonnull)(BOOL))completionHandler
                          animated:(BOOL )animated
                           superVC:(UIViewController *_Nullable)superVC;

// 输入框函数：prompt
- (void)zm_TextInputPanelPrompt:(NSString *_Nonnull)prompt 
                        defaultText:(NSString *_Nullable)defaultText
                  completionHandler:(void (^_Nonnull)(NSString * _Nullable))completionHandler
                           animated:(BOOL )animated
                            superVC:(UIViewController *_Nonnull)superVC;
@end
