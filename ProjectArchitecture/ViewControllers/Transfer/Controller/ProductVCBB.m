//
//  ProductVCBB.m
//  Architecture
//
//  Created by ZM on 2016/10/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ProductVCBB.h"

@interface ProductVCBB ()

@end

@implementation ProductVCBB

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"ProductVCBB";
    label.textColor = [UIColor cyanColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
}

@end
