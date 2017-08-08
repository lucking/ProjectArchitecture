//
//  Traveller.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Traveller.h"
#import <MJExtension.h>

@implementation Traveller

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"userID" : @"id"};
}

@end
