//
//  LoginUser.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "LoginUser.h"
#import "MJExtension.h"

@implementation LoginUser

//单例：实例化
//Singleton_Instance_method_Impl(LoginUser)

+ (LoginUser *)shareManager
{
    static LoginUser *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//@dynamic imageName;
//@dynamic avatar;
//@dynamic nickname;
//@dynamic userId;
//@dynamic username;
//
//@dynamic userPhone;
//@dynamic userPosition;
//@dynamic email;
//@dynamic sex;
//
//@dynamic country;
//@dynamic province;
//@dynamic city;
//@dynamic sign;
//@dynamic time;

//测试
- (void)test {
    
    NSDictionary *responseObject = [[NSDictionary alloc] init];
    LoginUser *model =  [LoginUser mj_objectWithKeyValues:[responseObject objectForKey:@"LoginUser"]];
    
    //存储本地：登陆信息
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:ZM_LoginUserMODEL];
    
    
}
//- (NSString *)imageName {       return  [LoginUser getLoginModel].imageName;    }
//- (NSString *)avatar {          return  [LoginUser getLoginModel].avatar;       }
//- (NSString *)nickname {        return  [LoginUser getLoginModel].nickname;     }
//- (NSString *)userId {          return  [LoginUser getLoginModel].userId;       }
//- (NSString *)username {        return  [LoginUser getLoginModel].username;     }
//
//- (NSString *)userPhone {       return  [LoginUser getLoginModel].userPhone;    }
//- (NSString *)userPosition {    return  [LoginUser getLoginModel].userPosition; }
//- (NSString *)email {           return  [LoginUser getLoginModel].email;        }
//- (NSString *)sex {             return  [LoginUser getLoginModel].sex;          }
//
//- (NSString *)country {     return  [LoginUser getLoginModel].country;  }
//- (NSString *)province {    return  [LoginUser getLoginModel].province; }
//- (NSString *)city {        return  [LoginUser getLoginModel].city;    }
//- (NSString *)sign {        return  [LoginUser getLoginModel].sign;    }
//- (NSString *)time {        return  [LoginUser getLoginModel].time;    }

//============================"  登陆信息（本地）  "=============================

//存储
+ (void)saveLoginModel:(LoginUser *)model {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:ZM_LoginUserMODEL];
}

//获取
+ (LoginUser *)getLoginModel
{
    NSData *loginData = [[NSUserDefaults standardUserDefaults] objectForKey:ZM_LoginUserMODEL];
    LoginUser *model  = [NSKeyedUnarchiver unarchiveObjectWithData:loginData];
    return  model;
}

//移除
+ (void)removeLoginUserModel
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ZM_LoginUserMODEL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
