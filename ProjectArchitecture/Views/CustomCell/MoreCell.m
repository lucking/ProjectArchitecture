//
//  MoreCell.m
//  Architecture
//
//  Created by ZM on 2016/10/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "MoreCell.h"
#import "UIView+ZMFrame.h"

@implementation MoreCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        myWidth = SSWIDTH - 10;
        myHeight= rowHeight;
        NSSLog(@"myWidth = %f", myWidth);
        NSSLog(@"myHeight= %f", myHeight);
    }
    return self;
}


#pragma mark -- lazy load

- (UIImageView *)imgView {
    if (_imgView==nil) {
        float yy = 10, wh = (myHeight-yy*2);
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, yy, wh, wh)];
        [self addSubview:_imgView];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(_imgView.right+20,0, 150, myHeight)];
        _titleLab.font = FFont(16);
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}
- (void)setImgName:(NSString *)imgName {
    _imgName = imgName;
    self.imgView.image = [UIImage imageNamed:imgName];
}



@end
