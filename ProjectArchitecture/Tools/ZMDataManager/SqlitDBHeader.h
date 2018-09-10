//
//  SqlitDBHeader.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/15.
//  Copyright © 2017年 ZM. All rights reserved.
//

#ifndef SqlitDBHeader_h
#define SqlitDBHeader_h

#pragma mark ======================="  数据库 管理  "=========================
// 数据库
#define SqlitDBName             @"Channel.db"

// 数据表
#define ChannelTableName        @"ChannelTableName" //
#define TopArrTableName         @"topArrTable"      //
#define BottomArrTableName      @"bottomArrTable"   //



/*
 * 自选股 stock
 */
#define StockSqlitDBName        @"StockSqlitDBName"
//本地存储的
#define OptionStockTableName   @"OptionStockTableName"
#define OptionCodeArrayId      @"OptionCodeArrayId"
//#define OptionNameArrayId      @"OptionNameArrayId"
//删除的个股（登录的时候使用）
#define RemoveOptionTable      @"RemoveOptionTable"
#define RemoveCodeArrayId      @"RemoveCodeArrayId"
//#define RemoveNameArrayId      @"RemoveNameArrayId"


//#define OptionStockArrayId      @"OptionStockArrayId"





#endif /* SqlitDBHeader_h */
