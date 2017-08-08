//
//  NSDictionary+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZMAdd)
{
    
}
- (NSString *)descriptionWithLocale:(id)locale;

// NSDictionary转换为XML的plist格式： Dic -> XML
- (NSString *)dicToXML:(NSDictionary *)myDic;


@end
