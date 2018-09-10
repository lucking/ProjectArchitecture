//
//  DataHandler.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface DataHandler : NSObject


+ (DataHandler *)singleton;


// 返回数据
+ (NSMutableArray *)dataArrayOfPSModel:(Person *)personModel;


#pragma mark ======================="  数据处理  "=================================

// 删除库
- (void)removeSqlitDBForName:(NSString *)sqlitDBName;
// 删除表
- (void)removeTableForName:(NSString *)tableName forDBName:(NSString *)sqlitDBName;


// 创建数据库、表、存储数据
// NSLog(@"--> tableName = %@",tableName);

// 存入一个字典：
+ (void)setDic:(id)dic dicId:(NSString *)dicId fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 取字典
+ (id)getDicByDicId:(NSString *)dicId fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;

#pragma mark ---------"  存、取 一个模型：Id= tableName  （ model ） "------------
// 存
+ (void)setModel:(id)Model fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 取
+ (id)getModelByClass:(Class)className fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;


#pragma mark ---------"  存、取 数组 模型：只用一个Id= tableName (NSArray) "------------
// 存入
+ (void)setModelArray:(NSArray *)array fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 取出
+ (NSMutableArray *)getModelArrayByClass:(Class)className fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;



#pragma mark ---------"  存、取、删除:  数组 "------------
// 存入数组_元素： NSArray_object
- (void)setObject:(id)object byArrayId:(NSString *)arrayId
        fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 存数组
- (void)setArray:(NSArray *)array
          withId:(NSString *)objectId
       fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 取数组
- (NSArray *)getArrayById:(NSString *)objectId
                fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 删除数组内容：NSArray_object  ( 删除object，存入新的数组 )
- (void)removeObject:(id)object byArrayId:(NSString *)arrayId
           fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;
// 删除数组
- (void)removeArrayById:(NSString *)objectId
              fromTable:(NSString *)tableName forDBName:(NSString *)sqlitDBName;


#pragma mark ---------"  存、取、删除: 字典中的一个值 "------------
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
                 forDBName:(NSString *)sqlitDBName;
/*
 *  取出 字典一个值
 */
- (NSMutableDictionary *)getDicForId:(NSString *)objectId
                            forTable:(NSString *)tableName
                           forDBName:(NSString *)sqlitDBName;
/**
 *  字典中删除 一个值
 */
- (void)removeObjectForKey:(NSString *)key
                    withId:(NSString *)objectId
                  forTable:(NSString *)tableName
                 forDBName:(NSString *)sqlitDBName;

@end
