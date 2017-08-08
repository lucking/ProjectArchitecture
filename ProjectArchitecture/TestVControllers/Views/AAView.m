//
//  AAView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AAView.h"

@implementation AAView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"--> new to create");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"--> alloc init to create");

    }
    return self;
}



@end
