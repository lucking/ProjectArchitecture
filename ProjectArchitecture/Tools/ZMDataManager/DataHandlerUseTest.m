//
//  DataHandlerUseTest.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "DataHandlerUseTest.h"
#import "DataHandler.h"

#pragma mark ======================="  数据库 管理  "=========================
// 数据库
#define SqlitDBName             @"Channel.db"
// 数据表
/*
 * 频道筛选
 */
#define ChannelTableName        @"ChannelTableName" //
#define TopArrTableName         @"topArrTable"      //
#define BottomArrTableName      @"bottomArrTable"   //
/*
 * 自选股 stock
 */
#define _sqlitDBName            @"sqlitDBName"
#define _stockTableName         @"stock_tableName"
#define _stockArrayId           @"stockArray_Id"
//#define _objectId               @"objectId"

@interface DataHandlerUseTest()
{
    
}
@property (nonatomic, strong) NSMutableString *stockURLString;
@property (nonatomic, strong) NSMutableArray *stockIdArray;
@end


@implementation DataHandlerUseTest


- (void)testArray {
    
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    [mutArray setArray:@[@"11",@"22",@"33",@"44",@"55",]];
    
    
    [mutArray insertObject:@"00" atIndex:0];
    [mutArray insertObject:@"aa" atIndex:0];
    [mutArray insertObject:@"bb" atIndex:0];
    
    NSString *_tableName = @"";
    NSLog(@"---> mutArray_00 = %@",mutArray);
    //添加
    [[DataHandler singleton] setArray:mutArray withId:_tableName fromTable:_tableName forDBName:_sqlitDBName];
    //添加后
    [mutArray setArray:[[DataHandler singleton] getArrayById:_tableName fromTable:_tableName forDBName:_sqlitDBName]];
    NSLog(@"---> mutArray_11 = %@",mutArray);
    
    //删除后添加
    [mutArray removeObjectAtIndex:0];
    [[DataHandler singleton] setArray:mutArray withId:_tableName fromTable:_tableName forDBName:_sqlitDBName];
    
    //删除后取出
    [mutArray setArray:[[DataHandler singleton] getArrayById:_tableName fromTable:_tableName forDBName:_sqlitDBName]];
    NSLog(@"---> mutArray_22 = %@",mutArray);
    
    
    //插入后添加
    [mutArray insertObject:@"zz" atIndex:0];
    [[DataHandler singleton] setArray:mutArray withId:_tableName fromTable:_tableName forDBName:_sqlitDBName];
    //插入后取出
    mutArray = (NSMutableArray *)[[DataHandler singleton] getArrayById:_tableName fromTable:_tableName forDBName:_sqlitDBName];
    NSLog(@"---> mutArray_33 = %@",mutArray);
    
    
    
    mutArray = (NSMutableArray *)[[DataHandler singleton] getArrayById:_stockArrayId fromTable:_stockTableName forDBName:_sqlitDBName];
    NSLog(@"---> mutArray_33 = %@",mutArray);
    
    //删除表
    [[DataHandler singleton] removeTableForName:_stockTableName forDBName:_sqlitDBName];
    
    mutArray = (NSMutableArray *)[[DataHandler singleton] getArrayById:_stockArrayId fromTable:_stockTableName forDBName:_sqlitDBName];
    NSLog(@"---> mutArray_44 = %@",mutArray);
    
    
    NSMutableDictionary *_stiockMutDic = [[NSMutableDictionary alloc] init];
    [_stiockMutDic objectForKey:@"_stockId"];
    NSLog(@"---> _stiockMutDic = %@",_stiockMutDic);
    
    
    // @"http://172.16.1.150:8080/HQ1.0.0/selfSelect.jsp?stocks=sh601006,sh601007,sh601008,sh601009,sz000018,hk00941"
    
    _stockIdArray = [[NSMutableArray alloc] initWithArray:@[@"aaa",@"ww",@"qq",@"ee",@"zz",@"dd"]];
    _stockURLString = [[NSMutableString alloc] initWithString:@"http://172.16.1.150:8080/HQ1.0.0/selfSelect.jsp?stocks="];
    
    __weak typeof(self) WSelf = self;
    [_stockIdArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [WSelf.stockURLString appendString:[NSString stringWithFormat:@",%@",obj]];
    }];
    NSLog(@"---> _stockURLString = %@",_stockURLString);
    
}


@end
