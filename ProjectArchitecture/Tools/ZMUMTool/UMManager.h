//
//  UMManager.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/15.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

@interface UMManager : NSObject

//判断对应平台 是否安装App
+ (BOOL)sharePlatformType:(UMSocialPlatformType)platformType;


@end
