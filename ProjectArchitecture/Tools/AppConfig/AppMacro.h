//
//  AppMacro.h
//  TDiPad
//
//  Created by ZM on 16/4/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


//获取当前系统的版本号
#define FLOATVALUE [[[UIDevice currentDevice] systemVersion] floatValue]
//------------------"  手机尺寸类型  "---------------
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//#define IS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])


//判断手机类型： 横、竖屏_皆可用
#define CurrentMode  [UIScreen instancesRespondToSelector:@selector(currentMode)]

#define iPhone4 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 960),  [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6p (CurrentMode ? CGSizeEqualToSize(CGSizeMake(1920, 1080),[[UIScreen mainScreen] currentMode].size) : NO)

//判断手机类型： 竖屏可用（默认的）
#define  IS_IPHONE45   (([[UIScreen mainScreen] bounds].size.width-320)?NO:YES)
#define  IS_IPHONE4    (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define  IS_IPHONE5    (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define  IS_IPHONE6    (([[UIScreen mainScreen] bounds].size.width-375)?NO:YES)
#define  IS_IPHONE6p   (([[UIScreen mainScreen] bounds].size.width-414)?NO:YES)









#endif /* AppMacro_h */
