//
//  Finance.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/29.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "Finance.h"
#import "YTKKeyValueStore.h"
#import "ServerURL.h"

@implementation Finance

#pragma mark -首页产品：返回模型
+ (void)getFinance:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data,NSMutableArray* mutArray))successHandle failure:(void (^)(NSError *error))failureHandle
{
	[NetworkManager requestGetURL:AppFinance withParameters:params hudShow:hudShow success:^(id data) {
		if (data!=nil)
		{
			// NSLog(@"data = \n %@",data);
			NSDictionary* dicdata = (NSDictionary *)data;
			Finance *financeData = [Finance mj_objectWithKeyValues:dicdata];

		// [self modelTransformationWithResponseObj:data modelClass:[MapLogo class]];
			// 回调数据
			successHandle(financeData,financeData.mapLogo);
		}
	} failure:^(NSError *error) {
	}];
}

#pragma mark -首页产品：返回数组
+ (void)getFinanceParams:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(NSMutableArray* Arr11, NSMutableArray* Arr22, NSMutableArray* Arr33))successHandle failure:(void (^)(NSError *error))failureHandle
{
	[NetworkManager requestGetURL:AppFinance withParameters:params hudShow:hudShow success:^(id data) {

		NSMutableArray* mapLogArr  = [[NSMutableArray alloc] init];
		NSMutableArray* provinceArr= [[NSMutableArray alloc] init];
		NSMutableArray* pageArr	   = [[NSMutableArray alloc] init];
		// 创建数据库
		YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"Finance.db"];
		// 创建表格
		NSString *tableName1 = @"mapLog_table";
		NSString *tableName2 = @"province_table";
		NSString *tableName3 = @"page1_table";
		[store createTableWithName:tableName1];
		[store createTableWithName:tableName2];
		[store createTableWithName:tableName3];

		// NSLog(@"data = \n %@",data);
		// 如果有数据取出返回
		if (data!=nil){
			NSDictionary* dicdata = (NSDictionary *)data;
			Finance *financeData = [Finance mj_objectWithKeyValues:dicdata];
			NSLog(@"retCode= %@, retFlag= %@, retMsg= %@ \n ", financeData.retCode, financeData.retFlag, financeData.retMsg);

			[mapLogArr addObjectsFromArray:financeData.mapLogo];
			[provinceArr addObjectsFromArray:financeData.provinceList];
			[pageArr addObjectsFromArray:financeData.pageBean.page];

			NSMutableArray* idArray = [[NSMutableArray alloc] init];
			for (int i=0; i<pageArr.count; i++) {
				[idArray addObject:[NSString stringWithFormat:@"%d",i]];
			}
			// 删除表中旧数据
			[store deleteObjectsByIdArray:idArray fromTable:tableName1];
			[store deleteObjectsByIdArray:idArray fromTable:tableName2];
			[store deleteObjectsByIdArray:idArray fromTable:tableName3];
			// 存储模型
			[store putModelObjectArray:mapLogArr withIdArray:idArray intoTable:tableName1];
			[store putModelObjectArray:provinceArr withIdArray:idArray intoTable:tableName2];
			[store putModelObjectArray:pageArr withIdArray:idArray intoTable:tableName3];
		}else {
			// 一般每一次请求10条数据：条数根据服务器来添加
			NSMutableArray* idArray = [[NSMutableArray alloc] init];
			for (int i=0; i<10; i++) {
				[idArray addObject:[NSString stringWithFormat:@"%d",i]];
			}
			// 查询获取模型

			mapLogArr   = [store getModelArrayByclassName:[MapLogo class] fromTable:tableName1];
			provinceArr = [store getModelArrayByclassName:[ProvinceList class] fromTable:tableName1];
			pageArr		= [store getModelArrayByclassName:[Page class] fromTable:tableName1];

//			mapLogArr	= [store getModelArrayByclassName:[MapLogo class] fromTable:tableName1 arrayCount:10];
//			provinceArr = [store getModelArrayByclassName:[ProvinceList class] fromTable:tableName1 arrayCount:10];
//			pageArr		= [store getModelArrayByclassName:[Page class] fromTable:tableName1 arrayCount:10];
		}
		// 回调数据
		successHandle(mapLogArr, provinceArr, pageArr);

	} failure:^(NSError *error) {
	}];
}


@end


@implementation MapLogo

@end


@implementation PageBean

@end


@implementation Page

@end


@implementation ProvinceList

@end



