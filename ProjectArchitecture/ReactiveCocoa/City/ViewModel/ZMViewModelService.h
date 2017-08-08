//
//  ZMViewModelService.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMModelProtocol.h"

@protocol ZMViewModelService <NSObject>

// 获取首页服务
- (id<ZMModelProtocol>) getCityTravelService;



// 获取发现服务
- (id<ZMModelProtocol>) getFindService;
// 获取探索视频服务
- (id<ZMModelProtocol>) getExploreMoreService;
// 获得web服务
- (id<ZMModelProtocol>) getWebService;
// 获取目的地服务
// 获取我的服务



@end
