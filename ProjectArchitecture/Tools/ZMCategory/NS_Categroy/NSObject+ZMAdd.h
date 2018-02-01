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
- (NSArray *)propertyNameList;
/**
 *  获取方法列表
 */
- (NSArray *)methodNameList;
/**
 *  获取成员变量列表：数组
 */
- (NSArray *)ivarNameList;
//  获取成员变量列表：字典
- (NSDictionary *)ivarDic;

/**
 *  字典转模型方法
 */
+ (instancetype)objectWithDict:(NSDictionary *)dict;
// 返回类的属性列表
+ (NSArray *)propertyList;

- (BOOL)isNotEmptyObject;

@end
