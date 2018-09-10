//
//  HudProgress.h
//  ZM_MBProgressHUD
//
//  Created by ZM on 2017/5/27.
//  Copyright © 2017年 ZM. All rights reserved.
//


#import "Singleton.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface HudProgress : Singleton< MBProgressHUDDelegate >
{
}
@property (nonatomic, strong) MBProgressHUD *hudView;
// 单例
//+ (HudProgress *)singleton;
//创建实例
Singleton_Instance_method_Interface(HudProgress)


#pragma mark ------------------"  MBProgressHUD Delegate  "------------------
#pragma
// 菊花
- (void)hudShowLoadingAddSubview:(UIView *)superView;
// 菊花 延时
- (void)hudShowLoadingDelay:(NSTimeInterval)delay 
                 addSubview:(UIView *)superView;
// 菊花消息
- (void)hudShowLoadingMsg:(NSString *)message 
               addSubview:(UIView *)superView;
// 菊花消息 延时
- (void)hudShowLoadingMsg:(NSString *)message afterDelay:(NSTimeInterval)delay 
               addSubview:(UIView *)superView;

// 普通：提示信息  （可调位置，可设置有延时）
- (void)hudShowMessage:(NSString *)messag offset:(CGPoint)offset afterDelay:(NSTimeInterval)delay 
            addSubview:(UIView *)superView;
// 普通：提示信息  （居中，可设置有延时）
- (void)hudShowMsg:(NSString *)message
             delay:(NSTimeInterval)delay addSubview:(UIView *)superView;
// 普通：提示信息（居中，无延时）
- (void)hudShowMsg:(NSString *)message addSubview:(UIView *)superView;
// 普通提示：详情          //原来：margin = 20.0f
- (void)hudShowDetailMsg:(NSString *)message 
                  margin:(CGFloat)margin
                   delay:(NSTimeInterval)delay addSubview:(UIView *)superView;
// 普通提示：信息、详情
- (void)hudShowMsg:(NSString *)message 
         detailMsg:(NSString *)detailMsg
           msgFont:(CGFloat)msgFont
        detailFont:(CGFloat)detailFont
            margin:(CGFloat)margin
             delay:(NSTimeInterval)delay addSubview:(UIView *)superView;


// 错误：提示信息
- (void)hudShowErrorMsg:(NSString *)message afterDelay:(NSTimeInterval)delay 
             addSubview:(UIView *)superView;
// 成功时：提示图片
- (void)hudShowSucceedDelay:(NSTimeInterval)delay 
                 addSubview:(UIView *)superView;
// 成功时：提示 图片+信息
- (void)hudShowSucceedMsg:(NSString *)message afterDelay:(NSTimeInterval)delay 
               addSubview:(UIView *)superView;


// 提示：图片+信息
- (void)hudShowImgName:(NSString *)imgName
                   msg:(NSString *)message
            afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView;
// 自定义view
- (void)hudCustomView:(UIView *)customView
                  Msg:(NSString *)message
           afterDelay:(NSTimeInterval)dela addSubview:(UIView *)superViewy;

/** 多控制属性 hud
 @param message 消息
 @param font 字体
 @param modeType 展示模式
 @param animationType 动画模式
 @param delay 延迟时间
 */
- (void)hudLoadingAddedTo:(UIView *)superView
                      Msg:(NSString *)message
                  labFont:(UIFont *)font
                  hudMode:(MBProgressHUDMode)modeType
             hudAnimation:(MBProgressHUDAnimation)animationType
               afterDelay:(NSTimeInterval)delay;


//网络使用 含请求超时
- (void)hudShowLoadingNetWorkAddSubview:(UIView *)superView;
- (void)hudNetWorkLoadingAddedTo:(UIView *)superView message:(NSString *)message;

//隐藏
- (void)hudHidden:(NSTimeInterval)delay;
- (void)hudHidden;
//从 Window 找到 hud 并隐藏它
- (void)hudHiddenForWindow;
//从 父视图中 找到 hud 并隐藏它
- (void)hudHiddenForView:(UIView *)superView;


@end
