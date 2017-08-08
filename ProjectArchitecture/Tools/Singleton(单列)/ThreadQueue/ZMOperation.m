//
//  ZMOperation.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/7.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMOperation.h"

@implementation ZMOperation
//实例化
Singleton_Instance_method_ImplAlloc(ZMOperation)

static NSString *name = @"hello word"; //假如 name 就是分线程获取的数据


#pragma mark ZMOperation 创建的分线程
- (void)main {

	NSLog(@"-----> GCD 回到主线程");

	dispatch_sync( dispatch_get_main_queue(), ^{
		if ([self.delegate respondsToSelector:@selector(ZMOperation:)]) {

			[self.delegate ZMOperation:_operatDic]; //测试使用：[self.delegate ZMOperation:name];
		}
	});
}




@end
