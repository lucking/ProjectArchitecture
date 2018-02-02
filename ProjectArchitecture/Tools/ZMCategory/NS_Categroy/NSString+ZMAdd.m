//
//  NSString+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NSString+ZMAdd.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (ZMAdd)

/**
 *  使用方法
 */
- (void)useMethod{
    
    // 特殊字符 \转义字符
    NSLog(@"---> 特殊字符 =  '' @  \" \" Click ");
    
    NSString *string_11 = NSLocalizedString(@"内容", @"解释说明");
    NSString *string_22 = NSLocalizedString(@"Loading...", @"HUD loading title");
    NSLog(@"---> string_11 = %@",string_11);
    NSLog(@"---> string_22 = %@",string_22);

    
    //替换
    NSString *str = @"Replacing/";
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"\\"];
    NSLog(@"---> str = %@",str);

    
    
    NSLog(@"\n \n \n ");
    NSString* aa = @"SDFADF",   *bb = @"s dfa sf_aff_sfag";
    NSLog(@"字符串拼接 = %@",[NSString getABwithA:aa and:bb]);
    
    NSLog(@"去掉空格后 = %@",[NSString removeStringEmpty:bb]);
    
    // 判断一个字符串里是否包含了另一个字符串: myString是否包含strA
    NSString* string = @"HomeDirectoryPath holle world girls";
    NSString* strA = @"girlds";
    NSLog(@" isContainStringA = %d",[NSString stringA:strA isContainStringB:string]);
    
    
    NSString* ssssa = @"魏一平";
    [NSString isChineseString:ssssa];
    NSString* str1 = @"魏 一 平ads2  ,.,[sadf";
    
    NSLog(@"---> trim = %@",[str1 trim]);
    NSLog(@"---> isAllLetter = %d",[@"asdfia  bjJASDFAJN" isAllLetter]);
    
    NSLog(@"---> isAllNum = %d",[@"112344,3" isAllNum]);
    NSLog(@"---> isContainNum = %d",[str1 isContainNum]);
    
    NSLog(@"---> isContainSpecialString = %d",[str1 isContainSpecialString]);
    NSLog(@"---> isIllegalString = %d \n \n ",[str1 isIllegalString]);
    
}

//字符串的：截取、分割、替换、拼接、移除、插入
-(void)changeSting
{
    // 如下只是是一个截取办法，不同截取的方法都能达到目的！！！
    NSString *str=@"1234567890abcdefgABCDEFG";
    
#pragma mark 1.截取_后几位 （从指定的字符串开始到尾部）
#pragma mark
    NSLog(@"--->1: 从指定位置到尾部：%@",[str substringFromIndex:7]);
    
    
#pragma mark 2.截取_前几位 （是开始位置截取到指定位置但是不包含指定位置）
#pragma mark
    NSLog(@"--->2: 截取前几位：%@",[str substringToIndex:12]);
    
    
#pragma mark 3.截取_指定宽度   按照给定的NSRang字符串截取字符串的：（开始位置，宽度）
#pragma mark
    NSLog(@"--->3: 从指定位置截取制定的宽度：%@",[str substringWithRange:NSMakeRange(5,8)]);
    
    
    
#pragma mark 4.分割
#pragma mark
    NSString *str1=@"11=22=33=44";
    NSArray *arry=[str1 componentsSeparatedByString:@"="];
    NSLog(@"--->4: 分割_arry：%@",arry);
    NSLog(@"--->4: 输出第0个：%@ ",[arry objectAtIndex:0]);
    NSLog(@"--->4: 输出第1个：%@ ",[arry objectAtIndex:1]);
    NSLog(@"--->4: 输出第2个：%@ ",[arry objectAtIndex:2]);
    NSLog(@"--->4: 输出第3个：%@ \n ",[arry objectAtIndex:3]);
    //2017-05-18 11:02:06.373 ProjectArchitecture[6253:100399] --->4: 输出第0个：11
    //2017-05-18 11:02:06.374 ProjectArchitecture[6253:100399] --->4: 输出第1个：22
    //2017-05-18 11:02:06.374 ProjectArchitecture[6253:100399] --->4: 输出第2个：33
    //2017-05-18 11:02:06.374 ProjectArchitecture[6253:100399] --->4: 输出第3个：44
    
    
#pragma mark 5.拼接
#pragma mark
    NSString* string1= @"str1 ";
    NSString* string2= @"str2";
    NSString* String= [string1 stringByAppendingFormat:@"%@",string2];
    NSLog(@"--->5: 拼接：%@",String);
    
    //尾部追加字符串
    NSMutableString *str5= [[NSMutableString alloc] initWithString:@"ABCDEFG_"];
    [str5 appendString:@"12345"];
    NSLog(@"--->5: 追加字符串：%@ \n ",str5);
    
    
#pragma mark 6.替换
#pragma mark
    NSString *str6 = @"Hello world!";
    str6 =[str6 stringByReplacingOccurrencesOfString:@"world" withString:@"India"];
    NSLog(@"--->6: 替换：%@ \n ",str6);
    //复制代码你将会看到输入 Hello India
    
    
#pragma mark 7.移除：以空格替换
#pragma mark
    NSString* cutString=@"cut_STring";
    NSString* cutResult=[cutString stringByReplacingOccurrencesOfString:@"_S" withString:@""];
    NSLog(@"--->7: 移除：%@ ",cutResult);
    
    //去除字符串首尾的空格和换行符
    NSString *str7= @"   I love China \n ";
    str7= [str7 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"--->7: 去除字符串首尾的空格和换行符：%@ \n ",str7);
    
    
#pragma mark 8.删除字符串：(开始位置，删除个数)
#pragma mark
    NSMutableString* str8= [[NSMutableString alloc] initWithString:@"123456789"];
    [str8 deleteCharactersInRange:NSMakeRange(2,5)];
    NSLog(@"--->8: 删除字符串: %@ \n ",str8);
    
    [str8 deleteCharactersInRange:NSMakeRange(str8.length,1)];
    
    
    
#pragma mark 9.在已有字符串所指定的位置中 插入字符串
#pragma mark
    //-insertString: atIndex:
    NSString* date=@"20150421";
    NSMutableString *timestr = [[NSMutableString alloc] initWithString:date];
    [timestr insertString:@"-" atIndex:4];
    [timestr insertString:@"-" atIndex:7];
    NSLog(@"--->9: 插入：%@ \n ",timestr);
    
    
#pragma mark 10.字符串大小写转换
#pragma mark
    NSString *strLow = @"This is a lowerCaseString!";
    [strLow lowercaseString];
    NSLog(@"--->10: 全部小写：%@ ", [strLow lowercaseString]);
    
    NSString *strUpper= @"This is a upperCaseString!";
    [strUpper uppercaseString];
    NSLog(@"--->10: 全部大写：%@", [strUpper uppercaseString]);
    
    //首字母大写
    NSString* str9= @"aaaaaa";
    NSLog(@"--->10: 首字母大写：%@  \n ",[str9 capitalizedString]);
    
    
    
    
#pragma mark 11.判断是否包含：前缀、后缀
#pragma mark
    NSString *string= @"I love China";
    BOOL isHasI=    [string hasPrefix:@"I"];
    BOOL isHasChina=[string hasSuffix:@"China"];
    NSLog(@"--->11: 是否包含前缀1：%d ",isHasI);
    NSLog(@"--->11: 是否包含后缀2：%d \n ",isHasChina);
    
    //
    NSString *str12= @"1234567890ABCDEFGHIJKLMN!";
    NSString *subToString = [str12 substringToIndex:6];     //从首位到第六位，共截取前六位
    
    NSString *subFromString = [str12 substringFromIndex:6]; //从第六后面，第七位开始截取，一直截取到最后一位
    
    NSString *rangeString = [str12 substringWithRange:NSMakeRange(6, 3)]; //从第六后面，共截取3位
    
    // NSString *str12A= @"This is a string";
    // NSString *str12B= @"string";
    
    // NSRange range123= [str12A rangeOfString:str12B].location;
    // NSRange range123= [str12A rangeOfString:str12B];
    
    NSLog(@"--->12: subToString  ：%@ ",subToString);
    NSLog(@"--->12: subFromString：%@ ",subFromString);
    NSLog(@"--->12: rangeString  ：%@ ",rangeString);
    //    NSLog(@"--->12: range123     ：%@ ",range123);
    
    
    
    // 汉字与UTF8相互转化:
    // 汉字 to UTF8
    NSString* strA = [@"中国万岁" encodingUTF8String];
    NSLog(@"-----> strA = %@ ",strA);
    
    // UTF8 to 汉字
    NSString* strB = [strA decodeUTF8String];
    NSLog(@"-----> strB = %@ \n ",strB);
    
    
    
    // 中文与ASCII相互转化:
    // 汉字 to ASCII
    NSString* strC = [@"湖南省岳阳市岳阳楼High" encodingASCIIString];
    NSLog(@"---> strC = %@ ",strC);
    
    // ASCII to 汉字
    NSString* strD = [strC decodeASCIIString];
    NSLog(@"---> strD = %@ \n ",strD);

    
    // 在已有字符串所指定的位置中 插入字符串
    NSLog(@"intValue = %d", [@"02" intValue]);
    NSLog(@"插入后 = %@ ", [@"2017-3" insertStringTo:@"0as" atIndex:5]);
    NSLog(@"插入后 = %@ ", [@"2" insertStringTo:@"0" atIndex:0]);
    NSLog(@"插入后 = %@ \n ", [@"aaaa-zz" insertStringTo:@"0022" atIndex:5]);
    
    
}


// 字符串拼接
+ (NSString *)getABwithA:(NSString *)A and:(NSString *)B
{
    return [A stringByAppendingString:B];
}

// 去掉空格
+ (NSString *)removeStringEmpty:(NSString *)myStr
{
    if (myStr!=nil) {
        NSString* str = [myStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        return str;
    }
    return nil;
}



/**
 * 删除字符串
 @param startNum 开始位置
 @param widthNum 位数
 */
- (NSString *)deleteStartNum:(int)startNum widthNum:(int)widthNum
{
    NSMutableString* mutStr= [[NSMutableString alloc] initWithString:self];
    [mutStr deleteCharactersInRange:NSMakeRange(startNum, widthNum)];
    return mutStr;
}
// 从最后一位开始删除：num 删除的位数
- (NSString *)deleteCharactersNum:(int)num
{
    NSMutableString* mutStr= [[NSMutableString alloc] initWithString:self];
    [mutStr deleteCharactersInRange:NSMakeRange(mutStr.length-num,num)];
    return mutStr;
}


/**
 * 截取字符串：(开始位置,位数)
 @param startNum 开始位置
 @param widthNum 位数
 */
- (NSString *)cutStringStartNum:(int)startNum widthNum:(int)widthNum {
    
    return [self substringWithRange:NSMakeRange(startNum, widthNum)];
}
//截取字符串：截取最后几位  widthNum 位数
- (NSString *)cutStringByEndWidthNum:(int)widthNum {
    
    return [self substringWithRange:NSMakeRange(self.length-widthNum, widthNum)];
}


/**
  在已有字符串所指定的位置中 插入字符串

 @param aString 插入的字符串
 @param atIndex 从指定的位置开始插入
 @return 插入后的字符串
 */
- (NSString *)insertStringTo:(NSString *)aString atIndex:(NSUInteger)atIndex {
    
    NSMutableString *getStr = [[NSMutableString alloc] initWithString:self];
    [getStr insertString:aString atIndex:atIndex];
    return getStr;
}




// 判断一个字符串里是否包含了另一个字符串: strA是否包含strB
/**
 *  @param strB 原字符串
 *  @param strA 被包含的字符串
 */
+ (BOOL)stringA:(NSString*)strA isContainStringB:(NSString*)strB
{
    if ([strA rangeOfString:strB].location != NSNotFound) {
        return YES;
    }
    return NO;
}


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
+ (NSString *)cutString:(NSString *)info startString:(NSString *)startStrA endString:(NSString *)endStrB isContain:(BOOL)isContain {
    
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:info];
    NSRange textRang1 = [[noteStr string] rangeOfString:startStrA];
    NSRange textRang2 = [[noteStr string] rangeOfString:endStrB];
    
    NSRange cutRange;
    if (isContain) {
        cutRange = NSMakeRange(textRang1.location, textRang2.location -textRang1.location+1);
    }else{
        cutRange = NSMakeRange(textRang1.location+1, textRang2.location -textRang1.location-1);
    }
    
    NSString* backString = nil;
    if ( [info rangeOfString:startStrA].location == NSNotFound ) {
        backString = @"目的字符串_找不到_开始截取的字符";
        
    }else if ([info rangeOfString:endStrB].location == NSNotFound ){
        backString = @"目的字符串_找不到_结束截取的字符";
        
    }else if ( ([info rangeOfString:startStrA].location == NSNotFound) && [info rangeOfString:endStrB].location == NSNotFound) {
        backString = @"目的字符串_找不到_开始和结束的字符";
        
    }else{
        backString = [info substringWithRange:cutRange];  //(共截取的范围)
    }
    return backString;
}


// 方法二：判断中文
+ (BOOL)isIncludeChinese:(NSString *)string {
    int countEng = 0;
    for (int i = 0; i < string.length; i++) {
        int chr = [string characterAtIndex:i];
        if ((chr >= 0x4e00 && chr <= 0x9fff)) {
            
        } else {
            countEng++;
        }
    }
    if (countEng > 0) {
        return NO;
    }else{
        return YES;
    }
}


// 方法三：判断中文
+ (BOOL)isChineseString:(NSString*)mystring
{                                                       //点
    // NSString *regex = @"[\u4e00-\u9fa5][\u4e00-\u9fa5][\u00b7]+";
    NSString *regex = @"([\u4e00-\u9fa5][\u4e00-\u9fa5]+)|([\u00b7])";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([pred evaluateWithObject:mystring]){ NSLog(@"是中文");
        return YES;
    }else{									NSLog(@"不是中文");
        return NO;
    }
}


// 判断是否全是数字
+ (BOOL)isAllNumber:(NSString*)mystring
{
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange Range = [mystring rangeOfCharacterFromSet:disallowedCharacters];
    
    if (mystring.length>0) {
        if (Range.location == NSNotFound){
            return YES;
            
        }else return NO;
    }else return NO;
}


// 判断是否全是字符
- (BOOL)isAllChar:(NSString*)mystring
{
    NSCharacterSet *CharSet1= [[NSCharacterSet characterSetWithCharactersInString:@"QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range = [mystring rangeOfCharacterFromSet:CharSet1];
    
    if (mystring.length>0) {
        if (Range.location == NSNotFound) {
            return YES;
            
        }else return NO;
    }else return NO;
}

// 只能由数字和字符混合组成
+ (BOOL)isCharAndNumber:(NSString*)mystring
{
    //   NSString *mystring = @"Letter123";
    // 数字和字符混合组成 (不能有特殊符号，不能有空格)
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range = [mystring rangeOfCharacterFromSet:disallowedCharacters];
    // 不能全是数字
    NSCharacterSet *CharSet1= [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange Range1= [mystring rangeOfCharacterFromSet:CharSet1];
    // 不能全是字母
    NSCharacterSet *CharSet2 = [[NSCharacterSet characterSetWithCharactersInString:@"QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range2= [mystring rangeOfCharacterFromSet:CharSet2];
    
    NSLog(@"---> mystring.length：%lu",(unsigned long)mystring.length);
    if (Range.location == NSNotFound){          //只能由数字和字符混合组成
        if (Range1.location != NSNotFound) {    //不能全是数字
            if (Range2.location != NSNotFound) {//不能全是字母
                
                return YES;
                
            }else return NO;
        }else return NO;
    }else return NO;
}


//==========================="   尺寸   "================================
/**
 *  计算字符串的尺寸高度_height：宽度固定
 *  @return 高度
 */
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    
    //NSLog(@"-----> fontSize.height: %f \n ",mySize.height);
    float height= mySize.height + 1;// ＋1 防止四舍五入
    return height;

}
/**
 *  计算字符串的尺寸宽度_width：高度固定
 *  @return 宽度
 */
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont Height:(float)height
{
    NSDictionary *attributeDic = @{NSFontAttributeName:myfont};
    CGSize size = [string sizeWithAttributes:attributeDic];
    CGSize getSize = CGSizeMake(ceilf(size.width), ceilf(height));
    
    return getSize.width;
}

//获取文本的尺寸
+ (CGSize)getTextSize:(NSString*)string Font:(UIFont*)myfont
{
    NSDictionary *attributeDic = @{NSFontAttributeName:myfont,
                                   NSStrokeColorAttributeName: [UIColor greenColor],
                                   NSForegroundColorAttributeName:[UIColor greenColor]};
    
    CGSize size = [string sizeWithAttributes:attributeDic];
    CGSize getSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    NSLog(@"getSize= %@",NSStringFromCGSize(getSize));
    NSLog(@"width = %f",getSize.width);
    NSLog(@"height= %f",getSize.height);
    
    return getSize;
}


// json格式字符串转字典：jsonString -> dic
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
// 字典转json格式字符串：dic -> jsonString
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


// 对URL进行编码
// 字符串中如果含有：/?#[]@!$&’()*+,;= 这些字符时候，这些字符需要被转化，以免与语法冲突，用“%+ASCII” 代替之。
+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)input,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return outputStr;
}
// 对URL进行解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

// 对中文_URL进行编码
+ (NSString *)encodeChineseToURLString:(NSString *)urlStr
{
    //3. 中文编码：
    ///urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    //同上
    return [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


// 编码：UTF8中文
- (NSString *)encodingUTF8String {
    
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
// 解码：UTF8中文
- (NSString *)decodeUTF8String {
    
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//string = @"湖南省岳阳市岳阳楼区High";
// 编码：ASCII中文
- (NSString *)encodingASCIIString {
    
    NSData *encodeData = [self dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *encodeStr = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
    //NSLog(@"---> encode_ASCII_Str = %@", encodeStr);
    return encodeStr;
}
// 解码：ASCII中文
- (NSString *)decodeASCIIString {
    
    NSData *decodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSNonLossyASCIIStringEncoding];
    //NSLog(@"---> decode_ASCII_Str = %@", decodeStr);
    return decodeStr;
}


/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不为空：@return YES
 */
- (BOOL)isNotEmpty:(NSString *)object {
    
    if (!object) {
        return NO;
    }
    else if ([object isEqualToString:@""]) {
        return NO;
    }
    else if (object.length == 0) {
        return NO;
    }
    else if (object == nil) {
        return NO;
    }
    else if (object && [object isEqual:[NSNull null]]){
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return NO;
    }
    else if ([object isEqualToString:@"<null>"]){
        return NO;
    }
    else if ([[object lowercaseString] isEqualToString:@"null"]){
        return NO;
    }
    return YES;
}
// 判断是否为空
- (BOOL)isNull:(id)object
{
    if (!object) {
        return YES;
    }
    else if (object && [object isEqual:[NSNull null]]){
        return YES;
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return YES;
    }
    else if (object == nil) {
        return YES;
    }else if ([[self lowercaseString] isEqualToString:@"null"]){
        return YES;
    }
    return NO;
}
// 转换为空串
+(NSString*)convertNull:(id)object
{
    if (!object) {
        return @"";
    }
    if (!object || [object isEqual:[NSNull null]]){
        return @"";
    }else if ([object isKindOfClass:[NSNull class]]){
        return @"";
    }else if (object == nil) {
        return @"";
    }
    
    return object;
}

//判断字符串是否为空
- (BOOL)isNotBlank {
    
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}
+ (BOOL)isNotEmptyObject:(NSString *)object {
    if (!object) {
        return NO;
    }
    else if (object == nil) {
        return NO;
    }
    else if ([object isEqual:[NSNull null]]){
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return NO;
    }
    return YES;
}


/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)getWeekFromDateStr {
    
    if ([self isEmpty]) {
        return -1;
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter *forMat = [[NSDateFormatter alloc] init];
    [forMat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dat = [forMat dateFromString:self];
    
    NSInteger unitFlagas = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlagas fromDate:dat];
    NSInteger weekday = [comps weekday]; //注意：周日是1，周一是2
    return weekday;
}




//判断字符串是否为空
- (BOOL)isEmpty {
    
    if (self==nil || [[self trim] length] == 0 || [[self lowercaseString] isEqualToString:@"null"]) {
        return YES;
    }else{
        return NO;
    }
}
//去掉字符串空格,包括字符串内部空格
- (NSString *)trim {
    
    NSString * str ;
    if(self == nil){
        str = @"";
    }else{
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        
        NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        
        str = [filteredArray componentsJoinedByString:@""];
    }
    return str;
}
//转换空字符为 @""
- (NSString *)convertEmpty {
    
    if (self == nil || [[self trim ] length] == 0 || [[self lowercaseString] isEqualToString:@"null"]) {
        return @"";
    }else{
        return self;
    }
}


#pragma mark //==========================="   判断字符串  "================================

#pragma mark 是否全为英文字母：含有英文字母，返回YES,否则返回NO
- (BOOL)isAllLetter {
    
    for (int i = 0; i < [self length]; i++) {
        if (!isalpha([self characterAtIndex:i])) {
            return NO;
        }
    }
    return YES;
}

#pragma mark 是否全为数字：全为数字返回YES，否则返回NO
- (BOOL)isAllNum {
    
    if([[self convertEmpty] length]==0){
        return NO;
    }
    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] < '0' || [self characterAtIndex:i] > '9') {
            return NO;
        }
    }
    return YES;
}
// 是否包含数字：含有数字，返回YES,否则返回NO
- (BOOL)isContainNum {
    
    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] >= '0' && [self characterAtIndex:i] <= '9') {
            return YES;
        }
    }
    return NO;
}
// 是否包含特殊符号：包含特殊符号，返回YES,否则返回NO
- (BOOL)isContainSpecialString {
    
    NSString *notSecureStr = @"~!@#$%^&*()_+[{]}\\|;:'\",<.>/?";
    
    for (int i = 0; i < [notSecureStr length]; i++) {
        for (int j = 0; j < [self length]; j++) {
            if ([self characterAtIndex:j] == [notSecureStr characterAtIndex:i]) {
                return YES;
            }
        }
    }
    return NO;
}
// 是否含有数字 或 特殊字符： 不含数字或者不含特殊字符，返回NO,否则返回YES
//(既含有数字又含有特殊字符返回YES，否则返回NO)
//违法的\不正常的
- (BOOL)isIllegalString {
    if (![self isContainNum] || ![self isContainSpecialString]) {
        return NO;
    }else{
        return YES;
    }
}
//忽略大小写比较字符串是否相等：相等返回YES,否则返回NO
- (BOOL)isIgnoreCaseEqualsToStr:(NSString *)str {
    return [self compare:str options:NSCaseInsensitiveSearch] == NSOrderedSame;
}

#pragma mark //==========================="   特殊判断  "================================

static NSString *emailRegex=@"^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$";
static NSString *qqRegex=@"^[1-9][0-9]{4,9}$";
static NSString *mobileNumberRegex=@"^1[0-9]{10,10}$";
static NSString *passwordRegex=@"^[a-zA-Z0-9]{8,17}$";

+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type
{
    NSError *error;
    NSRegularExpression *regex;
    NSTextCheckingResult *result;
    NSString *regexStr = @"";
    if(type==VALIDATE_CHECK_EMAIL)  //邮箱判断
    {
        regexStr= emailRegex;
    }
    else if(type==VALIDATE_CHECK_QQ) //QQ判断
    {
        regexStr= qqRegex;
    }
    else if(type==VALIDATE_CHECK_MOBILE) //手机号判断
    {
        regexStr= mobileNumberRegex;
    }
    else if(type==VALIDATE_CHECK_PASSWORD) //密码判断
    {
        regexStr= passwordRegex;
    }
    regex=[NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:&error];
    result=[regex firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    if(!result){
        return NO;
    }else{
        return YES;
    }
}

//验证邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark 验证手机号
#pragma
//1.简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone
{   //这只是简单地判断手机号格式。其实手机的格式还是有一点复杂的
    //手机号以13，15，17，18开头
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
//2.详细的判断方法
+ (BOOL)validateMyPhone:(NSString *)phone
{   //正则判断手机号码格式
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     加177,178
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|7[78]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186  加176
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189   加177,178
     22         */
    NSString * CT = @"^1((33|53|77|78|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        if([regextestcm evaluateWithObject:phone] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:phone] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:phone] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark 身份证识别2 准确
#pragma
+(BOOL)checkIDCardNum:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}


#pragma mark //==========================="   特殊处理  "================================

// 把钱数改为万为单位
- (NSString *)convertMoneyToTenThousand:(id)money
{
    NSString *returnMoney = [NSString string];
    
    if ([self isNull:money]) {
        returnMoney = @"";
        return returnMoney;
    }
    
    NSString *temp = nil;
    if ([money isKindOfClass:[NSString class]]) {
        temp = (NSString *)money;
    } else {
        temp = [money stringValue];
    }
    
    //小于10000或者有小数点的显示原数字
    NSRange range = [temp rangeOfString:@"."];
    if (temp && temp.length) {
        if ([money floatValue]<10000 || range.length) {
            returnMoney = [NSString stringWithFormat:@"%@元",temp];
            return returnMoney;
        }
    }
    //没有小数点且大于10000的显示以万为单位
    CGFloat fMoney = [temp floatValue];
    if (temp && temp.length) {
        returnMoney = [NSString stringWithFormat:@"%.0f万元",fMoney/10000];
    }
    return returnMoney;
}

// 天数改为年
- (NSString *)convertDaysToYear:(id)days
{
    NSString *returnStr = [NSString string];
    if ([days isEqual:[NSNull null]] || [days isKindOfClass:[NSNull class]]
        || days == nil) {
        returnStr = @"";
        return returnStr;
    }
    
    NSString *temp = nil;
    if ([days isKindOfClass:[NSString class]]) {
        temp = (NSString *)days;
    } else {
        temp = [days stringValue];
    }
    //365或者366天改为年为单位,否则显示为天
    if (temp && temp.length) {
        if (!([days intValue]%365)) {
            returnStr = [NSString stringWithFormat:@"%d年",[temp intValue]/365];
        } else if (!([temp intValue]%366)) {
            returnStr = [NSString stringWithFormat:@"%d年",[temp intValue]/366];
        } else {
            returnStr = [NSString stringWithFormat:@"%@天",temp];
        }
    }
    return returnStr;
}



#pragma mark //==========================="   卡号处理  "================================
// 手机号空格
- (NSMutableString *)getPhoneEmpty:(NSString *)kaostring
{
    NSMutableString *String1 = nil;
    if (kaostring!=nil) {
        String1= [[NSMutableString alloc] initWithString:kaostring] ;
        if (kaostring.length==11) { //11位卡号
            [String1 insertString:@" " atIndex:3];
            [String1 insertString:@" " atIndex:8];
            return String1;
        }else{
            return String1;
        }
    }
    return nil;
}
// 银行卡号空格
- (NSMutableString *)getBankNumEmpty:(NSString *)kaostring
{
    NSMutableString *String1 = nil;
    if (kaostring!=nil) {
        String1 = [[NSMutableString alloc] initWithString:kaostring] ;
        if (kaostring.length==19) { //19位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            [String1 insertString:@" " atIndex:19];
            return String1;
        }else if(kaostring.length==18){//18位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            [String1 insertString:@" " atIndex:19];
            return String1;
        }else if(kaostring.length==16){ //16位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            return String1 ;
        }else{
            return String1;
        }
    }
    return nil;
}

// 隐藏银行卡号中间位数统一显示：前4位后3位
- (NSString *)convertIDCard:(id)idCard
{
    NSMutableString *returnString = [NSMutableString string];
    if ([idCard isEqual:[NSNull null]] || [idCard isKindOfClass:[NSNull class]] || idCard == nil) {
        [returnString appendString:@""];
        return returnString;
    }
    NSString *temp = nil;
    if ([idCard isKindOfClass:[NSString class]]) {
        temp = (NSString *)idCard;
    } else {
        temp = [idCard stringValue];
    }
    
    if (temp && temp.length) {
        if (temp.length>=4) {
            [returnString appendString:[temp substringToIndex:4]];
        }
        //统一显示：前4位后3位
        if (temp.length==19) {
            [returnString appendString:@"**** **** ****"];
            [returnString appendString:[temp substringFromIndex:16]];
        }
        else if (temp.length==18){
            [returnString appendString:@"**** **** ***"];
            [returnString appendString:[temp substringFromIndex:15]];
        }
        else if (temp.length==17){
            [returnString appendString:@"**** **** **"];
            [returnString appendString:[temp substringFromIndex:14]];
        }
        else if (temp.length==16){
            [returnString appendString:@"**** **** *"];
            [returnString appendString:[temp substringFromIndex:13]];
        }
    }
    return returnString;
}



//字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params {
    
    if (params ==nil) {
        return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch]; //allKeys排列顺序
        }];
        
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)]; //删除字符串：(开始位置，删除个数)
        
        NSString *urlStr = (NSString *)[NSMutableString stringWithFormat:@"%@?%@",url,tempStr];
        //NSLog(@"---> urlStr = %@ \n ",urlStr);
        
        return [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}



@end
