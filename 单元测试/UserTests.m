//
//  UserTests.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"

@interface UserTests : XCTestCase
{
@private
    User *user;
}
@end

@implementation UserTests


- (void)testIsChinese{
    XCTAssertTrue([user isChinese:@"你好"],@"正确");
    XCTAssertTrue([user isChinese:@"123你好"],@"正确");
    XCTAssertFalse([user isChinese:@"234"],@"失败");
    XCTAssertFalse([user isChinese:@"hello"],@"失败");
}


- (void)setUp {
    [super setUp];
    user = [[User alloc] init];
    NSLog(@"--->UserTests：setUp");
}

- (void)tearDown {
    [super tearDown];
    NSLog(@"--->UserTests：tearDown");
}

- (void)testExample {
    NSLog(@"--->UserTests：testExample");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
    NSLog(@"--->UserTests：testPerformanceExample");
}

@end
