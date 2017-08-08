
//
//  ZMViewModelServicesImpl.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMViewModelServicesImpl.h"

#import "ZMCityTravelProtocolImpl.h"
#import "ZMModelProtocol.h"

@interface ZMViewModelServicesImpl ()
/**
 *  首页数据服务
 */
@property (strong, nonatomic) ZMCityTravelProtocolImpl *cityTravelProtocol;
@end

@implementation ZMViewModelServicesImpl


//初始化 服务协议
- (instancetype)initModelServiceImpl
{
    if (self = [super init]) {
        _cityTravelProtocol = [ZMCityTravelProtocolImpl new];
    }
    return self;
}

// 实现“ 获取服务协议 ”方法
- (id<ZMModelProtocol>)getCityTravelService
{
    return self.cityTravelProtocol;
}


// 获取发现服务
- (id<ZMModelProtocol>) getFindService {
    return nil;
}
// 获取探索视频服务
- (id<ZMModelProtocol>) getExploreMoreService {
    return nil;
}
// 获得web服务
- (id<ZMModelProtocol>)getWebService {
    return nil;
}



@end
