//
//  BLAreaPickerView.h
//  AreaPicker
//
//  Created by boundlessocean on 2016/11/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BLDatePickerViewDelegate <NSObject>

@optional
// 确定按钮点击回调
- (void)bl_selectedDateResultWithYear:(NSString *)year
                                month:(NSString *)month
                                  day:(NSString *)day;
// 取消按钮点击回调
- (void)bl_cancelButtonClicked;
@end

@interface BLDatePickerView : UIView

/** ---------------------- 可设置的属性 ----------------------*/

/** 标题大小 */
@property (nonatomic, strong)UIFont  *titleFont;
/** 选择器背景颜色 */
@property (nonatomic, strong)UIColor *pickViewBackgroundColor;
/** 选择器头部视图颜色 */
@property (nonatomic, strong)UIColor *topViewBackgroundColor;
/** 取消按钮颜色 */
@property (nonatomic, strong)UIColor *cancelButtonColor;
/** 确定按钮颜色 */
@property (nonatomic, strong)UIColor *sureButtonColor;
/** 设置背景透明度 0~1 */
@property (nonatomic, assign)CGFloat backGAlpha;

/** ---------------------- block & delegate ----------------------*/
/** 确定按钮点击 */
@property (nonatomic, copy) void(^sureButtonClickBlcok)(NSString *year, NSString *month, NSString *day);
/** 选择器代理 */
@property (nonatomic, weak) id<BLDatePickerViewDelegate> pickViewDelegate;


/** ---------------------- Action ----------------------*/
/** 显示选择器 */
- (void)bl_show;
/** 隐藏 */
- (void)bl_dismiss;

/** 设置默认日期 */
- (void)bl_setUpDefaultDateWithYear:(NSInteger)year
                              month:(NSInteger)month
                                day:(NSInteger)day;
@end
