//
//  DataHandler.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "DataHandler.h"
#import "YTKKeyValueStore.h"
#import "Finance.h"

@implementation DataHandler


#pragma mark ======================="  数据处理  "=================================


- (void)testYTKKeyValueStore {
    
    // 创建数据库
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"Product.db"];
    // 创建表格
    NSString *tableName = @"Finance_table";
    //	[store createTableWithName:tableName];
    // 查询获取模型
    Page *page1 = [store getModelObjectById:@"2" className:[Page class] fromTable:tableName];
    NSLog(@"borrowTitle1 = %@", page1.borrowTitle);
    
    //	// 删除表库
    //		YTKKeyValueStore *store = [[YTKKeyValueStore alloc] init];
    //		[store deleteDatabseWithDBName:@"Product.db"];
    
    //	NSString* password = @"111111";
    //	password = [password md5Encrypt];
    //
    //	NSDictionary* params = @{@"custId":@"chenyangyang",
    //							 @"custPwd":password};
    //	// requestPostURl
    //	[NetworkManager requestGetURl:Login withParameters:params success:^(id data) {
    //
    //		NSLog(@"data = \n %@",data);
    //
    //	} failure:^(NSError *error) {
    //	}];
}



/**
 *  分业务模块：
 */
+ (NSMutableArray *)dataArrayOfPSModel:(Person *)personModel {

	NSMutableArray* dataArray = [[NSMutableArray alloc] initWithCapacity:100];

	return dataArray;
}



@end
