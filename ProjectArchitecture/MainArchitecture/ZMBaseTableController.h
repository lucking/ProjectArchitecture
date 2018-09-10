//
//  ZMBaseTableViewController.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMBaseTableController : UITableViewController
@property (nonatomic, strong) UIButton *backBtn;
// 自定义标题
@property (nonatomic, copy) NSString *titleCustom;
@property (nonatomic, strong) UILabel *titleNavLab;

// 导航标题 navigationTitle
- (void)setTitle:(NSString*)title TitleColor:(UIColor*)color;

/**
 添加系统的 BarButtonSystemItem
 
 @param systemItem Item类型
 @param target 作用的目标对象
 @param action 响应方法
 @param tintColor 类型颜色
 @param isRightItem 是否是右边的Item：YES rightBarButtonItem、NO leftBarButtonItem
 */
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target
                        action:(SEL)action
                     tintColor:(UIColor *)tintColor
                   isRightItem:(BOOL)isRightItem;

//添加带标题的 BarButtonItemTitle
- (void)addBarButtonItemTitle:(NSString *)title
                    itemStyle:(UIBarButtonItemStyle)itemStyle
                       target:(id)target
                       action:(SEL)action
                         font:(UIFont *)font
                    tintColor:(UIColor *)tintColor
                  isRightItem:(BOOL)isRightItem;
/**
 添加带图片的 BarButtonItem
 
 @param imgName 图片名称
 @param action 响应方法
 @param tintColor 类型颜色
 @param isRightItem 是否是右边的Item：YES rightBarButtonItem、NO leftBarButtonItem
 */
- (void)addBarButtonItemImgName:(NSString *)imgName
                         action:(SEL)action
                      tintColor:(UIColor *)tintColor
                    isRightItem:(BOOL)isRightItem;


// 清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView;
// 停止菊花
- (void)hudHidden;
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay;

@end
