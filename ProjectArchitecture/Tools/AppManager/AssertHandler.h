//
//  AssertHandler.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssertHandler : NSAssertionHandler


- (void)printMyName:(NSString *)myName;

- (void)assertWithPara:(NSString *)str;

@end
