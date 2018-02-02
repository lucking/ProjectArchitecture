//
//  ZM_FontHeader.h
//  VideoCamp
//
//  Created by ZM on 2018/1/18.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZM_FontHeader_h
#define ZM_FontHeader_h

/*
使用案例：
 
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
label.backgroundColor = [UIColor yellowColor];
label.text = @"hello,girl";
[self.view addSubview:label];

label.font = PFSCRegularFont(18);
 */


//----------------------"  字体  "-------------------

//字体大小
#define FFont(font)                 [UIFont systemFontOfSize:font]       //常规
#define FFBoldFont(font)            [UIFont boldSystemFontOfSize:font]   //加粗
#define FFItalicFont(font)          [UIFont italicSystemFontOfSize:font] //英文斜体

// 设置字体
#define FFontSetName(fontName,font) [UIFont fontWithName:(fontName) size:(font)]
#define FFHelveticaFont(font)       [UIFont fontWithName:@"Helvetica" size:font]      //常规
#define FFHelveticaBoldFont(font)   [UIFont fontWithName:@"Helvetica-Bold" size:font] //加粗

#define AppFont(a,b) [UIFont fontWithName:a size:b]
#define AdobeHeitiStdRegularFont(a) [UIFont fontWithName:@"AdobeHeitiStd-Regular" size:a]

//--- IOS8.0自带字体：UIFontWeight
//--- IOS9.0以后自带的平方字体：PingFangSC-Heavy


//1、极细：Ultralight
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCUltralightFont(a)   [UIFont fontWithName:@"PingFangSC-Ultralight" size:a]
#else
#define PFSCUltralightFont(a)   [UIFont systemFontOfSize:a weight:UIFontWeightUltraLight]
#endif

//2、中细：Thin
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCThinFont(a)   [UIFont fontWithName:@"PingFangSC-Thin" size:a]
#else
#define PFSCThinFont(a)   [UIFont systemFontOfSize:a weight:UIFontWeightThin]
#endif

//3、稍细：Light
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCLightFont(a)    [UIFont fontWithName:@"PingFangSC-Light" size:a]
#else
#define PFSCLightFont(a)    [UIFont systemFontOfSize:a weight:UIFontWeightLight]
#endif

//4、常规：Regular
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCRegularFont(a)  [UIFont fontWithName:@"PingFangSC-Regular" size:a]
#else
#define PFSCRegularFont(a)  [UIFont systemFontOfSize:a weight:UIFontWeightRegular]
#endif

//5、稍粗
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCHeavyFont(a)        [UIFont fontWithName:@"PingFangSC-Heavy" size:a]
#else
#define PFSCHeavyFont(a)        [UIFont systemFontOfSize:a weight:UIFontWeightHeavy]
#endif

//6、中等
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCMediumFont(a)       [UIFont fontWithName:@"PingFangSC-Medium" size:a]
#else
#define PFSCMediumFont(a)       [UIFont systemFontOfSize:a weight:UIFontWeightMedium]
#endif

//7、粗体
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCSemiboldFont(a)     [UIFont fontWithName:@"PingFangSC-Semibold" size:a]
#else
#define PFSCSemiboldFont(a)     [UIFont systemFontOfSize:a weight:UIFontWeightSemibold]
#endif

//8、超粗
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCBoldFont(a)     [UIFont fontWithName:@"PingFangSC-Bold" size:a]
#else
#define PFSCBoldFont(a)     [UIFont systemFontOfSize:a weight:UIFontWeightBold]
#endif

//9、极粗
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define PFSCBlackFont(a)    [UIFont fontWithName:@"PingFangSC-Black" size:a]
#else
#define PFSCBlackFont(a)    [UIFont systemFontOfSize:a weight:UIFontWeightBlack]
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define APPFont(a) [UIFont fontWithName:@"PingFangSC-Regular" size:(a+11)]
#else
#define APPFont(a)  [UIFont systemFontOfSize:(a+11) weight:UIFontWeightRegular]
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
#define APPBoldFont(a) [UIFont fontWithName:@"PingFangSC-Medium" size:a+12]
#else
#define APPFont(a)  [UIFont systemFontOfSize:(a+12) weight:UIFontWeightMedium]
#endif




#endif /* ZM_FontHeader_h */
