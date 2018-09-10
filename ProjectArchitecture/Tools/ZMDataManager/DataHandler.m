//
//  DataHandler.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "DataHandler.h"
#import "YTKKeyValueStore.h"
//#import "Finance.h"

@implementation DataHandler

+ (DataHandler *)singleton
{
    static DataHandler *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
/**
 *  分业务模块：
 */
+ (NSMutableArray *)dataArrayOfPSModel:(Person *)personModel {
    
    NSMutableArray* dataArray = [[NSMutableArray alloc] initWithCapacity:100];
    return dataArray;
}
#pragma mark ======================="  测试  "=================================
- (void)testYTKKeyValueStore {
    
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SqlitDBName.db"];
//    if ([store isTableExists:@"tableName"]) {
//        [store deleteTable:@"tableName"];
//    }
    NSDictionary *dic;
    // 创建数据库
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SqlitDBName.db"];
    //创建表
    [store createTableWithName:@"tableName"];
    //存储字典
    [store putObject:dic withId:@"dicId" intoTable:@"tableName"];
    //取字典
    [store getObjectById:@"dicId" fromTable:@"tableName"];
    
    //删除表
    [store deleteTable:@"tableName"];
    //删除库
    [store deleteDatabseWithDBName:@"SqlitDBName.db"];
    
//    [[DataHandler singleton] removeTableForName:OptionStockTableName forDBName:StockSqlitDBName];
//    [[DataHandler singleton] removeTableForName:OptionCodeArrayId forDBName:StockSqlitDBName];
//    //[[DataHandler singleton] removeTableForName:OptionNameArrayId forDBName:StockSqlitDBName];
//    [[DataHandler singleton] removeSqlitDBForName:StockSqlitDBName];
}


#pragma mark ======================="  数据处理  "=================================

// 删除库
- (void)removeSqlitDBForName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store deleteDatabseWithDBName:sqlitDBName];
}
// 删除表
- (void)removeTableForName:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    if ([store isTableExists:tableName]) {
        [store deleteTable:tableName];
    }
}


// 创建数据库、表、存储数据
// NSLog(@"--> tableName = %@",tableName);

// 存入一个字典：
+ (void)setDic:(id)dic dicId:(NSString *)dicId fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    [store putObject:dic withId:dicId intoTable:tableName];
}
// 取字典
+ (id)getDicByDicId:(NSString *)dicId fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    return [store getObjectById:dicId fromTable:tableName];
}



// 存入一个模型：Id= tableName  （ model ）
+ (void)setModel:(id)Model fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    [store putModelObject:Model withId:tableName intoTable:tableName];
}
// 取模型 （ model ）
+ (id)getModelByClass:(Class)className fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    return [store getModelObjectById:tableName className:[className class] fromTable:tableName];
}


// 存入数组 模型：只用一个Id= tableName  ( NSArray_model )
+ (void)setModelArray:(NSArray *)array fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    [store putModelObjectArray:array intoTable:tableName];
}
// 取数组 模型：( NSArray_ model )
+ (NSMutableArray *)getModelArrayByClass:(Class)className fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    if ([store isTableExists:tableName]) {
        return (NSMutableArray*)[store getModelArrayByclassName:[className class] fromTable:tableName];
    }
    return nil;
}


#pragma mark ---------" 存、取、删除：数组  "------------

// 存入数组_元素： NSArray_object
- (void)setObject:(id)object byArrayId:(NSString *)arrayId
       fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    NSMutableArray *mutArray= [NSMutableArray new];
    [mutArray addObjectsFromArray:[store getObjectById:arrayId fromTable:tableName]];
    [mutArray addObject:object];
    [store putObject:mutArray withId:arrayId intoTable:tableName];
}
// 存入数组： NSArray
- (void)setArray:(NSArray *)array
          withId:(NSString *)objectId
       fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    [store putObject:array withId:objectId intoTable:tableName];

}
// 取数组：NSArray
- (NSArray *)getArrayById:(NSString *)objectId
                fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    if ([store isTableExists:tableName]) {
        return (NSArray*)[store getObjectById:objectId fromTable:tableName];
    }
    return nil;
}
// 删除数组_元素：NSArray_object  ( 删除object，存入新的数组 )
- (void)removeObject:(id)object byArrayId:(NSString *)arrayId
              fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    if ([store isTableExists:tableName]) {
        NSMutableArray *mutArray= [NSMutableArray new];
        [mutArray addObjectsFromArray:[store getObjectById:arrayId fromTable:tableName]];
        [mutArray removeObject:object];
        [store putObject:mutArray withId:arrayId intoTable:tableName];
    }
}
// 删除数组：NSArray
- (void)removeArrayById:(NSString *)objectId
              fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    if ([store isTableExists:tableName]) {
        [store deleteObjectById:objectId fromTable:tableName];
    }
}



#pragma mark ---------" 存、取、删除： 字典  "------------
/**
 *  字典中添加 一个值
 @param value 值
 @param key 键
 @param objectId id
 @param tableName 表名
 @param sqlitDBName 库名
 */
- (void)addObjecToDicValue:(id)value
                    forKey:(NSString *)key
                    withId:(NSString *)objectId
                  forTable:(NSString *)tableName
                 forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    //取出 原来的
    NSMutableDictionary *getMutDic = [[NSMutableDictionary alloc] init];
    [getMutDic setDictionary:[store getObjectById:objectId fromTable:tableName]];
    //添加一个值
    [getMutDic setObject:value forKey:key];
    //存储 现在的
    [store putObject:getMutDic withId:objectId intoTable:tableName];
}

//取出 一个字典
- (NSMutableDictionary *)getDicForId:(NSString *)objectId
                            forTable:(NSString *)tableName
                           forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    return [store getObjectById:objectId fromTable:tableName];
}


/**
 *  字典中删除 一个值
 @param key 键
 @param objectId id
 @param tableName 表名
 @param sqlitDBName 库名
 */
- (void)removeObjectForKey:(NSString *)key
                    withId:(NSString *)objectId
                  forTable:(NSString *)tableName
                 forDBName:(NSString *)sqlitDBName
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:sqlitDBName];
    [store createTableWithName:tableName];
    //取出 原来的
    NSMutableDictionary *getMutDic = [[NSMutableDictionary alloc] init];
    [getMutDic setDictionary:[store getObjectById:objectId fromTable:tableName]];
    //删除一个值
    [getMutDic removeObjectForKey:key];
    //存储 现在的
    [store putObject:getMutDic withId:objectId intoTable:tableName];
}


@end
