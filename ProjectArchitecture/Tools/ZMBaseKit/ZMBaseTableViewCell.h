//
//  ZMBaseTableViewCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/10/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

//边线类型：顶部、底部
typedef NS_ENUM(NSInteger,CellLineStyle) {
    CellLineStyleDefault,
    CellLineStyleFill,
    CellLineStyleNone
};

@interface ZMBaseTableViewCell : UITableViewCell

@property (nonatomic, assign) CellLineStyle bottomLineStyle; // 顶线类型
@property (nonatomic, assign) CellLineStyle topLineStyle;    // 底线类型

@property (nonatomic, assign) CGFloat leftFreeSpace;  // 底线的左边距
@property (nonatomic, assign) CGFloat rightFreeSpace; // 底线的右边距

@property (nonatomic, weak) UIView *bottomLine;

@end
