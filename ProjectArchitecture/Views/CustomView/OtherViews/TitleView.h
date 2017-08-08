//
//  TitleView.h
//  HuiFang
//
//  Created by ZM on 15/12/2.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TitleViewBlock) (NSString *pswString);

@interface TitleView : UIView
{
	float myWidth;
	float myHeight;
}

/**
 *  线
 */
@property(nonatomic,strong) UIView *line;
/**
 *  标题
 */
@property(nonatomic,strong) UILabel *titleLab;
/**
 *  按钮
 */
@property(nonatomic,strong) UIButton *Btn;

@property(nonatomic,strong) TitleViewBlock rightBtnBlock;

@end
