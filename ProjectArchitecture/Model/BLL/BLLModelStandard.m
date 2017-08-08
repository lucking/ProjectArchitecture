//
//  BLLModelStandard.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/16.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "BLLModelStandard.h"

@implementation BLLModelStandard

- (instancetype)initWithName:(NSString *)name age:(int)age sex:(UserSex)sex
{
	if(self = [super init]) {
		_Name = [name copy];
		_age = age;
		_sex = sex;
	}
	return self;
}
- (instancetype)initWithName:(NSString *)name
						 age:(int)age {
	return [self initWithName:name age:age sex:UserSex_Man];
}




@end
