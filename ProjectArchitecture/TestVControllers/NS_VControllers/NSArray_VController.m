//
//  NSArray_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/26.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSArray_VController.h"

@interface NSArray_VController ()

@end

@implementation NSArray_VController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];


    [self case1];


}

- (void )case1 {
    
    int array[3][5] = {0};//定义一个二维数组（3行5列）
    int temp = 0;//设定一个临时的整型变量，用来给数组赋值
    for (int a = 0 ; a < 3; a++)//外层循环给数组的第一维赋值，就是array[x][y]的x
    {
        for (int b = 0 ; b < 5; b++)//内层循环给数组的第二维赋值，就是array[x][y]的y
        {
            temp = temp + 1;//为了让数组的数值不同，让临时变量有自增
            array[a][b] = temp;//二维数组的真正数据
            NSLog(@"array[%d][%d] = %d\t",a,b,array[a][b]);//打印出数组
        }
    }
    printf("\n");//输出一行后换行
    
    
    
    // 1.字面量创建二维数组并访问(推荐)
    NSArray *array2d = @[@[@11,@12,@13],
                         @[@21,@22,@23],
                         @[@31,@32,@33]
                         ];
    // 字面量访问方式(推荐)
    NSLog(@"array2d[2][2]:%@",array2d[2][2]);
    // 数组对象函数访问
    NSLog(@"array2d[2][2]:%@",[[array2d objectAtIndex:2] objectAtIndex:2]);
    
    // 2.另外一种循环嵌套穿件二维数组的方式
    NSMutableArray *mulArrayD1 = [[NSMutableArray alloc]init]; // 第一维数组
    // 添加第二维
    for(NSUInteger i = 1;i <= 3; i++) {
        NSArray *arrayD2 = @[@(i*10+1),
                             @(i*10+2),
                             @(i*10+3)];
        [mulArrayD1 addObject:arrayD2];
    }
    // 字面量访问方式(推荐)
    NSLog(@"---> array2d[2][2]:%@",mulArrayD1[2][2]);
    // 数组对象函数访问
    NSLog(@"---> array2d[2][2]:%@",[[mulArrayD1 objectAtIndex:2] objectAtIndex:2]);
    
    NSLog(@"---> mulArrayD1:%@",mulArrayD1);
    
}



@end
