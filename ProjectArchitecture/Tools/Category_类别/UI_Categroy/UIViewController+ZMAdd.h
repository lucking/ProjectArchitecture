//
//  UIViewController+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoDataButton.h"

typedef void(^BackBlock) (UIButton *);
typedef void(^NoDataBtnBlock) (void);


@interface UIViewController (ZMAdd)
{
    
}
#pragma mark ===================="  add property  "==============================
/**
 *  要在Category中扩展的属性
 */
//测试
@property (nonatomic, strong) NSObject *property;
@property (nonatomic, strong) UILabel *zmLab;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) UIColor* bgColor;


//导航栏上的按钮
@property (nonatomic, weak) UIButton *itemBtn;
//返回按钮
@property (nonatomic, weak) UIButton *backBtn;
//暂无数据，点击刷新
//@property (nonatomic, weak) UIButton *noDataBtn;
@property (nonatomic, weak) UIButton *noDataButton;
//返回按钮：响应
@property (nonatomic, copy) BackBlock popBlock;
//暂无数据，点击刷新：响应
@property (nonatomic, copy) NoDataBtnBlock noDataRefreshBlock;


#pragma mark ===================="  private method  "==============================

- (void)addNoDataBtnToSuperview:(UIView *)superview;

// 自定义 navigationItem：单体方法
- (void)addNavigationItemRect:(CGRect)rect
                        title:(NSString *)title
                      imgName:(NSString *)imgName tag:(NSInteger)tag isRightItem:(BOOL)isRightItem;

// 自定义 navigationItem：使用添加属性
- (void)addNavItemRect:(CGRect)rect
                 title:(NSString *)title
               imgName:(NSString *)imgName tag:(NSInteger)tag isRightItem:(BOOL)isRightItem;
// 导航栏按钮：响应
- (void)navigationItemClick:(UIButton *)btn;


/**
 返回按钮：自定义图片
 @param noNavBar 是否有导航栏
 @param normalBack 是否正常返回
 */
-(void)backBtnNoNavBar:(BOOL)noNavBar normalBack:(BOOL)normalBack;


//找到导航栏最下面的一条线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;
// 添加线：坐标、颜色、透明度
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha;
// 获取当前屏幕显示的_viewController
+ (UIViewController *)getCurrentVC;

// 停止菊花
- (void)hudHidden;
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay;


@end
