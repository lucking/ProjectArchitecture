//
//  ProductVCAA.m
//  Architecture
//
//  Created by ZM on 2016/10/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZM_ProductVCAA.h"
#import "BaseHeader.h"
#import "UIView+ZMFrame.h"

@interface ZM_ProductVCAA ()

@end

@implementation ZM_ProductVCAA

- (void)viewDidLoad {
    [super viewDidLoad];


    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"ProductVCAA";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    NSLog(@"---SSWIDTH = %.2f",SSWIDTH);
    NSLog(@"---SSHEIGHT= %.2f",SSHEIGHT);
    NSLog(@"---self.view.width= %.2f",self.view.width);
    NSLog(@"---self.view.height= %.2f \n ",self.view.height);

}



@end
