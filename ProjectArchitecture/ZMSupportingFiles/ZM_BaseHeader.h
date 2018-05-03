//
//  ZM_BaseHeader.h
//  VideoCamp
//
//  Created by ZM on 2018/1/18.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZM_BaseHeader_h
#define ZM_BaseHeader_h

// weakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

//------------------"  系统类型  "---------------
//获取当前系统的版本号
#define SystemVersion       [[[UIDevice currentDevice] systemVersion] floatValue]
// AppDelegate
#define ZM_APPDelegate      ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define APPDelegateWindow   (((AppDelegate*)[UIApplication sharedApplication].delegate).window)
// 懒加载
#define ZM_LAZY(object, assignment) (object = object ?: assignment)

//------------------"  手机尺寸类型  "---------------
//判断是否为：iPad 同：([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#define ZM_IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为：iPhone  同：([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#define ZM_IsiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为：ipod
#define ZM_IsiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断手机类型： 横、竖屏_皆可用
#define CurrentMode  [UIScreen instancesRespondToSelector:@selector(currentMode)]

#define ZM_isIPhone4 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 960),  [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone5 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone6 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone6p (CurrentMode ? CGSizeEqualToSize(CGSizeMake(1920, 1080),[[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhoneX (CurrentMode ? CGSizeEqualToSize(CGSizeMake(1125, 2436),[[UIScreen mainScreen] currentMode].size) : NO)

//判断手机类型： 竖屏可用
#define  IS_IPHONE45   (([[UIScreen mainScreen] bounds].size.width-320)?NO:YES)
#define  IS_IPHONE4    (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define  IS_IPHONE5    (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define  IS_IPHONE6    (([[UIScreen mainScreen] bounds].size.width-375)?NO:YES)
#define  IS_IPHONE6p   (([[UIScreen mainScreen] bounds].size.width-414)?NO:YES)
#define  IS_IPHONEX    (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)

//----------------------"  尺寸  "-------------------
// 全屏宽度、高度
#define SSWIDTH     ([UIScreen mainScreen].bounds.size.width)
#define SSHEIGHT    ([UIScreen mainScreen].bounds.size.height)
#define NavHeight       64
#define SSVCHeight      (SSHEIGHT-64)

//去掉 navBar tabBar 的高度
#ifdef IS_IPHONEX
#define SSPureHeight    (SSHEIGHT-64-49)
#else
#define SSPureHeight    (SSHEIGHT-64-83)
#endif

#define zmStatusBarHeight    (ZM_IsiPhoneX ? (44):(20))
#define zmNavHeight          (zmStatusBarHeight + 44)

// IS_IPHONEX 
#define StatusBarHeight     30
#define SafeAreaBottom      34
#define IPhoneXMainHeight       (SSHEIGHT-49-30-34)
#define IPhoneXSafeAreaHeight   (SSHEIGHT-88-34)

//-----控件比例-----
//屏幕自动适配 以5为基准， 4／5一样，6及以上除以5的宽高 ( 判断是不是4s如果是则高度和5s一样的比例 )
#define GetWidth(width)   (ZM_isIPhone4 || ZM_IsiPhone5 ? (width)  : ((width) *SSWIDTH/320))
#define GetHeight(height) (ZM_isIPhone4 || ZM_IsiPhone5 ? (height) : ((height)*SSHEIGHT/568))


//------------------------"  UIImage  "---------------------
#define  IMG(imageName)  [UIImage imageNamed:imageName]


//------------------------"  UIColor  "---------------------
#define UIColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
#define UIColorRGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
// 十六进制颜色
#define Color_With_Hex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
//调用：UIColor *redColor = Color_With_Hex(0xe4e5e5);

#define     Clear_COLOR         [UIColor clearColor]    // 透明色
#define     White_COLOR         [UIColor whiteColor]    // 白色
#define     Black_COLOR         [UIColor blackColor]    // 黑色
#define     Gray_COLOR          [UIColor grayColor]     // 灰色
// 导航栏
#define     NavBg_COLOR1        UIColorRGB(255,120,2)
#define     NavBg_COLOR         UIColorRGB(33,150,243)
//TabBar按钮
#define Color_normal     UIColorRGB(149,149,149) //默认：标题颜色
#define Color_select     UIColorRGB(255,152,0)   //选中：标题颜色
#define Color_tabBar     UIColorRGB(239,239,239) //tabBar颜色

//---------------------"  灰色、字体颜色  "-------------------
//背景：淡灰色
#define  BgColor            UIColorRGB(238,243,249)
#define  BgLightColor       UIColorRGB(250,250,250)
#define  BgGrayColor        UIColorRGB(240,240,240)
//标题字
#define  Gray_222222        UIColorRGB(34,34,34)
#define  Gray_333333        UIColorRGB(51,51,51)
#define  Gray_444444        UIColorRGB(68,68,68)
//突出字
#define  Gray_555555        UIColorRGB(85,85,85)
#define  Gray_666666        UIColorRGB(102,102,102)
//
#define  Gray_777777        UIColorRGB(119,119,119)
#define  Gray_888888        UIColorRGB(136,136,136)
#define  Gray_999999        UIColorRGB(153,153,153)
#define  Gray_808080        UIColorRGB(128,128,128)
#define  Gray_909090        UIColorRGB(144,144,144)
#define  Gray_AAAAAA        UIColorRGB(170,170,170)
#define  Gray_BBBBBB        UIColorRGB(187,187,187) 
#define  Gray_CCCCCC        UIColorRGB(204,204,204) //线条淡灰
#define  Gray_DDDDDD        UIColorRGB(221,221,221) //线条常用
#define  Gray_EEEEEE        UIColorRGB(238,238,238) //浅灰


//7.2设置 view 圆角和边框
#define RRadiusBorderView(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


//7.1设置 view 圆角
#define RRadiusView(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\


// 设置随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]



//NSLog 分割线    //使用  NSLog(@"----->:%@",message);
#define NSLogline(format, ...) do {      \
fprintf(stderr,  "<%s : %d> %s\n" ,  \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                                   \
fprintf(stderr,  " -------------------------------完美分割线---------------------------------- \n  \n " );          \
} while ( 0 )


// 我推荐用这个打印我们的日志: 功能、行数
#ifdef DEBUG
#define NSLogLINE(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLogLINE(...)
#endif

// 可以输出 纯净的内容：NSLog去掉时间戳及其他输出样式
#ifdef DEBUG
#define NNSLog(FORMAT, ...) fprintf(stderr," %s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NNSLog(...)
#endif


//生产环境是使用：不用时可注释掉
// debug下打印，release下不打印
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


#endif /* ZM_BaseHeader_h */
