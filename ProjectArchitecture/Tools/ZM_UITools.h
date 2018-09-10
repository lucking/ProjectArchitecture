//
//  ZM_UITools.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/30.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  ZMTableViewCellSeparatorStyle
 */
typedef NS_ENUM(NSInteger, ZMCellSeparatorStyle) {
    ZMCellSeparatorNormal,
    ZMCellSeparatorNone,
    ZMCellSeparatorSingleLine,
    ZMCellSeparatorSingleLineEtched NS_ENUM_DEPRECATED_IOS(2_0, 11_0, "Use ZMCellSeparatorSingleLine for a single line separator."),
    ZMCellSeparatorAll,
    
} __TVOS_PROHIBITED;



@interface ZM_UITools : NSObject
// 添加：UIView
+ (UIView *)zm_viewFrame:(CGRect)frame bgColor:(UIColor *)bgColor;

// 添加 UIImageView
+ (UIImageView *)zm_imgViewFrame:(CGRect)frame bgColor:(UIColor *)bgColor img:(UIImage *)img;


// 添加：UILabel
+ (UILabel *)zm_labText:(NSString * _Nullable)text 
                    textColor:(UIColor * _Nullable)textColor
                         font:(UIFont * _Nonnull)font  
                      bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame;

// 添加 UITextField
+ (UITextField *)zm_getTextFieldPlaceHolder:(NSString *_Nullable)placeHolder
                                       font:(UIFont *_Nonnull)font  
                                  textColor:(UIColor *_Nullable)textColor
                                 tfViewMode:(UITextFieldViewMode)tfViewMode
                                      frame:(CGRect)frame;
// 添加按钮：UIButton
+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont * _Nullable)font  
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame;

+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont * _Nullable)font  
                          image:(UIImage * _Nullable)image 
                        bgImage:(UIImage * _Nullable)bgImage 
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame 
                      addTarget:(nullable id)target action:(SEL)action;

/** 表的配置 UITableView
 @param tableView 表
 @param separatorColor 分割线颜色
 @param separatorStyle 分割线类型
 @param headerViewHide 头部多余的分割线
 @param footerViewHide 底部多余的分割线
 @param estimated 是否预估高度
 */
+ (void)setTableView:(UITableView *)tableView bgColor:(UIColor *)bgColor 
      separatorStyle:(ZMCellSeparatorStyle)separatorStyle 
      separatorColor:(UIColor *)separatorColor
      headerViewHide:(BOOL)headerViewHide 
      footerViewHide:(BOOL)footerViewHide 
           estimated:(BOOL)estimated;

//UIAlertView
+ (void)zm_AlertViewTitle:(nullable NSString *)title 
                  message:(nullable NSString *)message 
                 delegate:(nullable id )delegate 
           cancelBtnTitle:(nullable NSString *)cancelBtnTitle 
           otherBtnTitles:(nullable NSString *)otherBtnTitle
                      tag:(NSInteger)tag;
@end
