//
//  Test_CodeCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/25.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_CodeCell.h"
#import <Masonry.h>

@implementation Test_CodeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        UILabel *titlelab=[[UILabel alloc]init];
        titlelab.frame= CGRectMake(10,5, SSWIDTH/2,30);
        titlelab.text=@"123";
        titlelab.backgroundColor=[UIColor clearColor];
        [self addSubview:titlelab];
        
        UILabel *datalab=[[UILabel alloc]init];
        datalab.frame= CGRectMake(SSWIDTH/2, 5, SSWIDTH/2,30);
        datalab.text=@"123";
        datalab.backgroundColor=[UIColor clearColor];
        [self addSubview:datalab];
        
        self.titleLab= titlelab; //标题
        self.dataLab= datalab;   //数据
    }
    return self;    
}


@end
