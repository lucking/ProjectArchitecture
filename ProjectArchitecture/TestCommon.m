//
//  TestCommon.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TestCommon.h"
#import "NSData+ZMAdd.h"
#import "NSDate+ZMAdd.h"
#import "DeviceInfo.h"
#import "APPInfoManager.h"
//测试
#import "AssertHandler.h"
#import "CatchCrash.h"
#import "ZMAvoidCrash.h"
#import "Person.h"
#import "NetworkSession.h"
#import "NetworkReachability.h"
#import "LoginUser.h"

@implementation TestCommon

//测试
+ (void)test {
    
//    [self LoginUserModel];
//    
//    [self UserModel];

    //[self assertCrash];
    //[self timeDate];
    //[self APPDeviceInfo];
    
    //[DeviceInfo ISIPHONEXX];
    [NSData nowTest];
    
    //测试 配置网络状态
    [NetworkReachability netWorkReachabilityStatus];
    //    Person *pp = [[Person alloc] init];
    //    [pp setValue:@"aaaa" forKey:@"firstName"];
    //    [pp setValue:@"bbb" forKey:@"name"];
    
}

#pragma mark ---用户信息的存取：UserDefaults

+ (void)UserModel { 
    
    NSString *filePath  = [[NSBundle mainBundle]pathForResource:@"LoginModel" ofType:@"json"];
    NSData *data        = [[NSData alloc]initWithContentsOfFile:filePath];
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"--- UserModel：responseObject= %@ \n_ ",responseObject);    

    NSDictionary *user = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)responseObject[@"LoginUser"]];
    UUserDefaults.isLogin   = YES;
    UUserDefaults.userPhone = user[@"userPhone"];
    UUserDefaults.userName  = user[@"userName"];
    UUserDefaults.userPwd   = user[@"userPwd"];
    UUserDefaults.userEmail = user[@"email"];
    UUserDefaults.userSex   = user[@"sex"];

    UUserDefaults.userType  = user[@"userType"];
    UUserDefaults.imgURLStr = user[@"imageName"];
    
    UUserDefaults.country   = user[@"country"];
    UUserDefaults.province  = user[@"province"];
    UUserDefaults.city      = user[@"city"];
    UUserDefaults.sign      = user[@"sign"];
    UUserDefaults.time      = user[@"time"];
    NSLog(@"---userName = %@ ",UUserDefaults.userName);
    NSLog(@"---userPhone= %@ ",UUserDefaults.imgURLStr);
    NSLog(@"---imageName= %@ \n\n_ ",UUserDefaults.userPhone);
}

#pragma mark ---用户信息的存取：NSKeyedUnarchiver
+ (void)LoginUserModel {
    
    NSString *filePath  = [[NSBundle mainBundle]pathForResource:@"LoginModel" ofType:@"json"];
    NSData *data        = [[NSData alloc]initWithContentsOfFile:filePath];
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"--- LoginUserModel：responseObject= %@ \n_ ",responseObject);
 
    //获取：登陆信息
    if ([LoginUser getLoginModel]) {
        LoginUser *model1 = [LoginUser getLoginModel];
        NSLog(@"---username 11= %@ \n_ ",model1.userName);
    }else{
        NSLog(@"----- getLoginModel 11 None");
    }
    
    //移除：登陆信息
    [LoginUser removeLoginUserModel];
    if ([LoginUser getLoginModel]) {
        LoginUser *model2 = [LoginUser getLoginModel];
        NSLog(@"---username 22= %@ \n_ ",model2.userName);    
    }else{
        NSLog(@"----- getLoginModel 22 None");
    }
    
    //存储：登陆信息
    LoginUser *model =  [LoginUser mj_objectWithKeyValues:[responseObject objectForKey:@"LoginUser"]];
    [LoginUser saveLoginModel:model];
    if ([LoginUser getLoginModel]) {
        LoginUser *model3 = [LoginUser getLoginModel];
        NSLog(@"---username 33= %@ \n\n_ ",model3.userName);
    }else{
        NSLog(@"----- getLoginModel 33 None");
    }
   
}

// 断点配置
+ (void)assertCrash {
    
    //    //断点配置
    //    AssertHandler *myHandler = [[AssertHandler alloc] init];
    //    // 配置给当前的线程_跳跃崩溃断点_并打印崩溃日志
    //    [[[NSThread currentThread] threadDictionary] setValue:myHandler forKey:NSAssertionHandlerKey];
    //    // 手动断点
    //    [myHandler printMyName:nil];
    //    
    //    // NSMutableArray+Extension 交换方法_跳过崩溃
    //    NSString *nilStr = nil;
    //    NSMutableArray *arrayM = [NSMutableArray array];
    //    [arrayM addObject:nilStr];
}

// 获取当前时间戳
+ (void)timeDate {
    
    NSLog(@"---> getNowTimeTimestamp0= %@ ",[NSDate timeSwitchTimestampFormatter:@"YYYY-MM-dd HH:mm:ss"]);
    NSLog(@"---> getNowTimeTimestamp1= %@ ",[NSDate getNowTimestamp]);
    NSLog(@"---> getNowTimeTimestamp2= %@ ",[NSDate getNowTimestampOfSecond]);
    NSLog(@"---> getNowTimeTimestamp3= %@ ",[NSDate getNowTimestampOfMillisecond]);
    
    NSString *timestamp = [NSDate getNowTimestamp];
    NSLog(@"---> timestamp.length= %ld ",timestamp.length);
}


void openUDIDString() {
    
}
void deviceIDSelector() {
    
}
// 设备信息管理
+ (void)APPDeviceInfo {
   
    NSLog(@"---> randomUUID_1= %@ ",[DeviceInfo randomUUID]);
    NSLog(@"---> randomUUID_2= %@ ",[DeviceInfo randomUUID]);
    
    NSLog(@"---> systemVersion= %@ ",[DeviceInfo systemVersion]);
    NSLog(@"---> appVersion= %@ ",[[APPInfoManager singleton] appVersion]);
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)) {
        
    }
    
    //测试设备
    Class cls = NSClassFromString(@"UMANUtil");
    SEL deviceIDSelector = @selector(openUDIDString);
    NSString *deviceID = nil;
    if(cls && [cls respondsToSelector:deviceIDSelector]){
        deviceID = [cls performSelector:deviceIDSelector];
    }
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSLog(@"---> openUDIDString= %@ \n", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);

    openUDIDString();
    //deviceIDSelector();

}

- (void)openUDIDString {
    
}
- (void)deviceIDSelector {
    
}


@end
