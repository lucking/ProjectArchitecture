//
//  LoginManager.m
//  ZMSingleton
//
//  Created by ZM on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "LoginManager.h"
#import "UserModel.h"
#import "NSString+ZMAdd.h"
#import "UIViewController+ZMAdd.h"
#import "LoginViewController.h"
#import "UIAlertView+ZMAdd.h"
#import "ServerURL.h"

@implementation LoginManager
//实例化
Singleton_Instance_method_Impl(LoginManager)

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


//- (NSNumber *)userId {		return[UserDefaults getObjectStorageWithKey:@"userId"];	}
- (NSString *)userId {		return[UserDefaults getObjectForKey:@"userId"];	}
- (NSString *)userName{		return [UUserDefaults userName];		}//取值（同上）
- (NSString *)userPwd{		return UUserDefaults.userPwd;			}
- (NSString *)userPhone{	return UUserDefaults.userPhone;			}
- (NSString *)userEmail{	return UUserDefaults.userEmail;			}
- (NSString *)userType{		return UUserDefaults.userType;			}
- (NSString *)userImgURLStr{return UUserDefaults.userImgURLStr;		}
- (NSString *)userSex{		return UUserDefaults.userSex;			}
- (BOOL)isLogin {			return UUserDefaults.isLogin;           }


/**
 *  登录页面、登录请求、退出请求
 */
#pragma mark 登录页面
#pragma
- (void)pushLoginVC {

	UIViewController *currentVC = [UIViewController getCurrentVC];

	LoginViewController* loginVC = [[LoginViewController alloc] init];
	[currentVC.navigationController pushViewController:loginVC animated:YES];
}


#pragma mark 登录请求：Login
#pragma
- (void)loginWithParameters:params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure {

	NSLog(@"JSON_Params = %@ \n \n ",params);
	[NetworkManager requestGetURL:Login_URL withParameters:params hudShow:YES success:^(id data) {

		NSLog(@"-----> 登录_data = %@",data);
        success(data);

	} failure:^(NSError *error) {
		failure(error);
	}];
	
}

#pragma mark 退出登录请求：Logout
#pragma
- (void)logout{

	[NetworkManager requestGetURL:Logout_URL withParameters:nil hudShow:YES success:^(id data) {

		NSLog(@"-----> 退出登录_data = %@",data);
		if ([NSString isNotEmptyObject:data]) {
			UUserDefaults.isLogin = NO; // 退出登录：标志
		}

	} failure:^(NSError *error) {

	}];
}


@end
