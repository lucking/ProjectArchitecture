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
PProperty_String(firstName);// 名
PProperty_String(lastName); // 姓
PProperty_String(name);     // 姓名
PProperty_Int(age);         // 年龄
PProperty_BOOL(sex);        // 性别
PProperty_String(month);    // 月份




@end
