//
//  NSTimer+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/11/1.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ZMAdd)

//开启：定时器
- (void)zm_startTimer;
//复试：定时器
- (void)zm_resume;
//暂停：定时器
- (void)zm_pauseTimer;
//移除：定时器
- (void)zm_removeTimer;


@end
