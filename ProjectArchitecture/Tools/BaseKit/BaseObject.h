//
//  BaseObject.h
//  HuiFang
//
//  Created by ZM on 15/12/25.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

// ============================"   常用属性  "==============================
// 类
#define PProperty_Object(NSObject,object)	@property (nonatomic, strong) NSObject* object
// NSString：字符串
#define PProperty_String(string)            @property (nonatomic, copy) NSString* string
// NSNumber：数类
#define PProperty_Number(_number)			@property (nonatomic, assign) NSNumber *_number
// CGFloat：浮点数
#define PProperty_Float(_float)				@property (nonatomic, assign) CGFloat *_float
// int：整数
#define PProperty_Int(_int)                 @property (nonatomic, assign) int _int
// BOOL
#define PProperty_BOOL(_bool)               @property (nonatomic, assign) BOOL _bool

// NSArray
#define PProperty_Array(Array)				@property (nonatomic, strong) NSArray *Array
// NSMutableArray
#define PProperty_MutArray(mutArray)		@property (nonatomic, strong) NSMutableArray *mutArray

@interface BaseObject : NSObject
{

}


@end
