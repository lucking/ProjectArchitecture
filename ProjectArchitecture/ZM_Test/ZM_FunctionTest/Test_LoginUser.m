//
//  Test_LoginUser.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_LoginUser.h"
#import "LoginUser.h"
#import "MJExtension.h"

@implementation Test_LoginUser

//测试
- (void)test {
    
    [self UserDefaults_UserModel];
    
    [self LoginUserModel];

}

#pragma mark ---用户信息的存取：UserDefaults

- (void)UserDefaults_UserModel { 
    
//    //获取测试 用户信息
//    NSString *filePath  = [[NSBundle mainBundle]pathForResource:@"LoginModel" ofType:@"json"];
//    NSData *data        = [[NSData alloc]initWithContentsOfFile:filePath];
//    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    NSLog(@"--- UserModel：responseObject= %@ \n_ ",responseObject);    
//    
//    NSDictionary *user = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)responseObject[@"LoginUser"]];
//    UUserDefaults.isLogin   = YES;
//    UUserDefaults.userPhone = user[@"userPhone"];
//    UUserDefaults.userName  = user[@"userName"];
//    UUserDefaults.userPwd   = user[@"userPwd"];
//    UUserDefaults.userEmail = user[@"email"];
//    UUserDefaults.userSex   = user[@"sex"];
//    
//    UUserDefaults.userType  = user[@"userType"];
//    UUserDefaults.userHeadportrait = user[@"imageName"];
//    
//    //    UUserDefaults.country   = user[@"country"];
//    //    UUserDefaults.province  = user[@"province"];
//    //    UUserDefaults.city      = user[@"city"];
//    //    UUserDefaults.sign      = user[@"sign"];
//    //    UUserDefaults.time      = user[@"time"];
//    NSLog(@"---userName = %@ ",UUserDefaults.userName);
//    NSLog(@"---userPhone= %@ ",UUserDefaults.userHeadportrait);
//    NSLog(@"---imageName= %@ \n\n_ ",UUserDefaults.userPhone);
}


#pragma mark ---用户信息的存取：NSKeyedUnarchiver
- (void)LoginUserModel {
    
    //获取测试 用户信息
    NSString *filePath  = [[NSBundle mainBundle]pathForResource:@"LoginModel" ofType:@"json"];
    NSData *data        = [[NSData alloc]initWithContentsOfFile:filePath];
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"--- LoginUserModel：responseObject= %@ \n_ ",responseObject);
    
    //获取：登陆信息
    if ([LoginUser getLoginModel]) {
        LoginUser *model1 = [LoginUser getLoginModel];
        NSLog(@"---username_11= %@ \n_ ",model1.userName);
    }else{
        NSLog(@"---getLoginModel_11 None");
    }
    
    //移除：登陆信息
    [LoginUser removeLoginUserModel];
    if ([LoginUser getLoginModel]) {
        LoginUser *model2 = [LoginUser getLoginModel];
        NSLog(@"---username_22= %@ \n_ ",model2.userName);    
    }else{
        NSLog(@"---getLoginModel_22 None");
    }
    
    //存储：登陆信息
    LoginUser *model =  [LoginUser mj_objectWithKeyValues:[responseObject objectForKey:@"LoginUser"]];
    [LoginUser saveLoginModel:model];
    if ([LoginUser getLoginModel]) {
        LoginUser *model3 = [LoginUser getLoginModel];
        NSLog(@"---username_33= %@ \n\n_ ",model3.userName);
    }else{
        NSLog(@"---getLoginModel_33 None");
    }
    
}


@end
