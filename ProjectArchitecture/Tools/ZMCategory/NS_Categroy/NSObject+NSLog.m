//
//  NSObject+NSLog.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject+NSLog.h"

@implementation NSObject (NSLog)

@end


@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mustr = [NSMutableString string];
    [mustr appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ mustr appendFormat:@"\t%@=%@;\n",key,obj];
        
    }];
    [mustr appendString:@"}"];
    return mustr;
}

@end


@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mustr = [NSMutableString string];
    [mustr appendString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < self.count -1) {
            [ mustr appendFormat:@"\t%@,\n",obj];
        }else{
            [ mustr appendFormat:@"\t%@\n",obj];
        }
    }];
    [mustr appendString:@")"];
    return mustr;
}
@end


