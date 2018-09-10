//
//  ZM_TestHeader.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/11.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZM_TestHeader_h
#define ZM_TestHeader_h


//---------------------- ZM_define  ---------------------
//IS_IPHONEX 系统的
#define IPhoneXMainHeight       (SSHEIGHT-49-30-34)
#define IPhoneXSafeAreaHeight   (SSHEIGHT-88-34)

//去掉 navBar tabBar 的高度
#define SSVCHeight      (SSHEIGHT-64)

#ifdef IS_IPHONEX
#define SSPureHeight    (SSHEIGHT-64-49)
#else
#define SSPureHeight    (SSHEIGHT-64-83) 
#endif

//------------------"  手机尺寸类型  "---------------
//判断是否为：iPad 同：([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#define Test_ZM_IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为：iPhone  同：([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#define Test_ZM_IsiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为：ipod
#define Test_ZM_IsiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])



//---------------------- ZM_FunctionTest ---------------------
#import "Test_Block.h"
#import "Test_Network.h"
#import "Test_LoginUser.h"
#import "Test_GCD.h"
#import "Test_Var.h"
#import "Test_ZMDeviceInfo.h"
#import "Test_ZMAvoidCrash.h"
//---------------------- ZM_CategoryTest ---------------------
// Category: Foundation
#import "Test_NSString.h"
#import "Test_NSDate.h"
#import "Test_NSData.h"
// Category: UIKit
#import "Test_UILable.h"
#import "Test_UIImageView.h"

//---------------------- 项目中的Test ---------------------
#import "LQ_TestHeader.h"
#import "ZM_TestBaseVC.h"
#import "LQ_TestVController.h"
#import "TestBBView.h"
//#import "SimpleLineChart_VC.h"
//#import "Market_CoinDeatailVC.h"
//#import "PersonalCenterController.h"
//#import "ZM_MarketTitleView.h"

//#import "UINavigationController+FDFullscreenPopGesture.h"
// self.fd_prefersNavigationBarHidden = YES;
//#import <Masonry.h>
//#import "ZM_MarketTool.h"
//#import "ZM_ThirdLoginView.h"
//#import "ZM_ThirdLogin.h"
//#import "ThirdLogin_BindingPhoneVC.h"
//---------------------- ColorTest ---------------------

//调用：UIColor *redColor = ColorHex(0xe4e5e5);

#endif /* ZM_TestHeader_h */
