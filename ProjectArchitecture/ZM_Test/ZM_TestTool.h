//
//  ZM_TestTool.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/12.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZMTestBlock) (NSString *name, int age);

@interface ZM_TestTool : NSObject
//@property (copy, nonatomic) void (^zmTestBlock)(NSString *name, int age);
//同上
@property (copy, nonatomic) ZMTestBlock zmTestBlock;


+ (ZM_TestTool *)shareSingleton;

//测试
+ (void)test;
- (void)singleton_Test;


@end
