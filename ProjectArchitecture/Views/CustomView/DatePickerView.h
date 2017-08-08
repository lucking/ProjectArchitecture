//
//  DatePickerView.h
//  ZM_NSDataNSTimer
//
//  Created by ZM on 2016/12/19.
//  Copyright © 2016年 ZhangM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DatePickerViewBlock)(NSString *dateString);

@interface DatePickerView : UIView
{
    
}
//设置时间模式
@property (nonatomic) UIDatePickerMode datePickerMode;
//时间格式
@property (nonatomic, copy) NSString *dateFormatterString;

//确认后：回调时间
@property (nonatomic, copy) DatePickerViewBlock dateStringBlock;


// 显示 View
- (void)showView;
// 隐藏 View
- (void)dismissView;
// 移除：
- (void)removeAllView;

@end
