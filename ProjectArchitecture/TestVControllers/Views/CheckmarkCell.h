//
//  CheckmarkCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckmarkCell : UITableViewCell
{
    
}
@property (nonatomic, strong) UIView* BgView;
@property (nonatomic, strong) UILabel* titleLab;

@property (nonatomic, strong) UIView* checkBgView;
@property (nonatomic, strong) UIButton *selectBtn;

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight;

@end
