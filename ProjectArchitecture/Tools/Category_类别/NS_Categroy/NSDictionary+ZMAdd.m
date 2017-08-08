//
//  NSDictionary+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSDictionary+ZMAdd.h"

@implementation NSDictionary (ZMAdd)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSString *pair = [NSString stringWithFormat:@"\t%@ = %@ \n",key,obj];
        [strM appendString:pair];
    }];
    [strM appendString:@"}"];
    return strM;
}



//将属性列表对象按照指定编码方式转换为NSData对象
//调用NSPropertyListSerialization类的dataWithPropertyList: format:format options:error:
//方法将属性列表对象编码为指定格式的NSData对象。NSPropertyListXMLFormat_v1_0是xml编码/NSPropertyListBinaryFormat_v1_0二进制编码。

// NSDictionary转换为XML的plist格式： Dic -> XML
- (NSString *)dicToXML:(NSDictionary *)myDic
{
    NSError* error = nil;
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:myDic
                                                                 format:NSPropertyListXMLFormat_v1_0
                                                                options:0
                                                                  error:&error];
    //Data转换为NSString输出 编码为UTF-8
    NSString* xmlStr = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    return xmlStr;
}

@end
