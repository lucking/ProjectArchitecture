//
//  ZMTradeInputView.h
//  LiCaiStandard
//
//  Created by ZM on 15/10/14.
//  Copyright © 2015年 ZM. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseHeader.h"
#import <Foundation/Foundation.h>
#import "ZMTradeField.h"
#import "ZMTradeHeader.h"

#pragma mark ButtonTag
typedef enum {
    ZMTradeCancleBtn = 10000,
    ZMTradeOkBtn     = 20000,
    ZMTradeBankBtn   = 30000,
}ZMTradeInputViewButtonTag;


//=============================================================================

// 1.申明类别
@class ZMTradeInputView;

// 2.协议代理
@protocol ZMTradeInputViewDelegate <NSObject>

@optional

#pragma mark 取消、确定、选择银行按钮
- (void)tradeInputView:(ZMTradeInputView *)tradeInputView BtnClick:(UIButton *)Btn;

@end

//=============================================================================


@interface ZMTradeInputView : UIView
{
	CGFloat bgWidth;
	CGFloat bgHeight;
	CGFloat bgBoundsWidth;
	CGFloat bgBoundsHeight;
}
// 蒙板
@property (nonatomic, strong) UIView* coverView;
/**
 *  背景
 */
@property (nonatomic, strong) UIView* BgView;
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 金额
@property (nonatomic, strong) UILabel *moneyLabel;
// 线
//@property (nonatomic, strong) UIView *line;
// 左图相框
@property (nonatomic, strong) UIImageView* leftImgV;
// 左图
@property (nonatomic, strong) UIImage* leftImage;
// 银行按钮
@property (nonatomic, strong) UIButton* bankBtn;
// 右图
@property (nonatomic, strong) UIImage* rightImage;
//银行名称
@property (nonatomic, strong) UILabel *bankNameLab;
/**
 *  输入框
 */
@property (nonatomic, strong) UITextField *numText;
@property (nonatomic, strong) ZMTradeField *tradeText;

// 密码提示
@property (nonatomic, strong) UILabel *pwdtsLab;
// 余额
@property (nonatomic, strong) UILabel *yuELab;



// 取消按钮
@property (nonatomic, strong) UIButton *cancleBtn;
// 确定按钮
@property (nonatomic, strong) UIButton *okBtn;


-(void)show;
-(void)dismiss;
/**
 *  3.代理属性
 */
@property (nonatomic, weak) id<ZMTradeInputViewDelegate> delegate;


@end




