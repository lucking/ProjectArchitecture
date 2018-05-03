//
//  Person.h
//  ZMArchitecture
//
//  Created by ZM on 16/1/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface Person : ZMBaseObject
{

}
@property (nonatomic, copy) NSString*(firstName);// 名
@property (nonatomic, copy) NSString*(lastName); // 姓
@property (nonatomic, copy) NSString*(name);     // 姓名
@property (nonatomic, assign) int age;         // 年龄
@property (nonatomic, assign) BOOL sex;        // 性别
@property (nonatomic, copy) NSString*(month);    // 月份



@end
