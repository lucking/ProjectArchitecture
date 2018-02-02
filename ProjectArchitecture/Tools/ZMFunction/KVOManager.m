//
//  KVOManager.m
//  ZM_BaseViewController
//
//  Created by ZM on 15/11/13.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "KVOManager.h"

@implementation KVOManager


#pragma mark ---" observeValueForKeyPath "---
//单列类 观察
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	NSLog(@"--->change: %@",change);

	//change 要改变的事情 Key
	//每次只能实现 一种属性的通知:color、image 不能同时改变

	if ([keyPath isEqualToString:@"color"]) {

	}
	else if([keyPath isEqualToString:@"image"]) {

	}
	else if([keyPath isEqualToString:@"string"]) {

	}

}


@end
