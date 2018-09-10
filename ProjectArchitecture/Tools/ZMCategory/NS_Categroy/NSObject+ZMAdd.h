//
//  NSObject+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZMAdd)
{

}
/**
 *  获取属性列表
 */
- (NSArray *)zm_propertyNameList;
/**
 *  获取方法列表
 */
- (NSArray *)zm_methodNameList;
/**
 *  获取成员变量列表：数组
 */
- (NSArray *)zm_ivarNameList;
/**
 *  获取成员变量列表：字典
 */
- (NSDictionary *)zm_ivarDic;

/**
 *  字典转模型方法
 */
+ (instancetype)zm_objectWithDict:(NSDictionary *)dict;
// 返回类的属性列表
+ (NSArray *)zm_propertyList;

- (BOOL)zm_isNotEmptyObject;

@end
