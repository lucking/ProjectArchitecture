//
//  NSObject+Common.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/8/3.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

// 角度转换弧度
- (double)zm_degreesToRadian:(float)x;
// 弧度转换角度
- (double)zm_radianToDegrees:(float)radian;

@end
