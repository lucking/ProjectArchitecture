//
//  CaculatorMaker.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation CaculatorMaker

+ (float)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker
{
    CaculatorMaker *manager = [[CaculatorMaker alloc] init];
    caculatorMaker(manager);
    
    return manager.result;
}
//加
- (CaculatorMaker *(^)(float))add
{
    return ^CaculatorMaker *(float value){
        _result += value;
        return self;
    };
}
//减
- (CaculatorMaker *(^)(float))sub
{
    return ^CaculatorMaker *(float value){
        _result -= value;
        return self;
    };
}
//乘
- (CaculatorMaker *(^)(float))muilt
{
    return ^CaculatorMaker *(float value){
        _result *= value;
        return self;
    };
}
//除
- (CaculatorMaker *(^)(float))divide
{   //返回一个block：block也有一个CaculatorMaker的返回值
    return ^CaculatorMaker *(float value){
        _result /= value;
        return self;
    };
}



//传的参数 是一个block：caculator
- (CaculatorMaker *)caculator:( float(^)(float result))caculator
{
    //回调block：caculator有一个int的返回值（赋给_result，_result初始值为0）
    NSLog(@"---> _result_aa = %f", _result);
     _result = caculator(_result);
    NSLog(@"---> _result_bb = %f", _result);
    return self;

}
- (CaculatorMaker *)equle:( BOOL(^)(float result))equle
{
   _isEqule = equle(_result);
    return self;
}





@end
