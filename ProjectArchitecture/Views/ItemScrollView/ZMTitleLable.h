//
//  ZMTitleLable.h
//  ZM_BaseViewController
//
//  Created by ZM on 15/9/1.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMTitleLable : UILabel
{
	float WWidth ;
	float HHeight;
}
//比例
@property (nonatomic,assign) CGFloat scale;
//竖线
@property (nonatomic,strong) UIView* verticalLine;
//横线
@property (nonatomic,strong) UIView* horizontallLine;


@end
