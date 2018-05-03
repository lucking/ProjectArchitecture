//
//  HudProgress.m
//  ZM_MBProgressHUD
//
//  Created by ZM on 2017/5/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "HudProgress.h"
#import "AppDelegate.h"
#import "YYWebImage.h"
#define  Hud_IMGName(imageName)  [UIImage imageNamed:imageName]

// AppDelegate
#define     HudAPPDelegate          ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define     HudApplicationWindow    (((AppDelegate*)[UIApplication sharedApplication].delegate).window)

@implementation HudProgress
//实例化
Singleton_Instance_method_Impl(HudProgress)
// 同上
+ (HudProgress *)singleton
{
    static HudProgress *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


// 使用测试
+ (void)test {
    
    UIWindow * window1 = [[UIApplication sharedApplication] keyWindow];

    UIWindow * window2 = [AppDelegate shareInstance].window;
    
    UIWindow * window3 = HudAPPDelegate.window;
    
    UIWindow * window4 =  HudApplicationWindow;
    NSLog(@"---> window1= %@",window1);
    NSLog(@"---> window2= %@",window2);
    NSLog(@"---> window3= %@",window3);
    NSLog(@"---> window4= %@",window4);
        
    [[HudProgress singleton] hudShowLoadingMsg:@"请稍候..." addSubview:nil];
    [[HudProgress singleton] hudHidden];
    //同上
    [HHudProgress hudShowLoadingMsg:@"请稍候..." addSubview:nil];
    [HHudProgress hudHidden];

}

#pragma mark ------------------"  MBProgressHUD Delegate  "------------------
#pragma

#pragma mark - 添加到父视图上
- (MBProgressHUD *)hudAddSubview:(UIView *)superView {
    if (superView==nil) {
        return [MBProgressHUD showHUDAddedTo: HudApplicationWindow animated:YES];
    }else {
        return [MBProgressHUD showHUDAddedTo:superView animated:YES];
    }
}

// 菊花
- (void)hudShowLoadingAddSubview:(UIView *)superView
{
    [self hudAddSubview:superView];
}
// 菊花 延时
- (void)hudShowLoadingDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    [hud hideAnimated:YES afterDelay:delay];
}

// 菊花消息
- (void)hudShowLoadingMsg:(NSString *)message addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.label.text = NSLocalizedString(message, @"HUD loading title");
    _hudView = hud;
}
// 菊花消息 延时
- (void)hudShowLoadingMsg:(NSString *)message afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}
// CGPointMake(0, MBProgressMaxOffset) 底部
// 普通：提示信息（可调位置，可设置有延时）
- (void)hudShowMessage:(NSString *)message
                offset:(CGPoint)offset
            afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = NSLocalizedString(message, @"HUD message title");
    hud.offset = offset;
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}
// 普通：提示信息（居中，可设置有延时）
- (void)hudShowMsg:(NSString *)message
             delay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = NSLocalizedString(message, @"HUD message title");
    hud.offset = CGPointMake(0, 0);
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}
// 普通：提示信息（居中，无延时）
- (void)hudShowMsg:(NSString *)message addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = NSLocalizedString(message, @"HUD message title");
    hud.offset = CGPointMake(0, 0);
    _hudView = hud;
}


// 错误：提示信息
- (void)hudShowErrorMsg:(NSString *)message
            afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = NSLocalizedString(message, @"HUD message title");
    hud.offset = CGPointMake(0, 0);
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}

// 成功时：提示图片
- (void)hudShowSucceedDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    UIImage *image = [Hud_IMGName(@"Checkmark") imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}
// 成功时：提示 图片+信息
- (void)hudShowSucceedMsg:(NSString *)message afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    UIImage *image = [Hud_IMGName(@"Checkmark") imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}
// 提示：图片+信息
- (void)hudShowImgName:(NSString *)imgName
                   msg:(NSString *)message
            afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    YYImage *image = [YYImage imageNamed:imgName];
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imageView;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}

// 自定义view
- (void)hudCustomView:(UIView *)customView
                  Msg:(NSString *)message
            afterDelay:(NSTimeInterval)delay addSubview:(UIView *)superView
{
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}

/**
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
               afterDelay:(NSTimeInterval)delay 
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    hud.label.text = message;
    hud.label.font = font;
    hud.mode = modeType;
    hud.animationType = animationType;

    [hud hideAnimated:YES afterDelay:delay];
    _hudView = hud;
}


// NetWork NoResponse
static NSTimeInterval TimeoutInterval = 60.f;

- (void)hudShowLoadingNetWorkAddSubview:(UIView *)superView {
    MBProgressHUD *hud = [self hudAddSubview:superView];
    [hud hideAnimated:YES afterDelay:TimeoutInterval];
    _hudView = hud;
}
- (void)hudNetWorkLoadingAddedTo:(UIView *)superView message:(NSString *)message {
    MBProgressHUD *hud = [self hudAddSubview:superView];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:TimeoutInterval];
    _hudView = hud;
}

// 自定义停止时间
- (void)hudHidden:(NSTimeInterval)delay {	[_hudView hideAnimated:YES afterDelay:delay];
}
// 立即停止
- (void)hudHidden {                         [_hudView hideAnimated:YES];
}
//从Window 找到 hud 并隐藏它（一般情况下使用）
- (void)hudHiddenForWindow {                [MBProgressHUD hideHUDForView: HudApplicationWindow animated:YES];
}
//从父视图中 找到 hud 并隐藏它（特别情况使用）
- (void)hudHiddenForView:(UIView *)superView {  [MBProgressHUD hideHUDForView:superView animated:YES];
}

@end
