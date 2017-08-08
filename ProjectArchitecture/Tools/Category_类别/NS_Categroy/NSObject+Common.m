//
//  NSObject+Common.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/8/3.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject (Common)


- (void)testUse {
    
    [self degreesToRadian:30];
    [self radianToDegrees:M_PI_2];
    
    
}

// 角度转换弧度
- (double)degreesToRadian:(float)x {
    return (M_PI * (x) / 180.0);
}
// 弧度转换角度
- (double)radianToDegrees:(float)radian {
    return (radian*180.0)/(M_PI);
}

@end
