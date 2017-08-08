//
//  ProjectArchitectureTests.m
//  ProjectArchitectureTests
//
//  Created by ZM on 2017/1/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"

@interface ProjectArchitectureTests : XCTestCase

@end

@implementation ProjectArchitectureTests

- (void)setUp {
    [super setUp];
    //在这里放置设置代码。这个方法在类中每个测试方法调用之前被调用。
    NSLog(@"--->Tests.m：setUp");
}
- (void)tearDown {
    //在这里输入拆卸代码。这个方法是在类中调用每个测试方法之后调用的。
    [super tearDown];
    NSLog(@"--->Tests.m：tearDown");
}
- (void)testExample {
    //这是一个功能测试用例的例子。
    //使用XCTAssert和相关的函数来验证您的测试产生了正确的结果。
    NSLog(@"--->Tests.m：testExample");
}
- (void)testPerformanceExample {
    //这是一个性能测试用例的例子。
    [self measureBlock:^{
        //把你想测量的时间写在这里。
    }];
    NSLog(@"--->Tests.m：testPerformanceExample");
}




@end
