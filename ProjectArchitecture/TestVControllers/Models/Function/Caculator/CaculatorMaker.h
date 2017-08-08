//
//  CaculatorMaker.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject
//计算结果
@property (nonatomic, assign) float result;
//是否相等
@property (nonatomic, assign) BOOL isEqule;
//计算方法

//链式编程思想
+ (float)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker;
- (CaculatorMaker* (^)(float) )add;
- (CaculatorMaker* (^)(float) )sub;
- (CaculatorMaker* (^)(float) )muilt;
- (CaculatorMaker* (^)(float) )divide;

//函数式编程思想
- (CaculatorMaker *)caculator:( float(^)(float result))caculator;
- (CaculatorMaker *)equle:( BOOL(^)(float result))equle;


@end
