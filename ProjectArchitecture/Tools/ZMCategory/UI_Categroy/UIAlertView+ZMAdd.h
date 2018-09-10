//
//  UIAlertView+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/28.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

// ============================"  AlertView  "==============================

#define     zm_AlertView(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


#define     zm_AlertViewDelegate(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


@interface UIAlertView (ZMAdd)

@end
