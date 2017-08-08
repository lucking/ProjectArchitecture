//
//  CollectCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Collect.h"


@interface CollectCell : UITableViewCell
{
    
}
/*
 *  可编辑view
 */
@property (nonatomic, strong) UIView* checkBgView;
@property (nonatomic, strong) UIImageView *checkImgView;
/*
 *  内容view
 */
@property(nonatomic,strong) UIView* BgView;
//内容
@property(nonatomic,strong) UILabel* contentLab;
//详情
@property(nonatomic,strong) UILabel* detailLab;
//图片
@property(nonatomic,strong) UIImageView* imgView;
@property(nonatomic,strong) UILabel* lineLab;



@property(nonatomic,strong) Collect* model;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight;


@end
