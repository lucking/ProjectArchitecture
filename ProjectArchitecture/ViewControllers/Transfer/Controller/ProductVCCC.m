//
//  ProductVCCC.m
//  Architecture
//
//  Created by ZM on 2016/10/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ProductVCCC.h"

@interface ProductVCCC ()

@end

@implementation ProductVCCC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"ProductVCCC";
    label.textColor = [UIColor magentaColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
}


@end
