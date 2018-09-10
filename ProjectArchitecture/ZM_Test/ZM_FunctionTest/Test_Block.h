//
//  Test_Block.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^AddMoreCourse) (NSString *str);
typedef void (^ZMTestBlock1) (NSString *name);
typedef void (^ZMTestBlock2) (NSString *name, int age);


@interface Test_Block : NSObject
@property (copy, nonatomic) void (^zmTestBlock)(NSString *name, int age);
@property (copy, nonatomic) ZMTestBlock2 zmTestBlock2;

- (void)getTitle:( void (^)(NSString *name, int age))ppBlock prarms:(NSDictionary *)prarms;

@end
