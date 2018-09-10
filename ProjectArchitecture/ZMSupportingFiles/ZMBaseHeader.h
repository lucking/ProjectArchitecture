//
//  ZMBaseHeader.h
//  VideoCamp
//
//  Created by ZM on 2018/1/18.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZM_BaseHeader_h
#define ZM_BaseHeader_h

// weakSelf
#define zmWS(weakSf)  __weak __typeof(&*self)weakSf = self
// 懒加载
#define ZM_LAZY(object, assignment) (object = object ?: assignment)

//------------------"  系统类型  "---------------
//获取当前系统的版本号
#define SystemVersion       [[[UIDevice currentDevice] systemVersion] floatValue]
// AppDelegate
#define ZM_APPDelegate          ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define ZM_APPDelegateWindow    ([UIApplication sharedApplication].windows)

//------------------"  手机尺寸类型  "---------------
//是否为：iPad 
#define ZM_IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//是否为：iPhone  
#define ZM_IsiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//是否为：ipod
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

#define IPhoneXStatusBarHeight  (ZM_IsiPhoneX ? (44):(20))
#define IPhoneXNavHeight        (IPhoneXStatusBarHeight + 44)

//IS_IPHONEX 实际适配的
#define ZM_IPhoneXStatusBarHeight   30.f
#define ZM_IPhoneXNavHeight         (64.f + 10.f)
#define SS_NavBarHeight             (IS_IPHONEX ? 88.f : 64.f)
#define SS_TabBarHeight             (IS_IPHONEX ? 83.f : 49.f)
#define SS_TabBarStatusHeight       (IS_IPHONEX ? 34.f : 0.f)
//自己的适配
#define ZM_NavBarStatusHeight       (IS_IPHONEX ? 30.f : 20.f)
#define ZM_NavBarHeight             (IS_IPHONEX ? 74.f : 64.f)
#define ZM_NavTitleViewHeight       44.f
#define ZM_SafeAreaBottom           34.f
#define ZM_TabBarHeight             (IS_IPHONEX ? 69.f : 49.f)
#define ZM_TabBarStatusHeight       (IS_IPHONEX ? 20.f : 0.f)


//-----控件比例-----
//屏幕自动适配 以5为基准， 4／5一样，6及以上除以5的宽高 ( 判断是不是4s如果是则高度和5s一样的比例 )
#define GetWidth(width)   (ZM_isIPhone4 || ZM_IsiPhone5 ? (width)  : ((width) *SSWIDTH/320))
#define GetHeight(height) (ZM_isIPhone4 || ZM_IsiPhone5 ? (height) : ((height)*SSHEIGHT/568))

//------------------------"  UIColor、UIImage "---------------------

#define  IMG(imageName)  [UIImage imageNamed:imageName]

// 设置随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 具体颜色
#define CColorRGB(r,g,b)      [UIColor colorWithRed:r green:g blue:b alpha:1.00]
#define CColorRGBA(r,g,b,a)   [UIColor colorWithRed:r green:g blue:b alpha:a]
#define UIColorRGB(r,g,b)     [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
#define UIColorRGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
// 十六进制颜色
#define ColorHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define     Clear_COLOR         [UIColor clearColor]    // 透明色
#define     White_COLOR         [UIColor whiteColor]    // 白色
#define     Black_COLOR         [UIColor blackColor]    // 黑色
#define     Gray_COLOR          [UIColor grayColor]     // 灰色
// 导航栏
#define     NavBg_COLOR1        UIColorRGB(255,120,2)
#define     NavBg_COLOR         UIColorRGB(33,150,243)
//TabBar按钮
#define Color_normal     ColorHex(0x7A7D83)   //默认：标题颜色
#define Color_select     ColorHex(0xF64D63)   //选中：标题颜色
#define Color_tabBar     ColorHex(0xF9F9F9)   //tabBar颜色

//---------------------"  灰色、字体颜色  "-------------------
//背景：淡灰色
#define  BgColor            UIColorRGB(238,243,249)
#define  BgLightColor       UIColorRGB(250,250,250)
#define  BgGrayColor        UIColorRGB(240,240,240)
#define  BgColorA           UIColorRGB(245,245,249)
//标题字
#define  Gray_111111        UIColorRGB(17,17,17)
#define  Gray_222222        UIColorRGB(34,34,34)
#define  Gray_333333        UIColorRGB(51,51,51)
#define  Gray_444444        UIColorRGB(68,68,68)
#define  Gray_555555        UIColorRGB(85,85,85)
#define  Gray_666666        UIColorRGB(102,102,102)
#define  Gray_777777        UIColorRGB(119,119,119)
#define  Gray_888888        UIColorRGB(136,136,136)
#define  Gray_999999        UIColorRGB(153,153,153)
#define  Gray_808080        UIColorRGB(128,128,128)
#define  Gray_909090        UIColorRGB(144,144,144)
#define  Gray_AAAAAA        UIColorRGB(170,170,170)
#define  Gray_BBBBBB        UIColorRGB(187,187,187) 
#define  Gray_CCCCCC        UIColorRGB(204,204,204) 
#define  Gray_DDDDDD        UIColorRGB(221,221,221) 
#define  Gray_EEEEEE        UIColorRGB(238,238,238) 
#define  Gray_F0F0F0        UIColorRGB(240,240,240)
#define  Gray_F5F5F5        UIColorRGB(245,245,245)
//---------------------"   K线 股票   "-------------------
#define  Stock_Green     ColorHex(0x59C977)//绿色 0x13BA64
#define  Stock_Red       ColorHex(0xF64D63)//红色 0xFC0944、0xF64D63 
#define  Stock_Gray      ColorHex(0x333333)//灰色
#define  Stock_Bule      ColorHex(0x006CFE)//蓝色

#define Blue_2599FA     UIColorRGB(37,153,250)   //浅蓝色 (常用)
#define Blue_3180FF     ColorHex(0x3180FF)  

// ============================"  格式化 数据类型  "==============================
#define  NNSStringInt(myInt)        [NSString stringWithFormat:@"%d",myInt]         // Int
#define  NNSStringFloat(myFloat)    [NSString stringWithFormat:@"%f",myFloat]       // Float
#define  NNSString2Float(myFloat)   [NSString stringWithFormat:@".2%f",myFloat]     // Float：保留两位小数
#define  NNSString(string)          [NSString stringWithFormat:@"%@",string]        // 1个NSString
#define  NNStringAB(AA,BB)          [NSString stringWithFormat:@"%@%@",AA,BB]       // 2个NSString 拼接
#define  NNStringABC(AA,BB,CC)      [NSString stringWithFormat:@"%@%@%@",AA,BB,CC]  // 3个NSString 拼接

//设置 view 圆角和边框
#define LLayerRadiusBorderView(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//设置 view 圆角
#define LLayerRadiusView(View, Radius)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\


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
#define NSPureLog(FORMAT, ...) fprintf(stderr," %s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSPureLog(...)
#endif


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d %s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#endif /* ZM_BaseHeader_h */
