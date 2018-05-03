//
//  LoginUser.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"
//#import "Singleton.h"

@interface LoginUser : ZMBaseObject

//单例：创建实例
//Singleton_Instance_method_Interface(LoginUser)
+ (LoginUser *)shareManager;

@property (nonatomic, copy)NSString *imageName;      // 头像
@property (nonatomic, copy)NSString *avatar;         // 头像
@property (nonatomic, copy)NSString *nickName;       // 昵称
@property (nonatomic, copy)NSString *userId;         // 用户id
@property (nonatomic, copy)NSString *userName;       // 用户名
@property (nonatomic, copy)NSString* userPhone;      // 手机号
@property (nonatomic, copy)NSString* userPosition;   // 职位
@property (nonatomic, copy)NSString *email;          // 邮箱
@property (nonatomic, copy)NSString *sex;            // 性别

@property (nonatomic,copy) NSString *country;    // 国家
@property (nonatomic,copy) NSString *province;   // 省
@property (nonatomic,copy) NSString *city;       // 城市
@property (nonatomic,copy) NSString *sign;
@property (nonatomic,copy) NSString *time;


//============================"  登陆信息（本地）  "=============================

//存储
+ (void)saveLoginModel:(LoginUser *)model;

//获取
+ (LoginUser *)getLoginModel;

//移除
+ (void)removeLoginUserModel;


@end
