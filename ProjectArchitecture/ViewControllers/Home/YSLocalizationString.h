//
//  YSLocalizationString.h
//  Architecture
//
//  Created by ZM on 16/8/8.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#undef NSLocalizedString
#define NSLocalizedString(key,comment) [[YSLocalizationString shareLocalizable]YSLocalizedString:key]

FOUNDATION_EXTERN NSString *const YSLocalizationStringDidChanged;   //语言切换的通知
/**
 *  大神们,谁搞过国际化  就是手机系统语言切换英文后  
    自己开发的软件也切换成英文.我配置了 strings 文件  也添加了语言  但是完全不会变啊
 */
// 管理国际化的类
@interface YSLocalizationString : NSObject
@property (nonatomic, strong, readonly) NSArray *localizableNames;  // 获取工程支持的多语言的数组
@property (nonatomic, copy) NSString *nomarLocalizable;             // 默认的语言 默认为英语
@property (nonatomic, assign) BOOL isSuppoutAppSettingLocalizable;  // 是否支持APP内部进行切换语言 默认不支持 强行设置nomarLocalizable 属性会退出程序

+(instancetype)shareLocalizable;                            // 对类初始化单例
-(NSString *)YSLocalizedString:(NSString *)translation_key; // 用NSLocalizedString宏进行调用国际化
@end



