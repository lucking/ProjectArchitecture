//
//  NSObject_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject_VController.h"

@interface NSObject_VController ()
{
    
}
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation NSObject_VController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    
    [self case1];
    
    
    
    [self.view addSubview:self.titleLab];
    

}

// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
        _titleLab.font = FFont(18);
        _titleLab.textColor = Black_COLOR;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}


/*
 * iOS中isKindOfClass和isMemberOfClass的区别

 相同点: 都是NSObject的比较Class的方法.
 不同点: isKindOfClass:确定一个对象是否是一个类的成员,或者是派生自该类的成员. (判断是否是这个类或者这个类的子类的实例)
        isMemberOfClass:确定一个对象是否是当前类的成员.(判断是否是这个类的实例)
 */
// 类别的判断
- (void)case1 {
    
//    NSArray *array = [NSArray new];
//    NSArray *array1 = [NSArray new];
//    NSMutableArray *mutArray = [NSMutableArray new];
    
    NSArray *array = [[NSArray alloc] init];
    NSArray *array1 = [[NSArray alloc] init];
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    
    NNSLog(@"---> [array class]= %@ ",[array class]);
    NNSLog(@"---> [mutArray class]= %@ ",[mutArray class]);
    NNSLog(@"---> [NSArray class]= %@ ",[NSArray class]);
    NNSLog(@"---> [NSMutableArray class]= %@ \n ",[NSMutableArray class]);
    
    NNSLog(@"---> array isKindOfClass array1  = %d ",[array isKindOfClass:[array1 class]]);
    NNSLog(@"---> array isKindOfClass NSArray  = %d ",[array isKindOfClass:[NSArray class]]);
    NNSLog(@"---> array isKindOfClass NSMutableArray  = %d ",[array isKindOfClass:[NSMutableArray class]]);
    NNSLog(@"---> mutArray isKindOfClass array1  = %d ", [mutArray isKindOfClass:[array1 class]]);
    NNSLog(@"---> mutArray isKindOfClass NSArray = %d",[mutArray isKindOfClass:[NSArray class]]);
    NNSLog(@"---> mutArray isKindOfClass NSMutableArray  = %d \n ",[mutArray isKindOfClass:[NSMutableArray class]]);
    
    NNSLog(@"---> array  array1  = %d ",[array isMemberOfClass:[array1 class]]);
    NNSLog(@"---> array isMemberOfClass NSArray  = %d ",[array isMemberOfClass:[NSArray class]]);
    NNSLog(@"---> array isMemberOfClass NSMutableArray  = %d ",[array isMemberOfClass:[NSMutableArray class]]);
    NNSLog(@"---> mutArray isMemberOfClass array1  = %d ", [mutArray isMemberOfClass:[array1 class]]);
    NNSLog(@"---> mutArray isMemberOfClass NSArray = %d",[mutArray isMemberOfClass:[NSArray class]]);
    NNSLog(@"---> mutArray isMemberOfClass NSMutableArray  = %d \n ",[mutArray isMemberOfClass:[NSMutableArray class]]);
    
    
    [self isArray:array];
    [self isArray:mutArray];
    
    NSDictionary *dic = [NSDictionary new];
    NSMutableDictionary *mutDic = [NSMutableDictionary new];
    [self isDictionary:dic];
    [self isDictionary:mutDic];
    
    
    NSLog(@"\n");
    [self isEqualClassA:array andClassB:array1];
    [self isEqualClassA:array andClassB:mutArray];
    [self isEqualClassA:mutArray andClassB:array1];
    NSLog(@"\n ");
    
    NNSLog(@"--->  [array isEqual:array1]  = %d ", [array isEqual:array1]);
    NNSLog(@"--->  [array isEqual:mutArray]  = %d ", [array isEqual:mutArray]);
    NNSLog(@"--->  [array isEqual:dic]  = %d \n ", [array isEqual:dic]);
    
    
    if ([array isKindOfClass:[array1 class]]){
        NSLog(@"---> [array isKindOfClass:[array1 class]] ");
    }
    if ([array isKindOfClass:[mutArray class]]){
        NSLog(@"---> [array isKindOfClass:[mutArray class]] ");
    }
    
    if ([array isMemberOfClass:[array1 class]]) {
        NSLog(@"---> [array isMemberOfClass:[array1 class]] ");
    }
    if ([array isMemberOfClass:[mutArray class]]) {
        NSLog(@"---> [array isMemberOfClass:[mutArray class]] ");
    }

}

// 是否是数组类
- (BOOL)isArray:(id)object {
    
    if ([object isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"---> [NSMutableArray class] ");
        return YES;
    } else if ([object isKindOfClass:[NSArray class]]) {
         NSLog(@"---> [NSArray class] ");
        return YES;
    }else{
        NSLog(@"---> is no Array ");
        return NO;
    }
}
// 是否是字典类
- (BOOL)isDictionary:(id)object {
    
    if ([object isKindOfClass:[NSMutableDictionary class]]) {
        NSLog(@"---> [NSMutableDictionary class] ");
        return YES;
    } else if ([object isKindOfClass:[NSDictionary class]]) {
        NSLog(@"---> [NSDictionary class] ");
        return YES;
    }else{
        NSLog(@"---> is no Dictionary ");
        return NO;
    }
}
// 如何判读A 与B 为同一类
- (BOOL)isEqualClassA:(id)objectA andClassB:(id)objectB
{
    if ([objectA isMemberOfClass:[objectB class]] || [objectA isKindOfClass:[objectB class]]) {
        NSLog(@"---> 同类 或是 父子类 ");
        return YES;
        
    } else if ([objectA isEqual:objectB]){
        NSLog(@"---> 同类");
        return  YES;
    }else{
        NSLog(@"---> isEqualClass = NO ");
        return NO;
    }
}


// 转换为空串
-(id)convertNull:(id)object
{
    //    NSLog(@"---> object = %@",object);
    //    NSLog(@"---> objectClass = %@",[object class]);
    //    NSLog(@"---> [object superclass] = %@ ",[object superclass]);
    
    //    NSArray *aaaaa = (NSArray *)object;
    NSArray *aaaaa = [[NSArray alloc] init];
    if ([object isMemberOfClass:[aaaaa class]]) {
        //        NSLog(@"--------> [NSArray class] ");
        aaaaa = object;
        if (aaaaa.count==0) {
            //            return nil;
            return @"";
        }else{
            return aaaaa;
        }
    }
    
    if (!object) {
        return @"";
    }
        
    else if (!object || [object isEqual:[NSNull null]]){
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return @"";
    }
    else if (object == nil) {
        return @"";
    }
    else if ([((NSString *)object) isEqualToString:@"<null>"]){
        NSLog(@"---> 55 = %@ \n ",[object class]);
        return @"";
    }else{
        return object;
    }
}


- (BOOL)class:(id)object {
    
    NSArray *aaaaa = [[NSArray alloc] init];
    if ([object isMemberOfClass:[aaaaa class]]) {
        //NSLog(@"--------> [NSArray class] ");
        return YES;
    }
    return NO;
}




@end
