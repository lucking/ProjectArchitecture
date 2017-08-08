//
//  FinanceCell.h
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Finance.h"

@interface FinanceCell : UITableViewCell
{
	CGFloat myWidth, myHeight;
}
/**
 *  产品名称、利率
 */
@property(nonatomic,retain) UILabel* nameRateLab;
/**
 *  月份、金额
 */
@property(nonatomic,retain) UILabel* monthMoneyLab;

/**
 *  投资按钮
 */
@property(nonatomic,retain) UIButton* investBtn;
/**
 *  底线
 */
@property(nonatomic,retain) UIView* line;

- (void)configureWithModelMapLogo:(MapLogo* )mapLogo
						  provinc:(ProvinceList *)provinc page:(Page *)page;


// 此处没有使用
@property(nonatomic,strong)Finance* financeModel;
/** 同上
 *  Finance 如果只有一种模型可以引用（此处有多个，则没有使用）
 *
 *  @param modelArray   模型数组
 *  @param index	获取索引 row
 */
- (void)configureDataWithModelArray:(NSMutableArray *)modelArray cellForRowAtIndex:(long)index;


@end


