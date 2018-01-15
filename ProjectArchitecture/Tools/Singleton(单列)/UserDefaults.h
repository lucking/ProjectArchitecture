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
{
    
}
//创建实例
Singleton_Instance_method_Interface(UserDefaults);



/**
 *  登录用户在主线程
 */
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) BOOL isLogined;
@property (nonatomic, assign) BOOL isOnline DEPRECATED_ATTRIBUTE;
/**
 *  用户信息
 */
//@property (nonatomic, retain) NSNumber *userId;		// 标识
@property (nonatomic, copy) NSString *userId;		// 标识
@property (nonatomic, copy) NSString *userName;		// 姓名
@property (nonatomic, copy) NSString *userPwd;		// 登录密码
@property (nonatomic, copy) NSString *userPhone;	// 手机号
@property (nonatomic, copy) NSString *userEmail;	// 邮箱
@property (nonatomic, copy) NSString *userSex;		// 性别
@property (nonatomic, copy) NSString *userType;		// 类型
@property (nonatomic, copy) NSString *userImgURLStr;// 头像

@property (nonatomic, assign) BOOL isLogin; // 是否登录
@property (nonatomic, assign) int networkType;  //
@property (nonatomic, assign) NSInteger netWorkStatus; //

#pragma mark-  

//==============="  保存信息到本地：NSUserDefaults  "========================
// 存入本地信息: Object
// 读取一个本地信息: Object
// 1.存入、读取: NSString
// 2.存入、读取: NSInteger
// 3.存入、读取: Float
// 4.存入、读取: BOOL

// 存入本地信息: Object

+ (void)setObject:(id)object forKey:(NSString*)mykey;

+ (void)setNSString:(NSString *)myMessage forKey:(NSString*)mykey;

+ (void)setInteger:(NSInteger)myMessage forKey:(NSString*)mykey;

+ (void)setFloat:(float)myMessage forKey:(NSString*)mykey;

+ (void)setBool:(BOOL)myMessage forKey:(NSString*)mykey;



// 读取一个本地信息: Object
+ (id)getObjectForKey:(NSString *)mykey;

+ (NSString *)getNSStringForKey:(NSString *)mykey;

+ (NSInteger)getIntegerForKey:(NSString *)mykey;

+ (float)getFloatForKey:(NSString *)mykey;

+ (BOOL)getBoolForKey:(NSString *)mykey;


// 5.读取NSDictionary一个key的信息
+ (id)getDicStorageObject:(NSString *)dicKey dictionaryForKey:(NSString *)dicObjectKey;

// 存入本地信息: mutArray
+ (void)storageObjectMutArray:(id)myMessage forKey:(NSString*)mykey;
// 存入本地信息: Array
+ (void)storageObjectArray:(NSArray *)myArray forKey:(NSString*)mykey;


// 6.删除本地保存的信息: removeKey
+ (void)removeObjectForKey:(NSString *)myKey;

// 7.移除所有本类 存储在本地的属性值
- (void)removeAllObject;


@end




