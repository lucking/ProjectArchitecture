//
//  HomeCell.h
//  HuiFang
//
//  Created by ZM on 15/12/2.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Finance.h"

typedef void (^HomeCellConfigureBlock)(id item1, id item2, id item3);

@interface HomeCell : UITableViewCell
{
	CGFloat myWidth;
	CGFloat myHeight;
}
/**
 *  产品名称、利率
 */
@property(nonatomic,strong) UILabel* nameRateLab;
/**
 *  月份、金额
 */
@property(nonatomic,strong) UILabel* monthMoneyLab;

/**
 *  投资按钮
 */
@property(nonatomic,strong) UIButton* investBtn;
/**
 *  底线
 */
@property(nonatomic,strong) UIView* line;
/**
 *  回调
 */
@property(nonatomic , strong)HomeCellConfigureBlock homeCellBlock;



@end
