//
//  BBaseViewController.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface BBaseViewController : UIViewController
{
    
}
@property (nullable, nonatomic, strong) UIButton *backBtn;
@property (nullable, nonatomic, strong) UILabel *titleNavLab;
// 自定义标题
@property (nullable, nonatomic, copy) NSString *titleCustom;

// 导航标题 navigationTitle
-(void)setTitle:(NSString*)title TitleColor:(UIColor*)color;

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

/**
 添加带图片的 BarButtonItem

 @param imgName 图片名称
 @param action 响应方法
 @param tintColor 类型颜色
 @param isRightItem 是否是右边的Item：YES rightBarButtonItem、NO leftBarButtonItem
 */
- (void)addBarButtonImageItemImgName:(NSString *)imgName
                              action:(SEL)action
                           tintColor:(UIColor *)tintColor
                         isRightItem:(BOOL)isRightItem;


// 清除UITableView底部多余的分割线
//- (void)clearTableViewLine:(UITableView *)tabelView;
// 清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView
              isHeaderView:(BOOL)isHeader
              isFooterView:(BOOL)isFooter;
// 添加线
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha;


// 添加按钮：UIButton （测试使用）
- (void)addBtnTitle:(NSString*)title frame:(CGRect)frame Tag:(int)tag;
- (void)myBtnClick:(UIButton *)Btn;


// 停止菊花
- (void)hudHidden;
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
