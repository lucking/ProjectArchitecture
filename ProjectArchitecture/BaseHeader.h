//
//  BaseHeader.h
//  ZM_NavTabBar
//
//  Created by ZM on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#ifndef ZM_NavTabBar_BaseHeader_h
#define ZM_NavTabBar_BaseHeader_h


//------------------"  系统类型  "---------------
//获取当前系统的版本号
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//------------------"  手机尺寸类型  "---------------
//判断是否为：iPad
#define ZM_IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为：iPhone
#define ZM_IsiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为：ipod
#define ZM_IsiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断手机类型： 横、竖屏_皆可用
#define CurrentMode  [UIScreen instancesRespondToSelector:@selector(currentMode)]

#define ZM_IsiPhone4 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 960),  [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone5 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone6 (CurrentMode ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhone6p (CurrentMode ? CGSizeEqualToSize(CGSizeMake(1920, 1080),[[UIScreen mainScreen] currentMode].size) : NO)
#define ZM_IsiPhoneX (CurrentMode ? CGSizeEqualToSize(CGSizeMake(1125, 2436),[[UIScreen mainScreen] currentMode].size) : NO)

//判断手机类型： 竖屏可用（默认的）
#define  IS_IPHONE45   (([[UIScreen mainScreen] bounds].size.width-320)?NO:YES)
#define  IS_IPHONE4    (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define  IS_IPHONE5    (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define  IS_IPHONE6    (([[UIScreen mainScreen] bounds].size.width-375)?NO:YES)
#define  IS_IPHONE6p   (([[UIScreen mainScreen] bounds].size.width-414)?NO:YES)
#define  IS_IPHONE8X   (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)

//----------------------"  尺寸  "-------------------
// 全屏宽度、高度
#define SSWIDTH     ([UIScreen mainScreen].bounds.size.width)
#define SSHEIGHT    ([UIScreen mainScreen].bounds.size.height)
#define NavHeight       (20+44)
#define SSVCHeight      (SSHEIGHT-NavHeight)
#define SSPureHeight    (SSHEIGHT-NavHeight-49)
// IS_IPHONE8X 
#define StatusBarHeight     30
#define SafeAreaBottom      34

//--------------------控件比例--------------------
//屏幕自动适配 以5为基准， 4／5一样，6及以上除以5的宽高 ( 判断是不是4s如果是则高度和5s一样的比例 )
#define GetWidth(width)   (ZM_IsiPhone4 || ZM_IsiPhone5 ? (width)  : ((width) *SSWIDTH/320))
#define GetHeight(height) (ZM_IsiPhone4 || ZM_IsiPhone5 ? (height) : ((height)*SSHEIGHT/568))


//字体大小
#define FFont(font)			[UIFont systemFontOfSize:font]
#define FFBoldFont(font)	[UIFont boldSystemFontOfSize:font]
#define FFItalicFont(font)	[UIFont italicSystemFontOfSize:font]
// 设置字体
#define FFontSetName(fontName,font)     [UIFont fontWithName:(fontName) size:(font)]
#define FFHelveticaFont(font)           [UIFont fontWithName:@"Helvetica" size:font];
#define FFHelveticaBoldFont(font)       [UIFont fontWithName:@"Helvetica-Bold" size:font];

//------------------------"  UIImage  "---------------------
#define  IMG(imageName)  [UIImage imageNamed:imageName]



//------------------------"  UIColor  "---------------------
#define UIColorRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
#define UIColorRGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]


// 十六进制颜色
#define Color_With_Hex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
// 调用
//UIColor *redColor = Color_With_Hex(0xe4e5e5);


#define     Clear_COLOR         [UIColor clearColor]    // 透明色
#define     White_COLOR         [UIColor whiteColor]    // 白色
#define     Black_COLOR         [UIColor blackColor]    // 黑色
#define     Gray_COLOR			[UIColor grayColor]     // 灰色
#define     CyanColor			[UIColor cyanColor]     // 靛蓝
#define     MagentaColor        [UIColor magentaColor]
#define     Yellow_COLOR		[UIColor yellowColor]   // 黄色
#define     OrangeColor         [UIColor orangeColor]   // 橙色
#define     Red_COLOR			[UIColor redColor]      // 红色
//---------------------"   橙色、黄色   "-------------------
// 导航栏
//#define	 NavBg_COLOR			UIColorRGB(255,120,2)
#define	 NavBg_COLOR			UIColorRGB(33,150,243)
#define  Orange_ff7800			UIColorRGB(255,120,0)
#define  Orange_AA				UIColorRGB(255,187,6)
#define  Orange_BB				UIColorRGB(255,180,70)
// 橙色
#define OrangeColorAA			UIColorRGB(243,157,3)

//TabBar按钮
#define Color_normal     UIColorRGB(255,255,255) //默认：标题颜色
#define Color_select     UIColorRGB(255,87,34)   //选中：标题颜色


//---------------------"  红、粉、紫   "-------------------
#define Red_EEAEEE      Color_With_Hex(0xEEAEEE) //粉紫
#define Purple_AB82FF   Color_With_Hex(0xAB82FF) //淡紫
#define Purple_CD69C9   Color_With_Hex(0xCD69C9) //淡紫
//---------------------"  蓝、绿   "-------------------
// 蓝色
#define BuleColorAA     UIColorRGB(3,91,166)
#define BuleColor_BB    UIColorRGB(2,117,219)
//浅浅淡淡蓝色
#define     Color_XXXXXX    UIColorRGB(216,236,253)
//淡蓝色 //导航栏
#define     Color_70AEE1    UIColorRGB(112,174,225)
#define     Color_005DC3    UIColorRGB(0,93,195)    //蓝色
#define     Blue_2599FA     UIColorRGB(37,153,250)  //浅蓝色
#define     Blue_3C96F5     UIColorRGB(60,150,225)  //蓝
#define     Blue_59A2E3     UIColorRGB(89,162,227)  //背景
#define     Bule_5CACEE     Color_With_Hex(0x5CACEE)
#define     Bule_20B2AA     Color_With_Hex(0x20B2AA)

// 标准绿色
#define GreenColor      UIColorRGB(5,111,0)
// 绿色
#define GreenColorAA    UIColorRGB(90,220,80)
#define Green_00CD66    Color_With_Hex(0x00CD66)
#define Green698B69     Color_With_Hex(0x698B69)
#define Green5F9EA0     Color_With_Hex(0x5F9EA0)
#define Green_9BCD9B    Color_With_Hex(0x9BCD9B) //浅绿：0x9BCD9B、0x8FBC8F
#define Green_96CDCD    Color_With_Hex(0x96CDCD) //浅蓝绿
#define Green_COLOR     [UIColor colorWithRed:0.123 green:0.811 blue:0.744 alpha:1.000]


//背景：淡灰色
#define  BgColor				UIColorRGB(238,243,249)
#define  BgLightColor			UIColorRGB(250,250,250)
#define  BgGrayColor			UIColorRGB(240,240,240)

//---------------------"  灰色、字体颜色  "-------------------
#define  GrayColor_Text			UIColorRGB(245,245,245)
#define  GrayColor_Login		UIColorRGB(177,177,177)
#define  GrayColor_titView		UIColorRGB(220,220,220)
//灰黑色字体
#define ziti_Color      UIColorRGB(31,28,28)
//标题字
#define  Gray_222222        UIColorRGB(34,34,34)
#define  Gray_333333        UIColorRGB(51,51,51)
#define  Gray_444444        UIColorRGB(68,68,68)
//突出字
#define  Gray_555555        UIColorRGB(85,85,85)
#define  Gray_666666        UIColorRGB(102,102,102)
//内容字
#define  Gray_777777        UIColorRGB(119,119,119)
#define  Gray_888888        UIColorRGB(136,136,136)
#define  Gray_999999        UIColorRGB(153,153,153)
#define  Gray_808080        UIColorRGB(128,128,128)
#define  Gray_909090        UIColorRGB(144,144,144)
#define  Gray_AAAAAA        UIColorRGB(170,170,170)
#define  Gray_BBBBBB        UIColorRGB(187,187,187) //深灰
#define  Gray_CCCCCC        UIColorRGB(204,204,204) //线条淡灰
#define  Gray_DDDDDD        UIColorRGB(221,221,221) //线条常用
#define  Gray_EEEEEE        UIColorRGB(238,238,238) //浅灰



// AppDelegate
#define ZM_APPDelegate      ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define APPDelegateWindow   (((AppDelegate*)[UIApplication sharedApplication].delegate).window)
// 懒加载
#define ZM_LAZY(object, assignment) (object = object ?: assignment)


//NSLog 分割线    //使用  NSLog(@"----->:%@",message);
#define NSLogline(format, ...) do {      \
				fprintf(stderr,  "<%s : %d> %s\n" ,  \
				[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
					__LINE__, __func__);                                                        \
				(NSLog)((format), ##__VA_ARGS__);                                                   \
				fprintf(stderr,  " -------------------------------完美分割线---------------------------------- \n  \n " );          \
				} while ( 0 )
// DEBUG 模式
#if DEBUG
	#define NSSLog(...) NSLog(__VA_ARGS__)
#else
	#define NSSLog(...) nil
#endif

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

#endif

