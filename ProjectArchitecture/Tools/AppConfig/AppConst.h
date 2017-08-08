//
//  AppConst.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**********  ***********/
/**
 * AppConfig
 */
//==============================="  模块1  "=================================
//==============================="  模块2  "=================================
//==============================="  模块3  "=================================
//==============================="  模块4  "=================================

//数据类型
typedef NS_ENUM(NSUInteger, TopicType) {
    TopicTypeAll    = 11,   // 全部
    TopicTypePicture= 21,   // 图片
    TopicTypeTalk   = 31,   // 段子
    TopicTypeVoice  = 41,   // 声音
    TopicTypeVideo  = 51    // 视频
};

// 隐藏侧边菜单
FOUNDATION_EXTERN NSString *const NotiMsg_HiddenMenu_rightSwipe;
// 显示侧边菜单
FOUNDATION_EXTERN NSString *const NotiMsg_ShowMenu_LeftSwipe;


#pragma mark ======================"  Hud  "==============================

FOUNDATION_EXTERN CGFloat const Hud_DelayTime;          //延时
FOUNDATION_EXTERN CGFloat const Hud_AlertTime;          //一般提示
FOUNDATION_EXTERN CGFloat const Hud_FailureTime;        //失败提示时间
FOUNDATION_EXTERN CGFloat const Hud_ErrorTime;          //错误提示时间
FOUNDATION_EXTERN CGFloat const Hud_SuccessTime;        //成功提示时间
FOUNDATION_EXTERN CGFloat const Hud_SuccessTime_Delay;

FOUNDATION_EXTERN NSInteger const ValidTime;
FOUNDATION_EXTERN NSInteger const RefreshTime;
FOUNDATION_EXTERN NSInteger const LocateValidTime;





//@interface AppConst : NSObject
//
//@end



