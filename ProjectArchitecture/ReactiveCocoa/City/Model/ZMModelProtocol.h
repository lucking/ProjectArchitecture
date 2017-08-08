//
//  ZMModelProtocol.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

// 数据加载 协议
@protocol ZMModelProtocol <NSObject>


@optional
// 首页：数据
- (RACSignal *)requestCityTravelDataSignal:(NSString *)requestUrl;
// 首页：更多数据
- (RACSignal *)requestCityTravelMoreDataSignal:(NSString *)requestUrl;

// 发现：数据
- (RACSignal *)requestFindDataSignal:(NSString *)requestUrl;
// 发现：更多数据
- (RACSignal *)requestFindMoreDataSignal:(NSString *)requestUrl;

// 探索视频：数据
- (RACSignal *)requestExploreVideosDataSignal:(NSString *)requestUrl;
// 探索视频：更多数据
- (RACSignal *)requestExploreVideosMoreDataSignal:(NSString *)requestUrl;

@end
