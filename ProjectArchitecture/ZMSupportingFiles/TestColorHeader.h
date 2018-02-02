//
//  TestColorHeader.h
//  VideoCamp
//
//  Created by ZM on 2018/1/17.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef TestColorHeader_h
#define TestColorHeader_h


// app中测试使用，可删除
#define     CyanColor           [UIColor cyanColor]     // 靛蓝
#define     MagentaColor        [UIColor magentaColor]  // 磁红
#define     Yellow_COLOR        [UIColor yellowColor]   // 黄色
#define     OrangeColor         [UIColor orangeColor]   // 橙色
#define     Red_COLOR           [UIColor redColor]      // 红色
//---------------------"  蓝、绿   "-------------------
// 蓝色
#define BuleColorAA     UIColorRGB(3,91,166)
#define BuleColor_BB    UIColorRGB(2,117,219)
//浅蓝色 #2599FA
#define Color_2599FA    UIColorRGB(37,153,250)
//浅浅淡淡蓝色
#define     Color_XXXXXX    UIColorRGB(216,236,253)
//淡蓝色 //导航栏
#define     Color_70AEE1    UIColorRGB(112,174,225)
#define     Color_005DC3    UIColorRGB(0,93,195)    //蓝色
#define     Blue_2599FA     UIColorRGB(37,153,250)  //浅蓝色
#define     Blue_3C96F5     UIColorRGB(60,150,225)  //蓝
#define     Blue_59A2E3     UIColorRGB(89,162,227)  //背景
#define Bule_5CACEE     Color_With_Hex(0x5CACEE)
#define Bule_20B2AA     Color_With_Hex(0x20B2AA)


// 标准绿色
#define GreenColor      UIColorRGB(5,111,0)
// 绿色
#define GreenColorAA    UIColorRGB(90,220,80)
#define Green_00CD66    Color_With_Hex(0x00CD66)
#define Green698B69     Color_With_Hex(0x698B69)
#define Green5F9EA0     Color_With_Hex(0x5F9EA0)

//---------------------"  红、粉、紫   "-------------------
#define Red_EEAEEE      Color_With_Hex(0xEEAEEE) //粉紫
#define Purple_AB82FF   Color_With_Hex(0xAB82FF) //淡紫
#define Purple_CD69C9   Color_With_Hex(0xCD69C9) //淡紫



//---------------------"   橙色、黄色   "-------------------
//
#define  Orange_ff7800            UIColorRGB(255,120,0)
#define  Orange_AA                UIColorRGB(255,187,6)
#define  Orange_BB                UIColorRGB(255,180,70)
#define  Orange_CC                UIColorRGB(240,155,5)   // 深橙色
#define  OrangeColorAA            UIColorRGB(243,157,3)   // 橙色

/************"  部分Material Design的配色颜色值规范  "*************/

#define Color_F44336   UIColorRGB(244,67,54)    //红色   #F44336
#define Color_E91E63   UIColorRGB(233,30,99)    //深红   #E91E63
#define Color_9C27B0   UIColorRGB(156,39,176)   //紫色   #9C27B0
#define Color_673AB7   UIColorRGB(103,58,183)   //深紫   #673AB7

#define Color_3F51B5   UIColorRGB(63,81,181)    //湛蓝   #3F51B5
#define Color_2196F3   UIColorRGB(33,150,243)   //深蓝   #2196F3
#define Color_03A9F4   UIColorRGB(3,169,244)    //蓝色   #03A9F4
#define Color_00BCD4   UIColorRGB(0,188,212)    //浅蓝   #00BCD4

#define Color_009988   UIColorRGB(0,150,136)    //深绿   #009988
#define Color_5AB963   UIColorRGB(90,185,99)    //绿色   #5AB963
#define Color_8BC34A   UIColorRGB(139,195,74)   //浅绿   #8BC34A
#define Color_CDDC39   UIColorRGB(205,220,57)   //黄绿   #CDDC39

#define Color_FFEB3B   UIColorRGB(255,235,59)   //浅黄   #FFEB3B
#define Color_FFC107   UIColorRGB(255,193,7)    //黄色   #FFC107
#define Color_FF9800   UIColorRGB(255,152,0)     //橘黄   #FF9800
#define Color_FF5722   UIColorRGB(255,87,34)    //浅红   #FF5722



//#ifdef __IPHONE_9_0
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0 
# define zmName @"111111"
#else
# define zmName @"22222"
#endif



#endif /* TestColorHeader_h */
