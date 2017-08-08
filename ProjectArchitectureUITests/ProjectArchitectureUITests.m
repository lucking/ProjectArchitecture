//
//  ProjectArchitectureUITests.m
//  ProjectArchitectureUITests
//
//  Created by ZM on 2017/1/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ProjectArchitectureUITests : XCTestCase

@end

@implementation ProjectArchitectureUITests

- (void)setUp {
    [super setUp];
    //在这里放置设置代码。这个方法在类中每个测试方法调用之前被调用。
    //在UI测试中，通常最好在出现故障时立即停止。
    self.continueAfterFailure = NO;
    //UI测试必须启动他们测试的应用程序。在设置中这样做将确保每个测试方法都有这种情况。
    [[[XCUIApplication alloc] init] launch];
    //在UI测试中，在运行之前设置初始状态——比如界面朝向——是很重要的。安装方法是一个很好的地方。
    NSLog(@"--->UITests.m：setUp");
}
- (void)tearDown {
    //在这里输入拆卸代码。这个方法是在类中调用每个测试方法之后调用的。
    [super tearDown];
    NSLog(@"--->UITests.m：tearDown");
}
- (void)testExample {
    //使用录音开始编写UI测试。
    //使用XCTAssert和相关的函数来验证您的测试产生了正确的结果。
    NSLog(@"--->UITests.m：testExample");

}

- (void)testLogin {
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textFields[@"username:"] typeText:@"111"];
    
    XCUIElement *passwordTextField = app.textFields[@"password:"];
    [passwordTextField typeText:@"1"];
    [passwordTextField tap];
    [passwordTextField tap];
    [passwordTextField typeText:@"111111222"];
    [app.buttons[@"Login"] tap];
    
    
    
}



@end
