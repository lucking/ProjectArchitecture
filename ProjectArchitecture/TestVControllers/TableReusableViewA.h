//
//  TableReusableViewA.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/12.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableReusableViewA : UITableViewHeaderFooterView

@property (weak, nonatomic) UIView *BgView;
@property (weak, nonatomic) UILabel *nameLab;
@property (weak, nonatomic) UIButton *moreBtn;
@property (weak, nonatomic) UIImageView *arrowImgView;
@property (weak, nonatomic) UIView *coverView;
@property (weak, nonatomic) UIView *lineView;

@end
