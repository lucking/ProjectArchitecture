//
//  ZM_NSStringTool.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_NSString.h"
#import "NSString+ZMAdd.h"


@implementation Test_NSString


+ (Test_NSString *)shareSingleton {
    static Test_NSString *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)useMethod {
    
    // 特殊字符 \转义字符
    NSLog(@"---> 特殊字符 =  '' @  \" \" Click ");
    // 解释说明
    NSString *string_11 = NSLocalizedString(@"内容", @"解释说明");
    NSString *string_22 = NSLocalizedString(@"Loading...", @"HUD loading title");
    NSLog(@"---> string_11 = %@",string_11);
    NSLog(@"---> string_22 = %@",string_22);
    
    
    NSLog(@"\n \n ");
    // 是否是 中文
    NSString* ssssa = @"魏一平";
    NSLog(@"---判断中文2 = %d",[NSString zm_isChineseString:ssssa]);

    NSString *subString = @"小天鹅呀小天鹅";
    NSLog(@"---判断中文1 = %d",[NSString zm_isIncludeChinese:subString]);
    NSLog(@"---判断中文2 = %d",[NSString zm_isChineseString:subString]);
//    NSLog(@"---判断中文3 = %d",[NSString zm_validateRangeContainsChinese:subString]);
//    NSLog(@"---判断中文4 = %d",[NSString zm_validateContainsChineseT:subString]);

    
    NSString* str1 = @"魏 一 平ads2  ,.,[sadf";
    // 是否全为英文字母
    NSLog(@"---> isAllLetter = %d",[@"asdfia  bjJASDFAJN" zm_isAllLetter]);
    // 是否包含数字
    NSLog(@"---> isAllNum = %d",[@"112344,3" zm_isAllNum]);
    // 是否包含数字
    NSLog(@"---> isContainNum = %d",[str1 zm_isContainNum]);
    // 是否包含特殊符号
    NSLog(@"---> isContainSpecialString = %d",[str1 zm_isContainSpecialString]);
    // 是否含有数字 或 特殊字符
    NSLog(@"---> isIllegalString = %d \n \n ",[str1 zm_isIllegalString]);
    
}

//字符串的：截取、分割、替换、拼接、移除、插入
-(void)test_Sting {
    
    // 截取
    [self test_cutString];
    // 分割
    [self test_SeparateString];
    // 拼接
    [self test_AppendingString];
    // 替换\移除
    [self test_ReplaceString];
    // 删除
    [self test_DeleteString];
    // 插入
    [self test_InsertString];
    // 大小写转换
    [self test_lower_upper_capitalize_String];
    // 是否包含
    [self test_ContainString];
    // 相互转化：中文、UTF8、ASCII
    [self test_Chinese_UTF8_ASCII];
    // xx
    [self test_String];
}

#pragma mark --- 截取
#pragma mark
- (void)test_cutString {

    // 如下只是是一个截取办法，不同截取的方法都能达到目的！！！
    NSString *str=@"1234567890abcdefgABCDEFG";
    
    // 1.截取_前几位 （是开始位置截取到指定位置但是不包含指定位置）  //例：从首位到第六位，共截取前六位
    NSLog(@"--->1_1: 截取前几位：%@",[str substringToIndex:6]);
    
    // 2.截取_后几位 （从开始为到尾部）                         //例：从第六位后面，第七位开始截取，一直截取到最后一位
    NSLog(@"--->1_2: 从指定位置到尾部：%@",[str substringFromIndex:6]); 
    
    // 3.截取_指定范围  按照给定的范围：NSRang（开始位置，宽度）截取 //例：从第六位后面，共截取3位 第7\8\9 3位
    NSLog(@"--->1_3: 从指定位置截取制定的宽度：%@",[str substringWithRange:NSMakeRange(6,3)]);
        
    //截取试例 同以上方法
    NSLog(@"截取 str1= %@",[@"0123456789" zm_cutStringStartNum:2 widthNum:3]);  //结果为：234
    NSLog(@"截取 str2= %@",[@"0123456789" zm_cutStringByEndNum:2 widthNum:3]);  //结果为：567
    NSLog(@"截取 str3= %@",[@"0123456789" zm_cutStringByEndWidthNum:3]);        //结果为：789
    NSLog(@"截取 str4= %@",[@"0123456789" zm_cutStringToEndStartNum:3]);        //结果为：3456789
    
    NSString *strOrigin= @"This is a string";
    NSString *strAA= @"string";
    NSUInteger location= [strOrigin rangeOfString:strAA].location;
    NSRange range123= [strOrigin rangeOfString:strAA];
    NSLog(@"--->1_4: location ：%luld ",(unsigned long)location);
    NSLog(@"--->1_4: range123 ：%luld ",(unsigned long)range123.length);
    
    
    // 通过分隔符，截取字符串，放入数组里
    NSString *postSnapShootImg = @"http://sch1.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch2.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch3.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch4.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch5.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch6.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch7.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch8.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;http://sch9.oss-cn-shenzhen.aliyuncs.com/Info/Thumbnail/0c29759b-7db4-4fa6-9ef9-d3b08858907b.jpg;";
    NSLog(@"---imgList= %@ \n ",[NSString zm_cutString:postSnapShootImg specialStr:@";"]);
    //（同上）字符串按照特定字符分割成数组
    NSArray *array = [postSnapShootImg componentsSeparatedByString:@";"]; 
    NSLog(@"array= %@",array); //结果是
}

#pragma mark --- 分割
#pragma mark
- (void)test_SeparateString {
    
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
}

#pragma mark --- 拼接
#pragma mark
- (void)test_AppendingString {
    NSString* string1= @"str1 ";
    NSString* string2= @"str2";
    NSString* String= [string1 stringByAppendingFormat:@"%@",string2];
    NSLog(@"---拼接：%@",String);
    
    NSString* aa = @"SDFADF";
    NSString* bb = @"s dfa sf_aff_sfag";
    NSLog(@"---拼接2= %@",[NSString zm_getABwithA:aa and:bb]);
    
    //尾部追加字符串
    NSMutableString *str5= [[NSMutableString alloc] initWithString:@"ABCDEFG_"];
    [str5 appendString:@"12345"];
    NSLog(@"--->拼接_追加字符串：%@ \n ",str5);

}

#pragma mark --- 替换\移除
#pragma mark
- (void)test_ReplaceString {
    NSString *str6 = @"Hello world!"; //world --> aaa
    str6 =[str6 stringByReplacingOccurrencesOfString:@"world" withString:@"aaa"];
    NSLog(@"---替换：%@ \n ",str6); //替换结果：Hello aaa
    
    //替换2
    NSString *str = @"Replacing/";
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"\\"];
    NSLog(@"---> str = %@",str);
    
    //移除：用空替换
    NSString* cutString=@"cut_STring";
    NSString* cutResult=[cutString stringByReplacingOccurrencesOfString:@"_S" withString:@""];
    NSLog(@"---7: 移除：%@ ",cutResult);
    //同上
    NSString* bb = @"s dfa sf_aff_sfag";
    NSLog(@"去掉空格后 = %@",[NSString zm_removeStringEmpty:bb]);
    //同上
    NSLog(@"---> trim = %@",[bb zm_trim]);

    
    //移除：字符串首尾的空格和换行符
    NSString *str7= @"   I love China \n ";
    str7= [str7 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"--->7: 去除字符串首尾的空格和换行符：%@ \n ",str7);
    
    
}

#pragma mark --- 删除
#pragma mark
- (void)test_DeleteString {
    NSMutableString* str8= [[NSMutableString alloc] initWithString:@"123456789"];
    [str8 deleteCharactersInRange:NSMakeRange(2,5)];
    NSLog(@"--->8: 删除字符串 范围: %@ \n ",str8);
    [str8 deleteCharactersInRange:NSMakeRange(str8.length,1)];
    NSLog(@"--->8: 删除字符串 后面几位: %@ \n ",str8);

}

#pragma mark --- 插入
#pragma mark
- (void)test_InsertString {
// 9.在已有字符串所指定的位置中 插入字符串
    NSString* date= @"20150421";
    NSMutableString *timestr = [[NSMutableString alloc] initWithString:date];
    [timestr insertString:@"A" atIndex:4];
    NSLog(@"--->9: 插入A：%@ \n ",timestr);

    [timestr insertString:@"-" atIndex:7];
    NSLog(@"--->9: 插入-：%@ \n ",timestr);

    // 在已有字符串所指定的位置中 插入字符串
    NSLog(@"intValue = %d", [@"02" intValue]);
    NSLog(@"插入后 = %@ ", [@"2017-3" zm_insertStringTo:@"0as" atIndex:5]);
    NSLog(@"插入后 = %@ ", [@"2" zm_insertStringTo:@"0" atIndex:0]);
    NSLog(@"插入后 = %@ \n ", [@"aaaa-zz" zm_insertStringTo:@"0022" atIndex:5]);
    
}

#pragma mark --- 大小写转换
#pragma mark
- (void)test_lower_upper_capitalize_String {
    
    NSString *strLow = @"This is a lowerCaseString!";
    [strLow lowercaseString];
    NSLog(@"--->10: 全部小写：%@ ", [strLow lowercaseString]);
    
    NSString *strUpper= @"This is a upperCaseString!";
    [strUpper uppercaseString];
    NSLog(@"--->10: 全部大写：%@", [strUpper uppercaseString]);
    
    NSString* str9= @"aaaaaa";
    NSLog(@"--->10: 首字母大写：%@  \n ",[str9 capitalizedString]);
}


#pragma mark --- 包含
#pragma mark
- (void)test_ContainString {
    
//11.判断是否包含：前缀、后缀
    NSString *string= @"I love China";
    BOOL isHas_I=     [string hasPrefix:@"I"];
    BOOL isHas_China= [string hasSuffix:@"China"];
    NSLog(@"--->11: 是否包含前缀1：%d ",isHas_I);
    NSLog(@"--->11: 是否包含后缀2：%d \n ",isHas_China);
    
    // 判断是否包含: 一个字符串里是否包含了另一个字符串: myString是否包含strA
    NSString* myString = @"HomeDirectoryPath holle world girls";
    NSString* strA = @"girlds";
    NSLog(@" isContainStringA = %d",[NSString zm_stringA:myString isContainStringB:strA]);
    
    NSString* myStr = @"【区块链概念股LongFin股东集体诉讼CEO证券欺诈 该公司股价曾两日内暴涨200%】 金融科技公司";
    NSString* strB = @"】";
    NSLog(@" ---isContainStringB = %d",[NSString zm_stringA:myStr isContainStringB:strB]);
    
    
    //是否包含，所在的位置、宽度
    NSString *strOrigin= @"This is a string";
    NSString *strAA= @"string";
    if ([strOrigin rangeOfString:strAA].location != NSNotFound) {
        
        NSUInteger location= [strOrigin rangeOfString:strAA].location;
        NSUInteger length  = [strOrigin rangeOfString:strAA].length;
        NSLog(@"--->1_4: location ：%ld ",(unsigned long)location);  //在第10位
        NSLog(@"--->1_4: length   ：%ld ",(unsigned long)length);    //所占长度为6
    }    
    
}



#pragma mark --- 相互转化：中文、UTF8、ASCII
#pragma mark
- (void)test_Chinese_UTF8_ASCII {
    
#pragma mark 相互转化：汉字、UTF8   
#pragma mark  
    // 汉字 to UTF8
    NSString* strA = [@"中国万岁" zm_encodingUTF8String];
    // UTF8 to 汉字
    NSString* strB = [strA zm_decodeUTF8String];
    NSLog(@"-----> strA = %@ ",strA);
    NSLog(@"-----> strB = %@ \n ",strB);
    
#pragma mark 相互转化：中文、ASCII
#pragma mark  
    // 汉字 to ASCII
    NSString* strC = [@"湖南省岳阳市岳阳楼High" zm_encodingASCIIString];
    // ASCII to 汉字
    NSString* strD = [strC zm_decodeASCIIString];
    NSLog(@"---> strC = %@ ",strC);
    NSLog(@"---> strD = %@ \n ",strD);
    
}


#pragma mark --- xx
#pragma mark
- (void)test_String {
    
}

// 是否包含，返回 所在的位置、宽度
+ (NSRange)myStr:(NSString*)myStr isContainRangeStringB:(NSString*)strB
{
    if ([myStr rangeOfString:strB].location != NSNotFound) {
        
        NSUInteger location = [myStr rangeOfString:strB].location;
        NSUInteger length   = [myStr rangeOfString:strB].length;
        NSLog(@"---location= %ld  ",(long)location);
        NSLog(@"---length= %ld \n_ ",(long)length);
        return NSMakeRange(location, length);
    }else{
        return NSMakeRange(0, 0);
    }    
}


@end
