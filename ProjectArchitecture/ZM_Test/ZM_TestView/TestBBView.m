//
//  TestBBView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/17.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TestBBView.h"

@implementation TestBBView

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"TestBBView" owner:self options:nil] lastObject];
    if (self) {
        [self configInit];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    self = [[[NSBundle mainBundle] loadNibNamed:@"TestBBView" owner:self options:nil] lastObject];
    if (self) {
        [self configInit];
    }
    return self;
}


+ (instancetype)appUpdateAlertView
{
    NSLog(@"TestBBView= %@",[[NSBundle mainBundle] loadNibNamed:@"TestBBView" owner:self options:nil]);
    return [[[NSBundle mainBundle] loadNibNamed:@"TestBBView" owner:self options:nil] lastObject];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.frame.size.width > 0.f) {
        [self configFrame];
    }    
}
#pragma mark -----------"  private  "------------
// 初始化配置
- (void)configInit {  
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    //    self.frame = [UIScreen mainScreen].bounds;    
}
// 配置 frame
- (void)configFrame {  
    
}


@end
