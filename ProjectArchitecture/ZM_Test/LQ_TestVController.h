//
//  LQ_TestVController.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMBaseViewController.h"


@interface LQ_TestVController : ZMBaseViewController

////声明属性的修饰：
//@property (nonatomic,copy, nullable) NSString * aString1;  
//@property (nonatomic,copy) NSString* __nullable aString2;  
//@property (nonatomic,copy) NSString* _Nullable  aString3;  
//
////方法返回值修饰：
//- (nullable NSString *)method1;  
//- (NSString* __nullable)method2;  
//- (NSString* _Nullable)method3;  
//
////方法参数修饰：
//- (void)methodWithString1:(nullable NSString*)aString;  
//- (void)methodWithString2:(NSString* _Nullable)aString;  
//- (void)methodWithString3:(NSString* __nullable)aString;  
//
//
///**
// *  而对于双指针类型对象 、 Block 的返回值 、 Block 的参数 等，这时候就不能用 nonnull/nullable 修饰，只能用带下划线的 __nonnull/__nullable 或者 _Nonnull/_Nullable ：
// */
//- (void)methodWithError1:(NSError* _Nullable * _Nullable)error;
//- (void)methodWithError2:(NSError* __nullable* __null_unspecified)error;  
//// 以及其他的组合方式  
//
//- (void)methodWithBlock1:(nullable void(^)())block;  
//// 注意上面的 nullable 用于修饰方法传入的参数 Block 可以为空，而不是修饰 Block 返回值；  
//- (void)methodWithBlock2:(void(^ _Nullable)())block;  
//- (void)methodWithBlock3:(void(^ __nullable)())block;  
//
//- (void)methodWithBlock4:(nullable id __nonnull(^)(id __nullable params))block;  
//// 注意上面的 nullable 用于修饰方法传入的参数 Block 可以为空，而 __nonnull 用于修饰 Block 返回值 id 不能为空；  
//- (void)methodWithBlock5:(id __nonnull(^ __nullable)(id __nullable params))block;  
//- (void)methodWithBlock6:(id _Nonnull (^ _Nullable)(id _Nullable params))block;  
//// the method accepts a nullable block that returns a nonnull value: 该方法接受返回非空值的可空块。
//// there are some more combinations here, you get the idea: 这里有更多的组合，你懂的。  
//
//@property (nonatomic,copy) NSString *aString;  
//
//- (id)methodWithString:(nullable NSString*)str;  

@end




