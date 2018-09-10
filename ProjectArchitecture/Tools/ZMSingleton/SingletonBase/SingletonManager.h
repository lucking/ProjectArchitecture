//
//  SingletonManager.h
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"

#import "UserDefaults.h"
#import "HudProgress.h"
//#import "LoginUser.h"
//#import "LoginManager.h"
//#import "MBProgress.h"
//=========================="  单列模式  "============================
//不同地方 同用同一个对象
/*
 [NSUserDefaults standardUserDefaults]; //用户保存数据
 [NSNotificationCenter defaultCenter];  //通知中心
 [NSFileManager defaultManager];        //文件管理
 ......
 */
//#define LLoginManager			([SingletonManager instance].loginManager)		//登录
#define UUserDefaults			([SingletonManager instance].userDefaults)		//保存信息
#define HHudProgress			([SingletonManager instance].progressHUD)		//请求菊花
//#define LLoginUser              ([SingletonManager instance].loginUser)         //登录用户信息




@interface SingletonManager : Singleton
//实例化
Singleton_Instance_method_Interface(SingletonManager)


@property (nonatomic, readonly) UserDefaults *userDefaults;				//保存信息
@property (nonatomic, readonly) HudProgress *progressHUD;				//请求菊花
//@property (nonatomic, readonly) LoginManager *loginManager;                //登录
//@property (nonatomic, readonly) MBProgress *MBProgressHUD;                //请求菊花
//@property (nonatomic, readonly) LoginUser *loginUser;                   //登录用户信息


@end





