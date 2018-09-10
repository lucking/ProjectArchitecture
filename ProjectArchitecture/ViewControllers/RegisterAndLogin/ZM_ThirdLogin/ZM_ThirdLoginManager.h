//
//  ZM_ThirdLoginManager.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/27.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>


@interface ZM_ThirdLoginManager : NSObject

+ (NSString *)QQ_getSex:(NSString *)sex;

+ (NSString *)Sina_getSex:(NSString *)sex;

+ (NSDictionary *)dealInfoDicWithResult:(id )result error:(NSError *)error 
                           platformType:(UMSocialPlatformType)platformType;


@end
