//
//  MoreCell.h
//  Architecture
//
//  Created by ZM on 2016/10/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreCell : UITableViewCell
{
    CGFloat myWidth;
    CGFloat myHeight;
}
/**
 *  图片
 */
@property(nonatomic,strong) UIImageView* imgView;
/**
 *  标题
 */
@property(nonatomic,strong) UILabel* titleLab;

@property(nonatomic, copy) NSString* imgName;
@property(nonatomic, copy) NSString* title;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight;
@end
