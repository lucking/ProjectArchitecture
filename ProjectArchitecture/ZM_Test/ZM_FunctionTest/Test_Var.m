//
//  Test_Var.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_Var.h"

@implementation Test_Var


//变量
+ (void)test_variate {
    
    int star = 5;
    // 小于等于 star，保留2位小数
    float starNum1 = arc4random_uniform(star)+ (float)(1+arc4random()%99)/100;
    // 小于等于 star，保留1位小数
    float starNum2 = arc4random_uniform(star)+ (float)(1+arc4random_uniform(9))/10;
    NSLog(@"---starNum1= %f",starNum1);  
    NSLog(@"---starNum2= %f",starNum2);  

    
    float aa = 123.00;
    double bb= 0.059001;
    double cc= 0.059044059;
    double dd= 0.0587621326;
    
    NSLog(@"---aa= %f",aa/100000);
    NSLog(@"---bb= %f",bb);
    NSLog(@"---cc= %f ",cc);
    NSLog(@"---dd= %.8f \n ",dd);
    NSLog(@"---bb= %@",[NSNumber numberWithDouble:bb]);
    NSLog(@"---cc= %@",[NSNumber numberWithDouble:cc]);
    NSLog(@"---dd= %@ \n ",[NSNumber numberWithDouble:dd]);
    
    NSLog(@"%lf 小数形式输出长浮点数", dd);  
    NSLog(@"%le 指数形式输出长浮点数", dd);  
    NSLog(@"%lg 以最短形式输出长浮点数", dd);  
    NSLog(@"%5lf 5位小数形式输出长浮点数", dd);  
    NSLog(@"%5.3lf 5位小数形式输出长浮点数, 其中3位是小数", dd);  
    NSLog(@"%.8f 8位小数形式输出长浮点数  \n", dd);  
    
}


@end
