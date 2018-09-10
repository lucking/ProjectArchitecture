//
//  APPUpdateAlertView.m
//  weike-cpa
//
//  Created by JET on 16/5/4.
//  Copyright © 2016年 lixd. All rights reserved.
//

#import "APPUpdateAlertView.h"

@implementation APPUpdateAlertView



- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.frame.size.width > 0.f) {
        [self configFrame];
    }    
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    BOOL aaaa = YES;
    if (aaaa) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"APPUpdateAlertView" owner:self options:nil] lastObject];
    }else{
        self = [[[NSBundle mainBundle] loadNibNamed:@"APPForceUpdateAlertView" owner:self options:nil] lastObject];
    }
    if (self) {
        [self configInit];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    BOOL aaaa = YES;
    if (aaaa) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"APPUpdateAlertView" owner:self options:nil] lastObject];
    }else{
        self = [[[NSBundle mainBundle] loadNibNamed:@"APPForceUpdateAlertView" owner:self options:nil] lastObject];
    }    if (self) {
        [self configInit];
    }
    return self;
}


+ (instancetype)appUpdateAlertView
{
    NSLog(@"%@",[[NSBundle mainBundle] loadNibNamed:@"APPUpdateAlertView" owner:self options:nil]);
    return [[[NSBundle mainBundle] loadNibNamed:@"APPUpdateAlertView" owner:self options:nil] lastObject];
}
+ (instancetype)appForceUpdateAlertView
{
    NSLog(@"%@",[[NSBundle mainBundle] loadNibNamed:@"APPForceUpdateAlertView" owner:self options:nil]);
    return [[[NSBundle mainBundle] loadNibNamed:@"APPForceUpdateAlertView" owner:self options:nil] lastObject];
}


#pragma mark -----------"  private  "------------
// 初始化配置
- (void)configInit {  
    //[[UIScreen mainScreen]
    //    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    //    self.frame = [UIScreen mainScreen].bounds;    
}
// 配置 frame
- (void)configFrame {  
    
}



@end
