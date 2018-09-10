//
//  LoginManager.h
//  ZMSingleton
//
//  Created by ZM on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

//#import "Singleton.h"
#import <Foundation/Foundation.h>

@interface LoginManager : NSObject

////创建实例
//Singleton_Instance_method_Interface(LoginManager)
/** 单例 */
+ (LoginManager *)singleton;

// 获取模拟用户信息
+ (NSDictionary *)getTestUserInfo;

/**
 *  登录用户在主线程
 */
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *token;
/**
 *  用户信息
 */
@property (nonatomic, readonly) NSString *userId;		// 标识
@property (nonatomic, readonly) NSString *userName;		// 姓名
@property (nonatomic, readonly) NSString *userPwd;		// 登录密码
@property (nonatomic, readonly) NSString *userPhone;	// 手机号
@property (nonatomic, readonly) NSString *userEmail;	// 邮箱
@property (nonatomic, readonly) NSString *userSex;		// 性别
@property (nonatomic, readonly) NSString *userType;		// 类型
@property (nonatomic, readonly) NSString *userImgURLStr;// 头像


/**
 *  用户识别关键。帮助服务器检测到我是谁。登录uid或UUID。
 */
@property (nonatomic, strong, readonly) NSString *userIdentify;
@property (nonatomic, assign) BOOL isLogin; // 是否登录


/**
 *  登录页面
 */
#pragma mark 登录页面
- (void)pushLoginVC;

/**
 *	登录_请求：Login.
 */
#pragma mark 登录请求：Login
- (void)loginWithParameters:params
                    success:(void (^)(id data))success
                    failure:(void (^)(NSError * error))failure;

/**
 *	退出_请求：Logout
 */
#pragma mark 退出登录请求：Logout
- (void)logout;


// 第三方等登录数据
- (NSArray *)thirdLoginViewDataArray;

@end



