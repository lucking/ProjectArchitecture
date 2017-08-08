//
//  NSObject+Caculator.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaculatorMaker.h"

@interface NSObject (Caculator)
//计算器
+ (float)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker;

@end
