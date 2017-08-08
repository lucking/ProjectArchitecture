//
//  SingletonManager.h
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"
//#import "LoginManager.h"
#import "UserDefaults.h"
//#import "MBProgress.h"
#import "HudProgress.h"
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
//#define MMBProgress				([SingletonManager instance].MBProgressHUD)		//请求菊花
#define HHudProgress			([SingletonManager instance].progressHUD)		//请求菊花




@interface SingletonManager : Singleton
//实例化
Singleton_Instance_method_Interface(SingletonManager)


//@property (nonatomic, readonly) LoginManager *loginManager;				//登录
@property (nonatomic, readonly) UserDefaults *userDefaults;				//保存信息
//@property (nonatomic, readonly) MBProgress *MBProgressHUD;				//请求菊花
@property (nonatomic, readonly) HudProgress *progressHUD;				//请求菊花


@end





