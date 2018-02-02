//
//  YTKKeyValueStore.m
//  Ape
//
//  Created by TangQiao on 12-11-6.
//  Copyright (c) 2012年 TangQiao. All rights reserved.
//

#import "YTKKeyValueStore.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabaseQueue.h"
#import "MJExtension.h"
#ifdef DEBUG
#define debugLog(...)    NSLog(__VA_ARGS__)
#define debugMethod()    NSLog(@"%s", __func__)
#define debugError()     NSLog(@"Error at %s Line:%d", __func__, __LINE__)
#else
#define debugLog(...)
#define debugMethod()
#define debugError()
#endif

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@implementation YTKKeyValueItem

- (NSString *)description {
    return [NSString stringWithFormat:@"id=%@, value=%@, timeStamp=%@", _itemId, _itemObject, _createdTime];
}

@end

@interface YTKKeyValueStore()

@property (strong, nonatomic) FMDatabaseQueue * dbQueue;
@property (nonatomic, copy) NSString *dbPath;

@end

@implementation YTKKeyValueStore

static NSString *const DEFAULT_DB_NAME = @"database.sqlite";

static NSString *const CREATE_TABLE_SQL =
@"CREATE TABLE IF NOT EXISTS %@ ( \
id TEXT NOT NULL, \
json TEXT NOT NULL, \
createdTime TEXT NOT NULL, \
PRIMARY KEY(id)) \
";

static NSString *const UPDATE_ITEM_SQL = @"REPLACE INTO %@ (id, json, createdTime) values (?, ?, ?)";

static NSString *const QUERY_ITEM_SQL = @"SELECT json, createdTime from %@ where id = ? Limit 1";

static NSString *const SELECT_ALL_SQL = @"SELECT * from %@";

static NSString *const CLEAR_ALL_SQL = @"DELETE from %@";

static NSString *const DELETE_ITEM_SQL = @"DELETE from %@ where id = ?";

static NSString *const DELETE_ITEMS_SQL = @"DELETE from %@ where id in ( %@ )";

static NSString *const DELETE_ITEMS_WITH_PREFIX_SQL = @"DELETE from %@ where id like ? ";




// 单列：2016.3.12 添加
+ (YTKKeyValueItem *)singleton
{
	static YTKKeyValueItem *instance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[self alloc] initDBWithName:@"ZM.db"];
	});
	return instance;
}



+ (BOOL)checkTableName:(NSString *)tableName {
    if (tableName == nil || tableName.length == 0 || [tableName rangeOfString:@" "].location != NSNotFound) {
        debugLog(@"ERROR, table name: %@ format error.", tableName);
        return NO;
    }
    return YES;
}

- (id)init {
    return [self initDBWithName:DEFAULT_DB_NAME];
}

- (id)initDBWithName:(NSString *)dbName {
    self = [super init];
    if (self) {
        NSString * dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:dbName];
		_dbPath = dbPath;
        debugLog(@"---> dbPath = %@", dbPath);
        if (_dbQueue) {
            [self close];
        }
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return self;
}

- (id)initWithDBWithPath:(NSString *)dbPath {
    self = [super init];
    if (self) {
		_dbPath = dbPath;
        debugLog(@"---> dbPath = %@", dbPath);
        if (_dbQueue) {
            [self close];
        }
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return self;
}

- (void)createTableWithName:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:CREATE_TABLE_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to create table: %@", tableName);
    }
}

- (BOOL)isTableExists:(NSString *)tableName{
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return NO;
    }
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db tableExists:tableName];
    }];
    if (!result) {
        debugLog(@"ERROR, table: %@ not exists in current DB", tableName);
    }
    return result;
}

- (void)clearTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:CLEAR_ALL_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to clear table: %@", tableName);
    }
}

- (void)putObject:(id)object withId:(NSString *)objectId intoTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSError * error;
    NSData * data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    if (error) {
        debugLog(@"ERROR, faild to get json data");
        return;
    }
    NSString * jsonString = [[NSString alloc] initWithData:data encoding:(NSUTF8StringEncoding)];
    NSDate * createdTime = [NSDate date];
    NSString * sql = [NSString stringWithFormat:UPDATE_ITEM_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, objectId, jsonString, createdTime];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to insert/replace into table: %@", tableName);
    }
}

- (id)getObjectById:(NSString *)objectId fromTable:(NSString *)tableName {
    YTKKeyValueItem * item = [self getYTKKeyValueItemById:objectId fromTable:tableName];
    if (item) {
        return item.itemObject;
    } else {
        return nil;
    }
}

- (YTKKeyValueItem *)getYTKKeyValueItemById:(NSString *)objectId fromTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return nil;
    }
    NSString * sql = [NSString stringWithFormat:QUERY_ITEM_SQL, tableName];
    __block NSString * json = nil;
    __block NSDate * createdTime = nil;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * rs = [db executeQuery:sql, objectId];
        if ([rs next]) {
            json = [rs stringForColumn:@"json"];
            createdTime = [rs dateForColumn:@"createdTime"];
        }
        [rs close];
    }];
    if (json) {
        NSError * error;
        id result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:(NSJSONReadingAllowFragments) error:&error];
        if (error) {
            debugLog(@"ERROR, faild to prase to json");
            return nil;
        }
        YTKKeyValueItem * item = [[YTKKeyValueItem alloc] init];
        item.itemId = objectId;
        item.itemObject = result;
        item.createdTime = createdTime;
        return item;
    } else {
        return nil;
    }
}

- (void)putString:(NSString *)string withId:(NSString *)stringId intoTable:(NSString *)tableName {
    if (string == nil) {
        debugLog(@"error, string is nil");
        return;
    }
    [self putObject:@[string] withId:stringId intoTable:tableName];
}

- (NSString *)getStringById:(NSString *)stringId fromTable:(NSString *)tableName {
    NSArray * array = [self getObjectById:stringId fromTable:tableName];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return array[0];
    }
    return nil;
}

- (void)putNumber:(NSNumber *)number withId:(NSString *)numberId intoTable:(NSString *)tableName {
    if (number == nil) {
        debugLog(@"error, number is nil");
        return;
    }
    [self putObject:@[number] withId:numberId intoTable:tableName];
}

- (NSNumber *)getNumberById:(NSString *)numberId fromTable:(NSString *)tableName {
    NSArray * array = [self getObjectById:numberId fromTable:tableName];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return array[0];
    }
    return nil;
}

- (NSArray *)getAllItemsFromTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return nil;
    }
    NSString * sql = [NSString stringWithFormat:SELECT_ALL_SQL, tableName];
    __block NSMutableArray * result = [NSMutableArray array];
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            YTKKeyValueItem * item = [[YTKKeyValueItem alloc] init];
            item.itemId = [rs stringForColumn:@"id"];
            item.itemObject = [rs stringForColumn:@"json"];
            item.createdTime = [rs dateForColumn:@"createdTime"];
            [result addObject:item];
        }
        [rs close];
    }];
    // parse json string to object
    NSError * error;
    for (YTKKeyValueItem * item in result) {
        error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:[item.itemObject dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:(NSJSONReadingAllowFragments) error:&error];
        if (error) {
            debugLog(@"ERROR, faild to prase to json.");
        } else {
            item.itemObject = object;
        }
    }
    return result;
}

- (void)deleteObjectById:(NSString *)objectId fromTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:DELETE_ITEM_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, objectId];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete item from table: %@", tableName);
    }
}

- (void)deleteObjectsByIdArray:(NSArray *)objectIdArray fromTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSMutableString *stringBuilder = [NSMutableString string];
    for (id objectId in objectIdArray) {
        NSString *item = [NSString stringWithFormat:@" '%@' ", objectId];
        if (stringBuilder.length == 0) {
            [stringBuilder appendString:item];
        } else {
            [stringBuilder appendString:@","];
            [stringBuilder appendString:item];
        }
    }
    NSString *sql = [NSString stringWithFormat:DELETE_ITEMS_SQL, tableName, stringBuilder];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete items by ids from table: %@", tableName);
    }
}

- (void)deleteObjectsByIdPrefix:(NSString *)objectIdPrefix fromTable:(NSString *)tableName {
    if ([YTKKeyValueStore checkTableName:tableName] == NO) {
        return;
    }
    NSString *sql = [NSString stringWithFormat:DELETE_ITEMS_WITH_PREFIX_SQL, tableName];
    NSString *prefixArgument = [NSString stringWithFormat:@"%@%%", objectIdPrefix];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, prefixArgument];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete items by id prefix from table: %@", tableName);
    }
}

- (void)close {
    [_dbQueue close];
    _dbQueue = nil;
}


#pragma mark//======================="  ZM_Add 添加更多可使用方法  "=================================

//ZM_Add >> 存入单个模型
- (void)putModelObject:(id)object withId:(NSString *)objectId intoTable:(NSString *)tableName
{
    NSDictionary *dic = [object mj_keyValues]; // 模型 -> 字典
    [self putObject:dic withId:objectId intoTable:tableName];
}
//ZM_Add >> 存入数组：一个Model一个Id
- (void)putModelObjectArray:(NSArray *)objectArray withIdArray:(NSArray *)objectIdArray intoTable:(NSString *)tableName
{
    if ([objectArray count] == 0) {
        return;
    }
    if ([objectIdArray count] != [objectArray count]) {
        return;
    }
    for (int i = 0; i < [objectArray count]; i++) {
        [self putModelObject:objectArray[i] withId:objectIdArray[i] intoTable:tableName];
    }
}
//ZM_Add >> 存入数组：只用一个Id
- (void)putModelObjectArray:(NSArray *)objectArray intoTable:(NSString *)tableName
{
	if ([objectArray count] == 0) {
		return;
	}
	NSString *countKey = [NSString stringWithFormat:@"%@Key",tableName];
	NSString *arrayCount = [NSString stringWithFormat:@"%ld",(unsigned long)[objectArray count]];
	[self putString:arrayCount withId:countKey intoTable:tableName];

	NSLog(@"-----> arrayCount = %@",arrayCount);

	for (int i = 0; i < [objectArray count]; i++) {
		NSString* Id = [NSString stringWithFormat:@"%d",i];
		[self putModelObject:objectArray[i] withId:Id intoTable:tableName];
	}
}


//ZM_Add << 根据一个Id取出一个模型对象
- (id)getModelObjectById:(NSString *)objectId className:(Class)className fromTable:(NSString *)tableName
{
    NSDictionary *dic = [self getObjectById:objectId fromTable:tableName];
    return [className mj_objectWithKeyValues:dic]; // 字典 -> 模型
    
}
//ZM_Add << 根据一个表名取出一个数组模型对象
- (id)getModelArrayByclassName:(Class)className fromTable:(NSString *)tableName
{
	NSMutableArray* objectArray = [[NSMutableArray alloc] init];

	NSString *countKey = [NSString stringWithFormat:@"%@Key",tableName];
	NSInteger arrayCount = [[self getStringById:countKey fromTable:tableName] integerValue];
	NSLog(@"-----> arrayCount = %ld",(long)arrayCount);

	for (int i = 0; i < arrayCount; i++) {
		NSString* objectId = [NSString stringWithFormat:@"%d",i];
		NSDictionary *dic = [self getObjectById:objectId fromTable:tableName];

		id Model = [className mj_objectWithKeyValues:dic];
		[objectArray addObject:Model];
	}
	return objectArray;
}
//ZM_Add 获取一定范围的数据
- (NSArray *)getItemsFromTable:(NSString *)tableName withRange:(NSRange)range {

	if ([YTKKeyValueStore checkTableName:tableName] == NO) {
		return nil;
	}

	NSString * sql = [NSString stringWithFormat:@"SELECT * FROM %@ LIMIT %lu, %lu",tableName, (unsigned long)range.location, (unsigned long)range.length];
	__block NSMutableArray * result = [NSMutableArray array];
	[_dbQueue inDatabase:^(FMDatabase *db) {
		FMResultSet * rs = [db executeQuery:sql];
		while ([rs next]) {
			YTKKeyValueItem * item = [[YTKKeyValueItem alloc] init];
			item.itemId = [rs stringForColumn:@"id"];
			item.itemObject = [rs stringForColumn:@"json"];
			item.createdTime = [rs dateForColumn:@"createdTime"];
			[result addObject:item];
		}
		[rs close];
	}];
	// json解析为 object
	NSError * error;
	for (YTKKeyValueItem * item in result) {
		error = nil;
		id object = [NSJSONSerialization JSONObjectWithData:[item.itemObject dataUsingEncoding:NSUTF8StringEncoding]
													options:(NSJSONReadingAllowFragments) error:&error];
		if (error) {
			debugLog(@"错误,json解析失败");
		} else {
			item.itemObject = object;
		}
	}
	return result;
}
//ZM_Add 表是否存在
- (BOOL)isExistTableWithName:(NSString *)tableName
{
	__block BOOL result;
	[_dbQueue inDatabase:^(FMDatabase *db) {
		FMResultSet * rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
		while ([rs next])
		{
			NSInteger count = [rs intForColumn:@"count"];
			if (0 == count){
				result = NO;
			}else{
				result = YES;
			}
		}
	}];
	return result;
}
//ZM_Add  删除表
- (BOOL)deleteTable:(NSString *)tableName
{
	__block BOOL result;
	[_dbQueue inDatabase:^(FMDatabase *db) {
		NSString *sqlstr = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
		if (![db executeUpdate:sqlstr])
		{
			debugLog(@"删除表错误!");
			result = NO;
		}
		result = YES;
	}];
	return result;
}
//ZM_Add  删除数据库
- (void)deleteDatabseWithDBName:(NSString *)DBName
{
	__block BOOL success;
	__block NSError *error;

	NSFileManager *fileManager = [NSFileManager defaultManager];

	// 删除旧数据库文件信息
	if ([fileManager fileExistsAtPath:DBName])
		{
		[_dbQueue inDatabase:^(FMDatabase *db) {
			[db close];
			success = [fileManager removeItemAtPath:DBName error:&error];
			if (!success) {
				NSAssert1(0, @"旧数据库文件信息删除失败 '%@'.", [error localizedDescription]);
			}
		}];
		}
}

//ZM_Add 获取表库的路径
- (NSString *)getDBPath {
	return _dbPath;
}

@end
