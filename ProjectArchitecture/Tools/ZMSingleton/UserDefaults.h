//
//  UserDefaults.h
//  ZMSingleton
//
//  Created by ZM on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"
#import <objc/runtime.h>

@interface UserDefaults : Singleton

//创建实例
Singleton_Instance_method_Interface(UserDefaults);
/**
 *  用户信息
 */
@property (nonatomic, assign) BOOL isLogin;             // 是否登录
// 登陆后返回的数据
@property (nonatomic, assign) int userId;           // 标识
@property (nonatomic, copy) NSString *userName;     // 姓名
@property (nonatomic, copy) NSString *userPwd;      // 登录密码
@property (nonatomic, copy) NSString *userPhone;    // 手机号
@property (nonatomic, copy) NSString *userEmail;    // 邮箱
@property (nonatomic, copy) NSString * userSex;          // 性别
@property (nonatomic, copy) NSString *userType;     // 类型
@property (nonatomic, copy) NSString *nick;         // 昵称
@property (nonatomic, copy) NSString *userHeadportrait; // 头像
@property (nonatomic, copy) NSString *userSignature;    // 个性签名
@property (nonatomic, copy) NSString *inviteCode;
@property (nonatomic, copy) NSString *imgURLStr; // 头像

@property (nonatomic, copy) NSString *tokenId; 
@property (nonatomic, copy) NSString *userLasttime; 
@property (nonatomic, copy) NSString *userCreatetime; 
@property (nonatomic, assign) NSInteger netWorkStatus; 


//==============="  保存信息到本地：NSUserDefaults  "========================
// 存入本地信息: Object
// 读取一个本地信息: Object
// 1.存入、读取: NSString
// 2.存入、读取: NSInteger
// 3.存入、读取: Float
// 4.存入、读取: BOOL

// 存入本地信息: Object
+ (void)zm_setObject:(id)object forKey:(NSString*)mykey;

+ (void)zm_setNSString:(NSString *)myMessage forKey:(NSString*)mykey;

+ (void)zm_setInteger:(NSInteger)myMessage forKey:(NSString*)mykey;

+ (void)zm_setFloat:(float)myMessage forKey:(NSString*)mykey;

+ (void)zm_setBool:(BOOL)myMessage forKey:(NSString*)mykey;


// 读取一个本地信息: Object
+ (id)zm_getObjectForKey:(NSString *)mykey;

+ (NSString *)zm_getNSStringForKey:(NSString *)mykey;

+ (NSInteger)zm_getIntegerForKey:(NSString *)mykey;

+ (float)zm_getFloatForKey:(NSString *)mykey;

+ (BOOL)zm_getBoolForKey:(NSString *)mykey;


// 5.读取NSDictionary一个key的信息
+ (id)zm_getDicStorageObject:(NSString *)dicKey dictionaryForKey:(NSString *)dicObjectKey;

// 存入本地信息: mutArray
+ (void)zm_storageObjectMutArray:(id)myMessage forKey:(NSString*)mykey;
// 存入本地信息: Array
+ (void)zm_storageObjectArray:(NSArray *)myArray forKey:(NSString*)mykey;


// 6.删除本地保存的信息: removeKey
+ (void)zm_removeObjectForKey:(NSString *)myKey;

// 7.移除所有本类 存储在本地的属性值
- (void)zm_removeAllObject;
//8.获取所有属性
- (void)getAllpropertyList;

@end

