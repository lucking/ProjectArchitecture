//
//  NumeralVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NumeralVController.h"
#import "NSObject+Caculator.h"

// 屏幕bounds
#define SScreenBounds [UIScreen mainScreen].bounds
// 屏幕的size
#define SScreenSize [UIScreen mainScreen].bounds.size
//宽度、高度
#define WWIDTH      (self.view.frame.size.width)
#define HHEIGHT     (self.view.frame.size.height)


#define RRect(a,b,c,d)  CGRectMake(a,b,c,d)
#define RMaxX(frame)    CGRectGetMaxX(frame)
#define RMaxY(frame)    CGRectGetMaxY(frame)
#define RMinX(frame)    CGRectGetMinX(frame)
#define RMinY(frame)    CGRectGetMinY(frame)
#define RWidth(frame)   CGRectGetWidth(frame)
#define RHeight(frame)  CGRectGetHeight(frame)
// 数字常量
static const  int   top = 20;
static const  float SSExtraHeight   = (64+49);
// 字符串常量
static const NSString *HSCoder11 = @"字符串11";
static const NSString *HSCoder22 = @"字符串22";
static NSString const *HSCoder33 = @"字符串33";
static NSString * const HSCoder44 = @"字符串44";


@interface NumeralVController ()

@end

@implementation NumeralVController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);

    
//    [self case1];
//    [self case2];
    //用auto定义一个相同的变量，但是对外面的变量没有影响。
    //[self case3];
    //编程思想
    [self case4];
    

}

#define RADIUS 100;,
const  float   RADIUS_r = 100;

//例一：
- (void)case1 {
    //结果为：0.562500
    CGFloat tFloat = (CGFloat)1080/1920;
    NSLog(@"---> tFloat = %f", tFloat);
    NSLog(@"---> (1080/1920)_11 = %f", (CGFloat)(1080.f/1920.f));   //_11 = 0.562500
    NSLog(@"---> (1080/1920)_22 = %f", (float)(1080.f/1920.f));     //_22 = 0.562500
    NSLog(@"---> (1080/1920)_33 = %f", (float)(1080/1920) );        //_33 = 0.000000 零
    NSLog(@"---> (1080/1920)_44 = %f", (float)1080/1920 );          //_44 = 0.562500
    NSLog(@"---> (1080/1920)_55 = %f", (CGFloat)1080/1920 );        //_55 = 0.562500
    NSLog(@"---> (1080/1920)_66 = %d", 1080/1920 );                 //_66 = 0   零

}
//例二：
- (void)case2 {
    
    NSLog(@"--> %d", top);
    NSLog(@"--> %f", SSExtraHeight);
    NSLog(@"--> %f", SSExtraHeight);
    
    NSLog(@"--> %@", HSCoder11);
    NSLog(@"--> %@", HSCoder22);
    NSLog(@"--> %@", HSCoder33);
    NSLog(@"--> %@", HSCoder33);
}

//例三：用auto定义一个相同的变量，但是对外面的变量没有影响。
- (void)case3 {
    int i,num;
    num=2;
    for (i=0;i<3;i++){
        printf("--> 外部_num= %d \n",num);
        num++;
        {
            auto int num=1;
            printf("---> 内部_block num= %d \n",num);
            num++;
        }
    }

}
//例四：
- (void)case4 {
    
    /** 响应式编程思想：
     特点：不需要考虑调用顺序，只需要知道考虑结果，类似于蝴蝶效应，产生一个事件，会影响很多东西，这些事件像流一样的传播出去，然后影响结果，借用面向对象的一句话，万物皆是流。
     代表：KVO运用
     */
    
    
    /** 链式编程思想
     特点：方法的返回值是block,block必须有返回值（本身对象），
     block参数（需要操作的值）
     代表：masonry框架。
     模仿masonry，写一个加法计算器，练习链式编程思想。
     */
    CGFloat result = [NSObject makeCaculators:^(CaculatorMaker *maker) {
        
        maker.add(1).add(2).muilt(6).sub(8).divide(5);
    }];
    NSLog(@"---> Caculator_result= %f", result);
    
    
    /** 函数式编程思想
     特点：每个方法必须有返回值（本身对象）,把函数或者Block当做参数,
     block参数（需要操作的值）
     block返回值（操作结果）
     代表：ReactiveCocoa。
     用函数式编程实现，写一个加法计算器,并且加法计算器自带判断是否等于某个值.
     */
    CaculatorMaker *caculator = [[CaculatorMaker alloc] init];
    
    BOOL isEqule = [[[caculator caculator:^float(float result) {
        result += 2;
        result *= 5;
        NSLog(@"---> result_11 = %f", result);
        return result;
        
    }] equle:^BOOL(float result) {
        NSLog(@"---> result_22 = %f", result);
        return result == 10;
    }] isEqule];
    NSLog(@"---> isEqule= %d \n ", isEqule);
    
    //同上：isEqule的调用
    BOOL isEqule2 = [[caculator caculator:^float(float result) {
        //result = 2*5;
        result += 2;
        result *= 5;
        return result; // (10+2)*5 = 60;
    }] equle:^BOOL(float result) {
        return result == 10;
    }].isEqule;
    NSLog(@"---> isEqule2= %d", isEqule2);
    
}
//例五：
- (void)case5 {
    //float 类型不能比较相等或不等，但可以比较>,<,>=,<=
    //float类型计算机表面会进行比较操作。但一般不使用 == ，而使用象lyld2618所用的方法，原因会造成float精度丢失。
    /*
     用==从语法上说没错，但是本来应该相等的两个浮点数由于计算机内部表示的原因可能略有微小的误差，这时用==就会认为它们不等。应该使用两个浮点数之间的差异的绝对值小于某个可以接受的值来判断判断它们是否相等,比如用
     if (fabs(priceA - priceB) < 0.000001)
     来代替
     if (priceA == priceB)
     
     */
    float priceA = 0.1;
    float priceB = 0.1;
    if (fabs(priceA - priceB) < 0.000001)
    {
        
    }
    
    //或转化成 int 类型再进行比较
    float progress= 0.1;
    int aaa = [[NSNumber numberWithFloat:progress*1000000] intValue];
    if(aaa == 1000000){
 
    }
    
    
    
    
}
//例六：
- (void)case6 {
    
}
//例七：
- (void)case7 {
    
}
//例八：
- (void)case8 {
    
}
//例九：
- (void)case9 {
    
}




@end
