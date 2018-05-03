//
//  UIViewController+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoDataButton.h"
//暂无数据，点击刷新：liebibao.png
//没有网络，点击刷新：wangluo.png
//暂无订阅哦：liebibao.png
//暂无提问哦：pinglun.png
//暂无消息哦：xiaoxi.png
//暂无观点哦：guandian.png
//暂无收藏哦：shoucang.png
// NSLog(@"---window.centerX= %f",[AppDelegate shareInstance].window.center.x);
// NSLog(@"---window.centerY= %f",[AppDelegate shareInstance].window.center.y);
// NSLog(@"---superview.centerX= %f",    superview.center.x);
// NSLog(@"---superview.centerY= %f \n ",superview.center.y);

#define NoDataButtonFrame  (CGRectMake(SSWIDTH/2.f -200/2.f, \
SSHEIGHT/2.f-200/2.f-64, \
200, 200)) 
#define NoDataButtonFrameA  (CGRectMake(SSWIDTH/2.f -200/2.f, SSHEIGHT/2.f-200/2.f-64-30, 200, 200)) 
#define NoDataButtonFrameB  (CGRectMake(SSWIDTH/2.f -200/2.f, 100, 200, 200)) 
#define NoDataButtonFrameC  (CGRectMake(SSWIDTH/2.f -200/2.f, 50, 200, 200)) 

typedef void(^BackBlock) (UIButton *);
typedef void(^NoDataBtnBlock) (void);

@interface UIViewController (ZMAdd)

#pragma mark ===================="  add property  "==============================
/**
 *  要在Category中扩展的属性
 */
//测试
@property (nonatomic, strong) NSObject *property;
@property (nonatomic, strong) UILabel *zmLab;
@property (nonatomic, copy) NSString *name;
//导航栏上的按钮
@property (nonatomic, weak) UIButton *itemBtn;
//返回按钮
@property (nonatomic, weak) UIButton *backBtn;
//暂无数据，点击刷新
@property (nonatomic, weak) UIButton *noDataBtn;
//返回按钮：响应回调
@property (nonatomic, copy) BackBlock backBlock;
//暂无数据，点击刷新：响应回调
@property (nonatomic, copy) NoDataBtnBlock noDataRefreshBlock;
//IPhoneX，状态栏
@property (nonatomic, weak) UIImageView *statusBarView;


// 测试使用
- (void )addBtnTitle:(NSString *)title frame:(CGRect)frame tag:(int)tag;
// 测试使用 按钮
- (void)BtnClick:(UIButton *)Btn;


#pragma mark ===================="  private method  "==============================

#pragma mark- 自定义：状态栏
- (void)addStatusBarViewImgName:(NSString *)imgName frame:(CGRect)frame;

#pragma mark- 自定义：暂无数据，点击刷新
- (void)addNoDataBtnToSuperview:(UIView *)superview 
                          title:(NSString *)title
                        imgName:(NSString *)imgName 
                          frame:(CGRect)frame isAddWindow:(BOOL)isAddWindow;
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

#pragma mark 导航栏最下的一条线 改变坐标
- (void)navBarlineImgViewChangeFrame;
// 是否隐藏导航栏最下的一条线
-(void)navBarlineImgViewHidden:(BOOL)hidden;
// 找到导航栏最下面的一条线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;
// 注意：这个是UIImage 导航栏最下的一条线
- (UIImage *)createImageWithColor:(UIColor*) color;

// 获取当前屏幕显示的_viewController
+ (UIViewController *)getCurrentVC;
// 添加线：坐标、颜色、透明度
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha;

// 停止菊花
- (void)hudHidden;
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay;


@end

