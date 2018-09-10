//
//  Test_Block.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_Block.h"

@interface Test_Block()

@end

@implementation Test_Block

//getter
- (void (^)(NSString *, int))zmTestBlock {
   return _zmTestBlock;
}
//setter
//- (void)setZmTestBlock:(void (^)(NSString *, int))zmTestBlock {
//    _zmTestBlock = _zmTestBlock;
//}


- (void)test_Block {
    
    [self BaseTest];
    
    if (self.zmTestBlock) {
        self.zmTestBlock(@"zm", 20);
    } 
    
}


typedef NSString* (^MyInfo)(NSString *title);

- (MyInfo)BaseTest {
    
    __block NSString *myInfo = @"";
    NSDictionary *prarms = @{@"key1":@"value1",
                             @"key2":@"value2"};
    [self getTitle:^(NSString *name, int age) {
        myInfo = [NSString stringWithFormat:@"姓名：%@，年龄：%d",name,age];
        NSLog(@"---myInfo= %@",myInfo);
    } prarms:prarms ];
    
    
    //返回一个block
    return ^(NSString *title) {
        return myInfo;
    };
}

- (void)getTitle:( void (^)(NSString *name, int age))ppBlock prarms:(NSDictionary *)prarms {
    
    ppBlock(@"张三丰",18);
}


@end
