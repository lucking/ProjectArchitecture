//
//  TestModel.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TestModel.h"
#import "Person.h"

@implementation TestModel

- (void)testMethod1 {
    
    Person *pp = [[Person alloc] init];
    [pp setValue:@"aaaa" forKey:@"firstName"];
    [pp setValue:@"bbb" forKey:@"name"];
}

@end
