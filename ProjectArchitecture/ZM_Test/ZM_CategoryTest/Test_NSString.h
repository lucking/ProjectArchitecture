//
//  ZM_NSStringTool.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test_NSString : NSObject

+ (Test_NSString *)shareSingleton;

// 字符串的：截取、分割、替换、拼接、移除、插入
-(void)test_Sting;

// 截取
- (void)test_cutString;
// 分割
- (void)test_SeparateString;
// 拼接
- (void)test_AppendingString;
// 替换\移除
- (void)test_ReplaceString;
// 删除
- (void)test_DeleteString;
// 插入
- (void)test_InsertString;

// 大小写转换
- (void)test_lower_upper_capitalize_String;
// 包含
- (void)test_ContainString;
// 相互转化：中文、UTF8、ASCII
- (void)test_Chinese_UTF8_ASCII;

// 是否包含，返回 所在的位置、宽度
+ (NSRange)myStr:(NSString*)myStr isContainRangeStringB:(NSString*)strB;


@end
