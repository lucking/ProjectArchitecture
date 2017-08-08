//
//  ZMWebViewModel.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMViewModel.h"

typedef NS_ENUM(NSUInteger, HTWebType) {
    kWebCityBannerDetailType   = 1, // 首页banner详情
    kWebFindDetailType         = 2, // 发现详情
};


@interface ZMWebViewModel : ZMViewModel
/**
 *  请求地址
 */
@property (copy, nonatomic) NSString *requestURL;
/**
 *  web页面类型
 */
@property (assign , nonatomic) HTWebType webType;

- (instancetype)initWithServices:(id<ZMViewModelService>)services params:(NSDictionary *)params;

@end
