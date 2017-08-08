//
//  AAObject.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AAObject.h"

@implementation AAObject


- (BOOL)class:(id)object {
    
    NSArray *aaaaa = [[NSArray alloc] init];
    if ([object isMemberOfClass:[aaaaa class]]) {
        //NSLog(@"--------> [NSArray class] ");
        return YES;
    }
    return NO;
}


//dic model 化
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
+ (id)orderWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}


//系统方法：关键字转换
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"pId"];
    }
    else if ([key isEqualToString:@"description"])
    {
        self.pDescription= value;
    }
}





@end
