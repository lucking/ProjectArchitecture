//
//  Test_enum.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_enum.h"

// 枚举一
enum {
    Sex_Man,
    Sex_Woman
};
typedef NSUInteger Sex;

// 枚举二
typedef enum {
    HomeBtnTagAA       = 101,
    HomeBtnTagBB       = 102,
    HomeBtnTagCC       = 103,
}HomeButtonTag;

// 枚举三
typedef NS_ENUM(NSInteger,UserSex) {
    UserSex_Man    = 101,
    UserSex_Woman  = 102,
    UserSex_xxx    = 103,
};
/** 聊天框的功能选择 */
typedef NS_OPTIONS(NSUInteger, ChatBoxFunctionModel) {
    /// 
    ChatTextfieldModel  = 1 << 0,
    ///
    ChatEmojiModel      = 1 << 1,
    /// 
    ChatMoreModel       = 1 << 2,
    /// 
    ChatAskModel        = 1 << 3,
};
///// 
//typedef NS_OPTIONS(NSUInteger, YYWebImageOptions) {
//    /// 
//    YYWebImageOptionShowNetworkActivity = 1 << 0,
//    ///
//    YYWebImageOptionProgressive = 1 << 1,
//    ///
//    YYWebImageOptionProgressiveBlur = 1 << 2,
//    ///
//    YYWebImageOptionUseNSURLCache = 1 << 3,
//};
//
/////
//typedef NS_ENUM(NSUInteger, YYWebImageFromType) {
//    /// 
//    YYWebImageFromNone = 0,
//    /// 
//    YYWebImageFromMemoryCacheFast,
//    /// 
//    YYWebImageFromMemoryCache,
//    /// 
//    YYWebImageFromDiskCache,
//    /// 
//    YYWebImageFromRemote,
//};


@implementation Test_enum


+ (void)test_enum {
    
    
}


@end
