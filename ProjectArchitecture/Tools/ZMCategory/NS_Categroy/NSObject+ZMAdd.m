//
//  NSObject+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NSObject+ZMAdd.h"
#import <objc/runtime.h>

@implementation NSObject (ZMAdd)

#pragma mark //======================="  以下为测试  "=================================

- (void)test
{
	/**  http://blog.sina.com.cn/s/blog_4930f8e60101h71b.html
	 *  NSURL *url = nil;
		Class  class = Nil;
		int *pointerInt = NULL;
		NSString* str = NULL;

	 // nil是一个对象指针为空，Nil是一个类指针为空，这里NULL是基本数据类型为空。这些可以理解为nil，Nil， NULL的区别吧。
	 // NSNull 对于像NSArray这样的类型，nil或NULL不能做为加到其中的Object，如果定义了一个NSArray，为其分配了内存，又想设置其中的内容为空，则可以用[NSNULL null】返回的对象来初始化NSArray中的内容
	 */
	id object = nil;
	if (object) {}		// 判断对象不为空
	if (object== nil) {}// 判断对象为空

	// 数组初始化，空值结束
	NSArray *array = [[NSArray alloc] initWithObjects:@"First", @"Second", nil];
	// 判断数组元素是否为空
	NSString *element = [array objectAtIndex:2];

	if ((NSNull *)element == [NSNull null]) {

	}
	[element zm_isNotEmptyObject];
}
#pragma mark //======================="  以下为可使用方法  "=================================

//获取对应类的：属性列表
- (NSArray *)zm_propertyNameListClass:(id)object {
    
    NSMutableArray* propertyNames = [[NSMutableArray alloc] init];
    unsigned int count;
    
    objc_property_t *propertyList = class_copyPropertyList([object class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        
        NSString* name = [NSString stringWithUTF8String:propertyName];
        [propertyNames addObject:name];
    }
    return propertyNames;
}

//获取属性列表
- (NSArray *)zm_propertyNameList {

	NSMutableArray* propertyNames = [[NSMutableArray alloc] init];
	unsigned int count;

	objc_property_t *propertyList = class_copyPropertyList([self class], &count);
	for (unsigned int i=0; i<count; i++) {
		const char *propertyName = property_getName(propertyList[i]);

		NSString* name = [NSString stringWithUTF8String:propertyName];
		[propertyNames addObject:name];
	}
	return propertyNames;
}
//获取方法列表
- (NSArray *)zm_methodNameList {

	NSMutableArray* methodNames = [[NSMutableArray alloc] init];
	unsigned int count;

	Method *methodList = class_copyMethodList([self class], &count);
	for (unsigned int i = 0; i<count; i++) {
		Method methodName = methodList[i];

		NSString* name = NSStringFromSelector(method_getName(methodName));
		[methodNames addObject:name];
	}
	return methodNames;
}
//获取成员变量列表：数组
- (NSArray *)zm_ivarNameList {

	NSMutableArray* ivarNames = [[NSMutableArray alloc] init];
	unsigned int count;

	Ivar *ivarList = class_copyIvarList([self class], &count);
	for (unsigned int i = 0; i<count; i++) {
		Ivar myIvar = ivarList[i];
        //获取Ivar的名称
		const char *ivarName = ivar_getName(myIvar);
		NSString* name = [NSString stringWithUTF8String:ivarName];
		[ivarNames addObject:name];
	}
	return ivarNames;
}

//获取成员变量列表：字典
- (NSDictionary *)zm_ivarDic {

    NSMutableDictionary* ivarDic = [[NSMutableDictionary alloc] init];
    unsigned int count;

    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Ivar myIvar = ivarList[i];
        //获取Ivar的名称
        const char *ivarName = ivar_getName(myIvar);
        //获取Ivar的类型
        const char *ivarType = ivar_getTypeEncoding(myIvar);
        NSString* name = [NSString stringWithUTF8String:ivarName];
        NSString* type = [NSString stringWithUTF8String:ivarType];
        [ivarDic setObject:name forKey:type];
    }
    return ivarDic;
}


#pragma mark 字典转模型方法
//KVC [obj setValuesForKeysWithDictionary:dict];
const char* propertiesKeyDemo = "propertiesKey";
+ (instancetype)zm_objectWithDict:(NSDictionary *)dict {
	id obj = [[self alloc] init];
	NSArray *properties = [self zm_propertyList];
	for (NSString *key in properties) {				// 遍历属性数组
		if (dict[key] != nil) {						// 判断字典中是否包含这个key
			[obj setValue:dict[key] forKeyPath:key];// 使用 KVC 设置数值
		}
	}
	return obj;
}
+ (NSArray *)zm_propertyList {

	// 0.判断是否存在关联对象，如果存在，直接返回
	NSArray *pList = objc_getAssociatedObject(self, propertiesKeyDemo);
	if (pList != nil) {
		return pList;
	}
	// 1.获取`类`的属性
	unsigned int count = 0;
	objc_property_t *list = class_copyPropertyList([self class], &count);
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
	// 遍历数组
	for (unsigned int i = 0; i < count; ++i) {

		objc_property_t pty = list[i];				// 获取到属性
		const char *cname = property_getName(pty);	// 获取属性的名称
		[arrayM addObject:[NSString stringWithUTF8String:cname]];
	}
	NSLog(@"arrayM = %@", arrayM);
	// 2.释放属性数组
	free(list);
	// 3.设置关联对象
	objc_setAssociatedObject(self, propertiesKeyDemo, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);

	return arrayM.copy;
}

- (BOOL)zm_isNotEmptyObject {
    if (!self) {
        return NO;
    }else if (self == nil) {
        return NO;
    }else if ([self isEqual:[NSNull null]]){
        return NO;
    }else if ([self isKindOfClass:[NSNull class]]){
        return NO;
    }else{
        return YES;
    }
}

@end



