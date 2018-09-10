//
//  NSString+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// ============================"  格式化 数据类型  "==============================
#define  NNSStringInt(myInt)		[NSString stringWithFormat:@"%d",myInt]		// Int
#define  NNSStringFloat(myFloat)	[NSString stringWithFormat:@"%f",myFloat]	// Float
#define  NNSString2Float(myFloat)	[NSString stringWithFormat:@".2%f",myFloat]	// Float：保留两位小数

#define  NNSString(string)		[NSString stringWithFormat:@"%@",string]		// 1个NSString
#define  NNStringAB(AA,BB)		[NSString stringWithFormat:@"%@%@",AA,BB]		// 2个NSString 拼接
#define  NNStringABC(AA,BB,CC)	[NSString stringWithFormat:@"%@%@%@",AA,BB,CC]	// 3个NSString 拼接


// 验证邮箱、手机号、身份证、qq
typedef enum{
    VALIDATE_CHECK_EMAIL    =1,
    VALIDATE_CHECK_QQ       =2,
    VALIDATE_CHECK_MOBILE   =3,
    VALIDATE_CHECK_PASSWORD =4,
}VALIDATE_CHECK;


@interface NSString (ZMAdd)
{
    
}
// 字符串拼接
+ (NSString *)zm_getABwithA:(NSString *)A and:(NSString *)B;

// 去掉空格
+ (NSString *)zm_removeStringEmpty:(NSString *)myStr;

// 删除字符串：开始位置  位数
- (NSString *)zm_deleteStartNum:(int)startNum widthNum:(int)widthNum;
// 删除字符串：从最后一位开始删除 位数
- (NSString *)zm_deleteCharactersNum:(int)num;
// 截取字符串：(正序截取：开始位置,位数)
- (NSString *)zm_cutStringStartNum:(int)startNum widthNum:(int)widthNum;
// 截取字符串：(倒序截取：开始位置,位数)
- (NSString *)zm_cutStringByEndNum:(int)endNum widthNum:(int)widthNum;
// 截取字符串：截取最后几位
- (NSString *)zm_cutStringByEndWidthNum:(int)widthNum;
// 截取字符串：(开始位置 到最后)
- (NSString *)zm_cutStringToEndStartNum:(int)startNum;


// 在已有字符串所指定的位置中 插入字符串
- (NSString *)zm_insertStringTo:(NSString *)aString atIndex:(NSUInteger)atIndex;
// 判断一个字符串里是否包含了另一个字符串: strA是否包含strB
+ (BOOL)zm_stringA:(NSString*)strA isContainStringB:(NSString*)strB;
/**
 *  截取字符串：从检测到的第一个字符开始截取（可能会有多个相同的字符）
 *
 *  @param info      目的字符串
 *  @param startStrA  开始字符 (不是字符串)
 *  @param endStrB    结束字符 (不是字符串)
 *  @param isContain 是否包含：开始、结束字符
 *
 *  @return 截取的字符
 */
+ (NSString *)zm_cutString:(NSString *)info startString:(NSString *)startStrA endString:(NSString *)endStrB isContain:(BOOL)isContain;

/**
 通过分隔符，截取字符串，放入数组里
 
 @param myString 原字符串
 @param specialStr 分隔符
 @return 字符串数组
 */
+ (NSMutableArray *)zm_cutString:(NSString *)myString specialStr:(NSString *)specialStr;


// 方法二：判断中文
+ (BOOL)zm_isIncludeChinese:(NSString *)string;
// 方法三：判断中文
+ (BOOL)zm_isChineseString:(NSString*)mystring;
// 匹配包含中文：利用rangeOfString:option:直接查找
+ (BOOL)validateRangeContainsChinese:(NSString *)content;
// 谓词匹配包含中文
+ (BOOL)validateContainsChineseT:(NSString *)content;

// 判断：是否全是数字
+ (BOOL)zm_isAllNumber:(NSString*)mystring;
// 判断：是否全是字符
- (BOOL)zm_isAllChar:(NSString*)mystring;
// 只能由数字和字符混合组成
+ (BOOL)zm_isCharAndNumber:(NSString*)mystring;


#pragma mark //==========================="   计算字符串的尺寸  "===========================

// 计算高度_height：宽度固定
+ (float)zm_getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width;
// 计算宽度_width：高度固定
+ (float)zm_getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height;

//获取文本的尺寸
+ (CGSize)zm_getTextSize:(NSString*)string Font:(UIFont*)myfont;


#pragma mark //==========================="   Json、Dic  "================================
// json格式字符串转字典：jsonString -> dic
+ (NSDictionary *)zm_dictionaryWithJsonString:(NSString *)jsonString;
// 字典转json格式字符串：dic -> jsonString
+ (NSString*)zm_dictionaryToJson:(NSDictionary *)dic;


#pragma mark //==========================="   URL的编码、解码  "============================
// URL编码
+ (NSString *)zm_encodeToPercentEscapeString: (NSString *)input;
// URL解码
+ (NSString *)zm_decodeFromPercentEscapeString: (NSString *)input;

// 对中文_URL进行编码
+ (NSString *)zm_encodeChineseToURLString:(NSString *)urlStr;

// 编码：UTF8中文
- (NSString *)zm_encodingUTF8String;
// 解码：UTF8中文
- (NSString *)zm_decodeUTF8String;

// 编码：ASCII中文
- (NSString *)zm_encodingASCIIString;
// 解码：ASCII中文
- (NSString *)zm_decodeASCIIString;



/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不空：@return YES
 */
- (BOOL)zm_isNotEmpty:(NSString *)object;
// 判断是否为空
- (BOOL)zm_isNull:(id)object;
// 转换为空串
+ (NSString*)zm_convertNull:(id)object;
// 判断字符串是否为空
- (BOOL)zm_isNotBlank;
// 判断id是否为空
+ (BOOL)zm_isNotEmptyObject:(NSString *)object;


/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)zm_getWeekFromDateStr;
//判断字符串是否为空
- (BOOL)zm_isEmpty;
//去掉字符串空格,包括字符串内部空格
- (NSString *)zm_trim;
//转换空字符为 @""
- (NSString *)zm_convertEmpty;


#pragma mark //==========================="   判断字符串  "================================

// 是否全为英文字母
- (BOOL)zm_isAllLetter;

// 是否全为数字
- (BOOL)zm_isAllNum;

// 是否包含数字
- (BOOL)zm_isContainNum;

// 是否包含特殊符号
- (BOOL)zm_isContainSpecialString;

// 是否含有数字 或 特殊字符
- (BOOL)zm_isIllegalString;

//忽略大小写比较字符串是否相等
- (BOOL)zm_isIgnoreCaseEqualsToStr:(NSString *)str;




#pragma mark //==================="   验证邮箱、手机号、身份证、qq，银行卡、手机号处理   "=======================
// 验证邮箱、手机号、身份证、qq
+(BOOL)zm_validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type;

// 验证邮箱
+ (BOOL)zm_validateEmail:(NSString *)email;

//1.验证手机号_简单的判断方法
+ (BOOL)zm_validatePhone:(NSString *)phone;
//2.验证手机号_详细的判断方法
+ (BOOL)zm_validateMyPhone:(NSString *)phone;

//身份证识别2 准确
+(BOOL)zm_checkIDCardNum:(NSString*)cardNo;


#pragma mark //==========================="   特殊处理  "================================

// 把钱数改为万为单位
- (NSString *)zm_convertMoneyToTenThousand:(id)money;

// 天数改为年
- (NSString *)zm_convertDaysToYear:(id)days;

// 手机号空格
- (NSMutableString *)zm_getPhoneEmpty:(NSString *)kaostring;

// 银行卡号空格
- (NSMutableString *)zm_getBankNumEmpty:(NSString *)kaostring;

// 隐藏银行卡号中间位数统一显示：前4位后3位
- (NSString *)zm_convertIDCard:(id)idCard;

//字典排序_拼接url
+ (NSString *)zm_getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params;

@end
