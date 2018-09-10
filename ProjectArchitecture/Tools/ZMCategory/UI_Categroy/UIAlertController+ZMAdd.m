//
//  UIAlertController+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/28.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIAlertController+ZMAdd.h"

#define keyWindowRootVC  [UIApplication sharedApplication].keyWindow.rootViewController


@implementation UIAlertController (ZMAdd)

+ (void)zm_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message: message
                                                            preferredStyle: preferredStyle];
    UIAlertAction *cancelAction= [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [keyWindowRootVC presentViewController:alert animated:YES completion:nil];
}

@end
