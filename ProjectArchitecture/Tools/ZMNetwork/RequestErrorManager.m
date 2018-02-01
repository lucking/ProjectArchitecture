//
//  RequestErrorManager.m
//  Architecture
//
//  Created by ZM on 2016/11/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "RequestErrorManager.h"
#import "LoginViewController.h"
#import "YYWebImage.h"
#import "NSString+ZMAdd.h"
#import "HudProgress.h"
#import "ServerURL.h"

#define hudHiddenDelay      2.0f
#define hudAlertTime        1.5f


@implementation RequestErrorManager

//单例
+ (RequestErrorManager *)singleton
{
    static RequestErrorManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

/**
 *  处理_请求错误
 */
+ (void)errorDealWithLocalError:(NSError *)error {
    
    NSString* localError = [error localizedDescription];
    NSLog(@"---> error = %@ ", [error description]);
    NSLog(@"---> error Code = %ld",[error code]);
    NSLog(@"---> localError = %@ \n ",localError);
    
    if ([localError isEqualToString:LocalError_timedOut]) {
        [HHudProgress hudShowErrorMsg:@"请求超时，服务链接中断 \n 程序员哥哥正在抢救中" afterDelay:Hud_ErrorTime];
        
    }else if ([localError isEqualToString:LocalError_notConnect]){
        [HHudProgress hudShowErrorMsg:@"无法连接到服务器" afterDelay:Hud_ErrorTime];
        
    }else if ([localError isEqualToString:LocalError_notRead]){
        [HHudProgress hudShowErrorMsg:@"数据无法读取,因为它不在正确的格式" afterDelay:Hud_ErrorTime];
        
    }else if ([localError isEqualToString:LocalError_cancelRequest]){
        [HHudProgress hudShowErrorMsg:@"取消请求" afterDelay:Hud_ErrorTime];
        
    }else{
        [HHudProgress hudShowErrorMsg:[error localizedDescription] afterDelay:Hud_ErrorTime];
    }
}

/**
 *  没有网络：创建网络错误处理类型
 */
+ (NSError *)createLocalError {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:@"withoutNetwork",
                               NSUnderlyingErrorKey		:@"error"};
    NSError *error = [NSError errorWithDomain:@"domain" code:1001 userInfo:userInfo];
    return error;
}


/**
 如果接口返回错误将错误信息显示出来：RespCode !=1000 时显示 RespMessage

 @param data 请求到的数据
 @return 数据正常则返回 yes，否则返回no
 */
+ (BOOL)dealErrorOfData:(id)data  {
    
    if ([NSString isNotEmptyObject:data]) {

        if ([data[@"RespCode"] isEqualToString:@"10000"]) {
            
            return YES;
        }else{
            [HHudProgress hudShowLoadingMsg:data[@"RespMessage"]];
            return NO;
        }
    }else{
        [HHudProgress hudShowLoadingMsg:@"数据异常，请稍后再试 ！"];
        return NO;
    }
}




//+ (BOOL)dealErrorOfData:(id)data dataDic:(NSDictionary*)dataDic {
//    
//    if ([Common isNotEmpty:data]) {
//        
//        if ( [Common isNotEmpty:dataDic[@"rspData"]]) {
//            
//            if ([dataDic[@"rspCod"] isEqualToString:@"000000"]) {
//                return YES;
//            }else {
//                [MMBProgress hudShowMessage:dataDic[@"rspMsg"] afterDelay:hudHiddenDelay];
//                return NO;
//            }
//        }else{
//            if ([dataDic[@"rspCod"] isEqualToString:@"000000"]) {
//                return YES;
//            }else {
//                // [dataDic[@"rspMsg"] isEqualToString:@"登录超时，请重新登录"] || [dataDic[@"rspMsg"] isEqualToString:@"您已在其他地方登录，即将返回登录页面"]
//                
//                if ([dataDic[@"rspCod"] isEqualToString:@"_SSO_ERR"]) {
//                    
//                    [[YYImageCache sharedCache].memoryCache removeAllObjects];
//                    [[YYImageCache sharedCache].diskCache removeAllObjects];
//                    
//                    [MMBProgress hudShowMessage:dataDic[@"rspMsg"] afterDelay:hudHiddenDelay];
//                    [UserDefaults storageBool:YES Key:@"KickedOutLogin"];
//                    // 发出通知
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"KickedOutLogin" object:nil];
//                    //登录
//                    //NNSLog(@"---> getCurrentVC_CC = %@ \n ",[Common getCurrentVC]);
//                    LoginVController* pushVC= [[LoginVController alloc] init];
//                    pushVC.fromVC = [Common getCurrentVC];
//                    [[Common getCurrentVC].navigationController pushViewController:pushVC animated:YES];
//                    
//                }else{
//                    [MMBProgress hudShowMessage:dataDic[@"rspMsg"] afterDelay:hudHiddenDelay];
//                }
//                
//                return NO;
//            }
//        }
//    }else{
//        [MMBProgress hudShowMessage:@"数据异常，请稍后再试 ！" afterDelay:hudHiddenDelay];
//        return NO;
//    }
//}

@end
