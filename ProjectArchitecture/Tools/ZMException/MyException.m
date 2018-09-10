//
//  MyException.m
//  ZM_NSException
//
//  Created by ZM on 15/2/3.
//  Copyright (c) 2015年 ZhangM. All rights reserved.
//

#import "MyException.h"

@implementation MyException

//Cocoa异常由NSException对象作为载体

- (void)popAlert
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Tips" message:self.reason delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

}
- (IBAction)test:(id)sender
{
    int b = 0;
    MyException *exception =[[MyException alloc]initWithName:@"Error Message" reason:@"b=0" userInfo:nil];
    @try {
        switch (b) {
            case 0:
                @throw exception;
                break;
            default:
                break;
        }
        //类似于switch、case，第一个catch分支，捕获到异常，就跳到finally里
    }
    @catch (NSString *exception) {
        NSLog(@"NSString");
    }
    @catch (MyException *exception) {
        NSLog(@"1");
    }
    @catch (MyException *exception) {
        [exception popAlert];
        NSLog(@"b=0 exception");
        //类似于switch-case里面的default
    } @catch (...) {
        
    }
    @finally {
        NSLog(@"finally");
    }
}


@end
