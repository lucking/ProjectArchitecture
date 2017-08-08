//
//  Dispatch_Thread.m
//  Architecture
//
//  Created by ZM on 2016/12/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "Dispatch_Thread.h"

@implementation Dispatch_Thread


- (void)test {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSSLog(@"---> dispatch_after_后打印 ");
        
    });
    NSSLog(@"---> dispatch_先打印 ");
}




@end
