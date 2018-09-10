//
//  ZM_ThirdLoginCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_ThirdLoginCell.h"
#import "YYWebImage.h"

@implementation ZM_ThirdLoginCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setModel:(ZM_ThirdLogin *)model {
    _model=model;
    _titleLab.text= model.name;
    
    NSString *imgName = model.imgURL;
    if ([imgName hasPrefix:@"http"] | [imgName hasPrefix:@"https"]) {
        [self.imgView yy_setImageWithURL:[NSURL URLWithString:imgName] placeholder:nil 
                                 options:YYWebImageOptionProgressive completion:nil]; 
    }else{
        self.imgView .image = [UIImage imageNamed:imgName];
    }    
}

@end
