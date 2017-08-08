//
//  SortingCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "SortingCell.h"

@implementation SortingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setKeyword:(NSString *)keyword {
    _keyword = keyword;
    _titleLabel.text = _keyword;
    
}

- (CGSize)sizeForCell {
    
    return CGSizeMake([_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)].width+20, 30);
}



@end
