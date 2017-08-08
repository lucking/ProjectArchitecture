//
//  YSLocalizationString.m
//  Architecture
//
//  Created by ZM on 16/8/8.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "YSLocalizationString.h"
#import <objc/runtime.h>

NSString *const YSLocalizationStringDidChanged = @"YSLocalizationStringDidChanged";
NSString *const KLocalizableSetting = @"KLocalizableSetting";

@implementation YSLocalizationString {
    NSString *_currentLocalizable;
}

@synthesize localizableNames = _localizableNames;

+ (instancetype)shareLocalizable {
    static YSLocalizationString *localizable;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localizable = [[YSLocalizationString alloc]init];
        [localizable getlocalizableNames];
        [localizable settingParment];
    });
    return localizable;
}

- (void)settingParment{
    if (![self isExitLocalLocalizable]) {
        _nomarLocalizable = @"en";
    }else {
        _nomarLocalizable = [[NSUserDefaults standardUserDefaults] objectForKey:KLocalizableSetting];
    }
}

- (void)setNomarLocalizable:(NSString *)nomarLocalizable {
    _nomarLocalizable = nomarLocalizable;
    [[NSUserDefaults standardUserDefaults]setObject:nomarLocalizable forKey:KLocalizableSetting];
    [[NSUserDefaults standardUserDefaults]synchronize];
    if(self.isSuppoutAppSettingLocalizable) {
        [[NSNotificationCenter defaultCenter]postNotificationName:YSLocalizationStringDidChanged object:nil];
    }else {
        exit(0);
    }
}

- (NSString *)YSLocalizedString:(NSString *)translation_key {
    NSString * s = NSLocalizedStringFromTable(translation_key, nil, nil);
    if (!_currentLocalizable) {
        _currentLocalizable = [[NSLocale preferredLanguages] objectAtIndex:0];
    }
    if (![self currentLocalizable:_currentLocalizable] || [self isExitLocalLocalizable]) {
        NSString * path = [[NSBundle mainBundle] pathForResource:_nomarLocalizable ofType:@"lproj"];
        NSBundle * languageBundle = [NSBundle bundleWithPath:path];
        s = [languageBundle localizedStringForKey:translation_key value:@"" table:nil];
    }
    return s;
}

- (void)getlocalizableNames{
    NSArray *array = [[NSBundle mainBundle]pathsForResourcesOfType:@"lproj" inDirectory:nil];
    NSMutableArray *filltArray = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj = [obj stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@/",[NSBundle mainBundle].resourcePath] withString:@""];
        obj =[obj stringByReplacingOccurrencesOfString:@".lproj" withString:@""];
        [filltArray addObject:obj];
    }];
    _localizableNames = filltArray;
}

- (BOOL)currentLocalizable:(NSString *)locallizable{
    __block BOOL isExit = NO;
    [_localizableNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj rangeOfString:locallizable].length !=NSNotFound) {
            isExit = YES;
            *stop = YES;
        }
    }];
    return isExit;
}

- (BOOL)isExitLocalLocalizable {
    return  [[NSUserDefaults standardUserDefaults] objectForKey:KLocalizableSetting]?YES:NO;
}

@end
