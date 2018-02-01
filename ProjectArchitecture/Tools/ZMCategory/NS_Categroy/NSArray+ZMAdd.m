//
//  NSArray+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSArray+ZMAdd.h"
#import "Person.h"

@implementation NSArray (ZMAdd)

- (void)test {
    
    NSArray* sortArray = [[NSArray alloc] initWithObjects:@"1",@"3",@"4",@"7",@"8",@"2",@"6",@"5",@"37",@"9",@"12",@"16",@"88",@"25",@"",nil];
    
    NSMutableArray* mmutArray = [[NSMutableArray alloc] initWithCapacity:10000];
    
    NSLogline(@"方法五:");
    //NSEnumerationReverse：反向遍历 (倒序排列)
    [sortArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        // NSLog(@"idx=%lu, id= %@", (unsigned long)idx, obj);
        [mmutArray addObject:obj];
    }];
    NSSLog(@"反向遍历_mutArray = %@",mmutArray);
    
    
    //倒序排列_array
    mmutArray = (NSMutableArray *)[[mmutArray reverseObjectEnumerator] allObjects];
    NSSLog(@"倒序排列_array = %@",mmutArray);
    
    //	[mutArray sortedArrayUsingSelector:<#(nonnull SEL)#>]
    
    
    //正向排序
    //    NSDictionary *dataDic = @{@"rspCod":@"01000000",
    //                              @"rspMsg":@"支付成功",
    //                              @"USR_PAY_PWD":@"USR_PAY_PWD",
    //                              };
    //    NSArray *dicKeysArray = [dataDic allKeys];
    
    NSArray *keysArray = @[@"11",@"22",@"55",@"33",@"88",@"aa",@"cc",@"bb"];
    
    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch]; //allKeys排列顺序
    }];
    NSSLog(@"---> sortedArray_11 = %@",sortedArray);
    
    
    
    [self sort11];
    [self sort22];
    [self sort33];
    

    // 数量、最小值、最大值、平均值、求和
    NSArray *array1= [NSArray arrayWithObjects:@"2.0",@"2.3",@"3.0",@"4.0",@"10",nil];
    
    CGFloat count = [[array1 valueForKeyPath:@"@count.floatValue"] floatValue];
    CGFloat sum = [[array1 valueForKeyPath:@"@sum.floatValue"] floatValue];
    CGFloat avg = [[array1 valueForKeyPath:@"@avg.floatValue"] floatValue];
    CGFloat max = [[array1 valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat min = [[array1 valueForKeyPath:@"@min.floatValue"] floatValue];
    NSSLog(@"---> count = %f",count);
    NSLog(@"sum=%fn、avg=%fn、max=%fn、min=%f \n ",sum,avg,max,min);

    
    
    
    //那么问题来了，如果是自定义的对象数组，如何获取这些统计值呢？比如前几期文章我们自定义的 Person：
//    @interface Person
//    @property (nonatomic,copy)   NSString *name;
//    @property (nonatomic,assign) NSInteger age;
//    @property (nonatomic,assign) BOOL sex;
//    @end
    //假设某个班级有很多学生，我们将这些学生的信息都存到数组personArray，然后获取这些Person的平均年龄，最大最小年龄，方法是：
    
    NSMutableArray *personArray= [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        Person *pp= [[Person alloc] init];
        pp.name = [NSString stringWithFormat:@"名%d",i];
        pp.age  = i;
        [personArray addObject:pp];
    }
    CGFloat sum2 =[[personArray valueForKeyPath:@"@sum.age"] integerValue];
    CGFloat avg2 =[[personArray valueForKeyPath:@"@avg.age"] integerValue];
    CGFloat max2 =[[personArray valueForKeyPath:@"@max.age"] integerValue];
    CGFloat min2 =[[personArray valueForKeyPath:@"@min.age"] integerValue];
    NSLog(@"sum=%fn、avg=%fn、max=%fn、min=%f",sum2,avg2,max2,min2);
    //输出结果： sum=45.000000n、avg=4.000000n、max=9.000000n、min=0.000000
    
    //1、valueForKeyPath可以获取数组中的最小值、最大值、平均值、求和。代码如下：
    NSArray* array= @[@"1",@"2",@"3",@"4",@"5",@"6"];
    [self caculateArray:array];
    
    
    //2、valueForKeyPath可以获取数组中相同key的元素
    //如下所示：
    NSArray *arr = @[@{@"city":@"北京",
                       @"person":@{@"name":@"张三丰"}},
                     @{@"city":@"上海"}
                     ];
    id arrayValue= [arr valueForKeyPath:@"city"];
    NSLog(@"-->arrayValue= %@",arrayValue);
    //可以获取到city值的数组 @[@"北京",@"上海"]
    
    
    //3.valueForKeyPath 可以使用. 来一层一层向下索引，当多个字典层级时，取子层级中的属性就非常简单了
    NSDictionary *dict1 =
    @{@"dic1":@{@"dic2":@{@"name":@"张氏",
                          @"info":@{@"age":@"12"}
                          }
                }
      };
    id valueDic = [dict1 valueForKeyPath:@"dic1.dic2.name"];
    NSLog(@"-->valueDic= %@",valueDic);
    
}

//1、valueForKeyPath可以获取数组中的最小值、最大值、平均值、求和。代码如下：
- (NSString *)caculateArray:(NSArray *)array
{
    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
    NSLog(@"sum=%fn、avg=%fn、max=%fn、min=%f",sum,avg,max,min);
    return [NSString stringWithFormat:@"%f",sum];
}


//数组中是否包含 某个元素
- (BOOL)isContainString:(NSString *)myStr {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", myStr];
    NSArray *results = [self filteredArrayUsingPredicate:predicate];
    
    if (results.count > 0) {
        return YES;
    }else{
        return NO;
    }
}

// CFArray的二分查找方法
- (void)sort11 {
    
    //必须是有序的 表
    NSMutableArray *sortedArray = [NSMutableArray arrayWithObjects:
                                   @"Alice",
                                   @"Beth",
                                   @"Carol",
                                   @"Ellen",nil];
    //查找 位置
    id _searchObject = @"Beth";
    unsigned index = (unsigned)CFArrayBSearchValues((CFArrayRef)sortedArray,
                                                    CFRangeMake(0, CFArrayGetCount((CFArrayRef)sortedArray)),
                                                    (CFStringRef)_searchObject,
                                                    (CFComparatorFunction)CFStringCompare,
                                                    NULL);
    if (index < [sortedArray count] && [_searchObject isEqualToString:sortedArray[index]])
    {
        NSLog(@"Beth 索引 at index = %u", index);
    } else {
        NSLog(@"Beth 不存在");
    }
    //有序的插入
    id _insertObject = @"Debra";
    
    unsigned insertIndex = (unsigned)CFArrayBSearchValues((CFArrayRef)sortedArray,
                                                          CFRangeMake(0, CFArrayGetCount((CFArrayRef)sortedArray)),
                                                          (CFStringRef)_insertObject,
                                                          (CFComparatorFunction)CFStringCompare,
                                                          NULL);
    //插入
    [sortedArray insertObject:_insertObject atIndex:insertIndex];
    NSLog(@"---> sortedArray = %@",sortedArray);
}
// NSArray的二分查找方法
- (void)sort22 {
    
    NSArray *sortedArray = @[@"Alice",
                             @"Beth",
                             @"Carol",
                             @"Ellen"]; // must be sorted
    id searchObject = @"Carol";
    NSRange searchRange = NSMakeRange(0, [sortedArray count]);
    //查找 位置
    NSUInteger findIndex = [sortedArray indexOfObject:searchObject
                                        inSortedRange:searchRange
                                              options:NSBinarySearchingFirstEqual
                                      usingComparator:^(id obj1, id obj2)
                            {
                                return [obj1 compare:obj2];
                            }];
    NSSLog(@"---> NSArray的二分查找方法_findIndex_位置_22 = %ld \n ",findIndex);
}

// 自己编写二分查找算法
- (void)sort33 {
    
    // Conceptual tutorial
    NSArray *numberArray = @[@1, @3, @27, @36, @42, @70, @82];
    NSNumber *searchNum = @70;
    NSUInteger mid;
    NSUInteger min = 0;
    NSUInteger max = [numberArray count] - 1;
    BOOL found = NO;
    while (min <= max) {
        
        mid = (min + max)/2;
        
        if ([searchNum intValue] == [numberArray[mid] intValue]) {
            NSLog(@"---> 要找的数据位置在 index =  %lu \n ", mid);
            found = YES;
            break;
            
        } else if ([searchNum intValue] < [numberArray[mid] intValue]) {
            max = mid - 1;
            
        } else if ([searchNum intValue] > [numberArray[mid] intValue]) {
            min = mid + 1;
        }
    }
    if (!found) {
        NSLog(@"---> 没找到此数据");
    }
}


- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mustr = [NSMutableString string];
    [mustr appendString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < self.count -1) {
            [ mustr appendFormat:@"\t%@,\n",obj];
        }else{
            [ mustr appendFormat:@"\t%@\n",obj];
        }
    }];
    [mustr appendString:@")"];
    return mustr;
}



#pragma mark  ======================="  Function  "=================================

#pragma 第一种 排序方法：利用数组的sortedArrayUsingComparator调用 NSComparator ，obj1和obj2指的数组中的对象

NSComparator cmptor_Function = ^(id obj1, id obj2){
    
    if ([obj1 integerValue] > [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedDescending; //递减
    }
    if ([obj1 integerValue] < [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;  //递升
    }
    return (NSComparisonResult)NSOrderedSame;			//相同
};

#pragma 第二种 排序方法：利用sortedArrayUsingFunction 调用 对应方法customSort，这个方法中的obj1和obj2分别是指数组中的对象

NSInteger IntSort_Function (id obj1, id obj2,void* context) { // NSInteger (*)(ObjectType, ObjectType, void * __nullable)
    
    if ([obj1 integerValue] > [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedDescending;
    }
    if ([obj1 integerValue] < [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;
    }
    return (NSComparisonResult)NSOrderedSame;
};



//方法一： 从小到大
/**
 *  从小到大：利用sortedArrayUsingComparator
 *
 *  @return mutArray
 */
+ (NSArray *)sortedArrayUseComparator:(NSArray *)myArray {
    
    NSArray *array = [myArray sortedArrayUsingComparator:cmptor_Function]; //排序
    
    NSMutableArray* mutArray = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [mutArray addObject:obj];
    }];
    return mutArray;
}
//方法二：从小到大
/**
 *  利用sortedArrayUsingFunction
 *
 *  @return mutArray
 */
+ (NSArray *)sortedArrayUseFunction:(NSArray *)myArray
{
    NSArray *array = [myArray sortedArrayUsingFunction:IntSort_Function context:nil]; //排序
    
    NSMutableArray* mutArray = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [mutArray addObject:obj];
    }];
    return mutArray;
}
// 利用属性排序
/**
 *  利用sortUsingDescriptors调用 NSSortDescriptor
 *
 *  其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
 *
 *	ascending: YES（递升）  NO（递减）
 *
 *  @return Array
 */
+ (NSArray *)sortedArrayUseDescriptor:(NSArray *)myArray sortWithKey:(NSString *)myKey
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSArray *afterArray = [myArray sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"--->排序后_afterArray = %@",afterArray);
    return afterArray;
    // NSArray *sortDescript = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
}


//=========================="    "=================================

-(void)selectSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
    for (int i=0; i<[data count]-1; i++) {
        int m =i;
        for (int j =i+1; j<[data count]; j++) {
            if ([data objectAtIndex:j] < [data objectAtIndex:m]) {
                m = j;
            }
        }
        if (m != i) {
            [self swapWithData:data index1:m index2:i];
        }
    }
    NSLog(@"选择排序后的结果：%@",[data description]);
    //	[data release];
}

-(void)insertSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
    for (int i = 1; i < [data count]; i++) {
        id tmp = [data objectAtIndex:i];
        int j = i-1;
        while (j != -1 && [data objectAtIndex:j] > tmp) {
            [data replaceObjectAtIndex:j+1 withObject:[data objectAtIndex:j]];
            j--;
        }
        [data replaceObjectAtIndex:j+1 withObject:tmp];
    }
    NSLog(@"插入排序后的结果：%@",[data description]);
    //	[data release];
}

-(void)quickSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
    [self quickSortWithArray:data left:0 right:[aData count]-1];
    NSLog(@"快速排序后的结果：%@",[data description]);
    //	[data release];
    
}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i+1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
            while (j-1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        [self swapWithData:aData index1:left index2:j];
        [self quickSortWithArray:aData left:left right:j-1];
        [self quickSortWithArray:aData left:j+1 right:right];
    }
}

-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
    NSNumber *tmp = [aData objectAtIndex:index1];
    [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:tmp];
}


@end
