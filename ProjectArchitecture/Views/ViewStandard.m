//
//  ViewStandard.m
//  ZMArchitecture
//
//  Created by ZM on 16/2/17.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ViewStandard.h"
#import "TestColorHeader.h"

@implementation ViewStandard

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"--------- drawRect: Drawing code");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"--------- awakeFromNib: Initialization code");
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInit];
        NSLog(@"--------- initWithFrame");
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configInit];
        NSLog(@"--------- init");
    }
    return self;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    myWidth=  self.frame.size.width;
    myHeight= self.frame.size.height;
}
// 初始化配置
- (void)configInit {
    
}


#pragma mark ------------" getter and setter View------------

// 标题
- (UILabel *)titleLab {
	if (_titleLab==nil) {
		UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
		titleLab.font = FFont(18);
		titleLab.textColor = Black_COLOR;
		titleLab.textAlignment = NSTextAlignmentCenter;
		[self addSubview:titleLab];
		_titleLab = titleLab;
	}
	return _titleLab;
}



@end
