//
//  NSObject+ZMWebAlertView.m
//  ZM_Web
//
//  Created by ZM on 2018/1/30.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "NSObject+ZMWebAlertView.h"

@implementation NSObject (ZMWebAlertView)


// 警告框函数：alert
- (void)zm_AlertPanelMessage:(NSString *)message 
               completionHandler:(void (^)(void))completionHandler 
                        animated:(BOOL )animated
                         superVC:(UIViewController *)superVC 
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    if (superVC==nil) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
    }else{
        [superVC presentViewController:alertVC animated:animated completion:nil];
    }
}


// 确认框函数：confirm
- (void)zm_ConfirmPanelMessage:(NSString *)message 
                 completionHandler:(void (^)(BOOL))completionHandler
                          animated:(BOOL )animated
                           superVC:(UIViewController *)superVC 
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertVC addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    if (superVC==nil) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
    }else{
        [superVC presentViewController:alertVC animated:YES completion:nil];
    }    
}


// 输入框函数：prompt
- (void)zm_TextInputPanelPrompt:(NSString *)prompt 
                        defaultText:(NSString *)defaultText
                  completionHandler:(void (^)(NSString * _Nullable))completionHandler
                           animated:(BOOL )animated
                            superVC:(UIViewController *)superVC 
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertVC addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertVC.textFields[0].text?:@"");
    }])];
    if (superVC==nil) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [window.rootViewController presentViewController:alertVC animated:animated completion:nil];
    }else{
        [superVC presentViewController:alertVC animated:YES completion:nil];
    }  
}





@end
