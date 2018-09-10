//
//  TableReusableViewB.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/12.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "TableReusableViewB.h"

@implementation TableReusableViewB

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 UITableViewHeaderFooterView xib黑屏
 1.没有设置view类型
 2.没有注册nib
 
 [self.contentView setBackgroundColor:[UIColor whiteColor]];
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
}


@end
