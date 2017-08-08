//
//  AppDelegate+BaseSetting.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (BaseSetting)
{
    
}
+ (AppDelegate*)sharedAppDelegate;

- (void)BaseSetting;

#pragma mark -- 处理内存警告
- (void)didReceiveMemoryWarning;


@end
