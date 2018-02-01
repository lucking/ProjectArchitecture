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
+ (NSString *)getABwithA:(NSString *)A and:(NSString *)B;

// 去掉空格
+ (NSString *)removeStringEmpty:(NSString *)myStr;

// 删除字符串：开始位置  位数
- (NSString *)deleteStartNum:(int)startNum widthNum:(int)widthNum;

// 删除字符串：从最后一位开始删除 位数
- (NSString *)deleteCharactersNum:(int)num;

// 截取字符串：开始位置 位数
- (NSString *)cutStringStartNum:(int)startNum widthNum:(int)widthNum;

// 截取字符串：截取最后几位
- (NSString *)cutStringByEndWidthNum:(int)widthNum;

// 在已有字符串所指定的位置中 插入字符串
- (NSString *)insertStringTo:(NSString *)aString atIndex:(NSUInteger)atIndex;
// 判断一个字符串里是否包含了另一个字符串: strA是否包含strB
+ (BOOL)stringA:(NSString*)strA isContainStringB:(NSString*)strB;
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
+ (NSString *)cutString:(NSString *)info startString:(NSString *)startStrA endString:(NSString *)endStrB isContain:(BOOL)isContain;


// 方法二：判断中文
+ (BOOL)isIncludeChinese:(NSString *)string;
// 方法三：判断中文
+ (BOOL)isChineseString:(NSString*)mystring;

// 判断是否全是数字
+ (BOOL)isAllNumber:(NSString*)mystring;

// 判断是否全是字符
- (BOOL)isAllChar:(NSString*)mystring;

// 只能由数字和字符混合组成
+ (BOOL)isCharAndNumber:(NSString*)mystring;


#pragma mark //==========================="   计算字符串的尺寸  "===========================

// 计算高度_height：宽度固定
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width;
// 计算宽度_width：高度固定
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height;

//获取文本的尺寸
+ (CGSize)getTextSize:(NSString*)string Font:(UIFont*)myfont;


#pragma mark //==========================="   Json、Dic  "================================
// json格式字符串转字典：jsonString -> dic
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
// 字典转json格式字符串：dic -> jsonString
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;


#pragma mark //==========================="   URL的编码、解码  "============================
// URL编码
+ (NSString *)encodeToPercentEscapeString: (NSString *)input;
// URL解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *)input;

// 对中文_URL进行编码
+ (NSString *)encodeChineseToURLString:(NSString *)urlStr;

// 编码：UTF8中文
- (NSString *)encodingUTF8String;
// 解码：UTF8中文
- (NSString *)decodeUTF8String;

// 编码：ASCII中文
- (NSString *)encodingASCIIString;
// 解码：ASCII中文
- (NSString *)decodeASCIIString;



/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不空：@return YES
 */
- (BOOL)isNotEmpty:(NSString *)object;
// 判断是否为空
- (BOOL)isNull:(id)object;
// 转换为空串
+ (NSString*)convertNull:(id)object;
// 判断字符串是否为空
- (BOOL)isNotBlank;
// 判断id是否为空
+ (BOOL)isNotEmptyObject:(NSString *)object;


/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)getWeekFromDateStr;
//判断字符串是否为空
- (BOOL)isEmpty;
//去掉字符串空格,包括字符串内部空格
- (NSString *)trim;
//转换空字符为 @""
- (NSString *)convertEmpty;


#pragma mark //==========================="   判断字符串  "================================

// 是否全为英文字母
- (BOOL)isAllLetter;

// 是否全为数字
- (BOOL)isAllNum;

// 是否包含数字
- (BOOL)isContainNum;

// 是否包含特殊符号
- (BOOL)isContainSpecialString;

// 是否含有数字 或 特殊字符
- (BOOL)isIllegalString;

//忽略大小写比较字符串是否相等
- (BOOL)isIgnoreCaseEqualsToStr:(NSString *)str;




#pragma mark //==================="   验证邮箱、手机号、身份证、qq，银行卡、手机号处理   "=======================
//验证邮箱、手机号、身份证、qq
+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type;

// 验证邮箱
+ (BOOL)validateEmail:(NSString *)email;

//1.验证手机号_简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone;
//2.验证手机号_详细的判断方法
+ (BOOL)validateMyPhone:(NSString *)phone;

//身份证识别2 准确
+(BOOL)checkIDCardNum:(NSString*)cardNo;


#pragma mark //==========================="   特殊处理  "================================

// 把钱数改为万为单位
- (NSString *)convertMoneyToTenThousand:(id)money;

// 天数改为年
- (NSString *)convertDaysToYear:(id)days;

// 手机号空格
- (NSMutableString *)getPhoneEmpty:(NSString *)kaostring;

// 银行卡号空格
- (NSMutableString *)getBankNumEmpty:(NSString *)kaostring;

// 隐藏银行卡号中间位数统一显示：前4位后3位
- (NSString *)convertIDCard:(id)idCard;


//字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params;

@end
