//
//  TestBBView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/17.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TestBBView.h"

@implementation TestBBView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.frame.size.width > 0.f) {
        [self configFrame];
    }    
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"ZMChangeFontView" owner:self options:nil] lastObject];
    if (self) {
        [self configInit];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    self = [[[NSBundle mainBundle] loadNibNamed:@"ZMChangeFontView" owner:self options:nil] lastObject];
    if (self) {
        [self configInit];
    }
    return self;
}

#pragma mark -----------"  private  "------------
// 配置 frame
- (void)configFrame {  
    
}
// 初始化配置
- (void)configInit {  
    
    //[[UIScreen mainScreen]
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    self.frame = [UIScreen mainScreen].bounds;    
    
}

@end
