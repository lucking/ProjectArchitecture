//
//  MBProgress.h
//  TDiPad
//
//  Created by ZM on 16/4/7.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "Singleton.h"
#import "MBProgressHUD.h"

@interface MBProgress : Singleton< MBProgressHUDDelegate >
{
    //	MBProgressHUD *_hudView;
}
@property (nonatomic, strong) MBProgressHUD *hudView;
////创建实例
//Singleton_Instance_method_Interface(MBProgress)
//
//// 单例：同上
//+ (MBProgress *)singletonShare;
//
//
//
//// 菊花旋转30秒
//- (void)hudShowLoading:(NSString *)message;
//
//- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay;
//
//// 普通：菊花旋转
//- (void)hudShowLoadingAfterDelay:(NSTimeInterval)delay;
//
//
//// 显示信息、图片
//- (void)hudShowMessage:(NSString *)message imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay;
//
//- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
//
////- (void)hudShowSucceed:(NSString *)message;
//// 成功时：提示信息
//- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay;
//
//- (void)hudShowError:(NSString *)message;
//
//
//// 0.5秒后停止
//- (void)hudHidden;
//
////自定义停止时间
//- (void)hudHidden:(NSTimeInterval)delay;
//
//// 立即停止
//- (void)hudHiddenImmediately;
//
//// 从重父视图中移除
//- (void)hudRemove;
//
//- (void)removeProgressHud;



@end
