//
//  NSObject+Caculator.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject+Caculator.h"

@implementation NSObject (Caculator)

//Calculate: 计算
//CaculatorMaker： 计算器

+ (float)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker
{
    CaculatorMaker *manager = [[CaculatorMaker alloc] init];
    caculatorMaker(manager);
    
    return manager.result;
}

@end
