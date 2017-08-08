//
//  YzmTextField.h
//  Architecture
//
//  Created by ZM on 16/7/5.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^YzmTextFieldBlock) (NSString *pswString);

//============================="  代理协议  "==============================
@class YzmTextField;

@protocol ImageTextFieldDelegate <NSObject>
@optional
- (void)imageTextField:(YzmTextField *)ITView BtnClick:(UIButton *)Btn;

@end
//=============================================================================


@interface YzmTextField : UIView
/*
 * 输入框
 */
@property(nonatomic,strong)UITextField* mainText;
/*
 * 右图按钮
 */
@property(nonatomic,readwrite)UIButton* rightBtn;
/*
 * 头部的线
 */
@property(nonatomic,strong)UIView* topLine;


// 点击按钮回调
@property (nonatomic , strong) YzmTextFieldBlock rightBtnBlock;
// 设置代理
@property (nonatomic,weak) id<ImageTextFieldDelegate> delegate;

@end
