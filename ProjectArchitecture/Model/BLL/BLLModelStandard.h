//
//  BLLModelStandard.h
//  ZMArchitecture
//
//  Created by ZM on 16/2/16.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "BaseObject.h"

/**
 *  BLL: 业务逻辑层(Business Logic Layer)
 */


//typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
//	UITableViewCellStyleDefault,
//	UITableViewCellStyleValue1,
//	UITableViewCellStyleValue2,
//	UITableViewCellStyleSubtitle
//};

// 枚举一
enum {
	Sex_Man,
	Sex_Woman
};
typedef NSUInteger Sex;

// 枚举二
typedef NS_ENUM(NSInteger,UserSex) {

	UserSex_Man,
	UserSex_Woman
};



@interface BLLModelStandard : BaseObject
{

}
@property (nonatomic,copy, readonly) NSString *Name;
@property (nonatomic,assign,readonly) NSInteger age;
@property (nonatomic,assign,readwrite) UserSex sex;


- (instancetype)initWithName:(NSString *)name age:(int)age sex:(UserSex)sex;


@end

















