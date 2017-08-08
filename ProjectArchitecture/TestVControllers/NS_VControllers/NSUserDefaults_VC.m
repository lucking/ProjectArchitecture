//
//  NSUserDefaults_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSUserDefaults_VC.h"

@interface NSUserDefaults_VC ()

@end

@implementation NSUserDefaults_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];
    
    
}
#pragma mark
//例一：
- (void)case1 {
#pragma Bool
    [UserDefaults setBool:YES forKey:@"Key"];
    [UserDefaults getBoolForKey:@"Key"];
#pragma NSString
    [UserDefaults setNSString:@"" forKey:@"Key"];
    [UserDefaults getNSStringForKey:@""];
#pragma Integer
    [UserDefaults setInteger:100 forKey:@"Key"];
    [UserDefaults getIntegerForKey:@"Key"];
#pragma Object
    [UserDefaults setObject:@"" forKey:@"Key"];
    [UserDefaults getObjectForKey:@"Key"];
#pragma remove
    [UserDefaults removeObjectForKey:@"Key"];

}

//例二：
- (void)case2 {
    
}
//例三：
- (void)case3 {
}
//例四：
- (void)case4 {
}
//例五：
- (void)case5 {
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

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) Tag:i];
    }
}

@end
