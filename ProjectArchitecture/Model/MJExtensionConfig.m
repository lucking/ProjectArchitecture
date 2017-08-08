//
//  MJExtensionConfig.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/29.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "Finance.h"

@implementation MJExtensionConfig

+ (void)load
{

#pragma mark HomeDataAA类中的recommendProdList数组中存放的是RecommendListAA模型
#pragma mark
//	[HomeDataAA setupObjectClassInArray:^NSDictionary *{
//		return @{
//				 @"recommendProdList" : @"RecommendListAA",
//				 // 同上
//				 // @"recommendProdList" : [RecommendListAA class],
//				 };
//	}];



#pragma mark MapLogo中的ID属性对应着字典中的id
#pragma mark
	[MapLogo mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
		return @{@"ID" : @"id",
				 };
	}];
#pragma mark Finance类中的mapLogoArray数组中存放的是MapLogo模型
#pragma mark Finance类中的provinceListArray数组中存放的是ProvinceList模型
#pragma mark
	[Finance mj_setupObjectClassInArray:^NSDictionary *{
		return @{
				 @"mapLogo":@"MapLogo",
				 @"provinceList":@"ProvinceList"
				 };
	}];
#pragma mark PageBean 类中的page数组中存放的是Page模型
#pragma mark
	[PageBean mj_setupObjectClassInArray:^NSDictionary *{
		return @{
				 @"page":@"Page",
				 };
	}];


}


@end


