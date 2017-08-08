//
//  RecordCell.h
//  HuiFang
//
//  Created by ZM on 15/12/7.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordCell : UITableViewCell
{
	CGFloat myWidth;
	CGFloat myHeight;
}
/**
 *  金额
 */
@property(nonatomic,retain) UILabel* moneyLab;
/**
 *  日期
 */
@property(nonatomic,retain) UILabel* dateyLab;
/**
 *  标志
 */
@property(nonatomic,retain) UILabel* signLab;
/**
 *  底线
 */
@property(nonatomic,retain) UIView* line;



@end
