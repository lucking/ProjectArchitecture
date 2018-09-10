//
//  Test_GCD.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_GCD.h"

@implementation Test_GCD


- (void)test_GCD {
    
    // 3秒后自动调用self的run:方法，并且传递参数：@"abc"
    [self performSelector:@selector(delayAction:) withObject:@"abc" afterDelay:3];
}


- (void)delayAction:(id)prarms {
    NSLog(@"---prarms= %@",prarms);
}



@end
