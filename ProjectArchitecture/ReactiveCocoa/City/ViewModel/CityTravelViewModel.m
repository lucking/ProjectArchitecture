//
//  CityTravelViewModel.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CityTravelViewModel.h"
#import "HTConst.h"
#import "ZMViewModel.h"
#import "ZMViewModelService.h"
#import "ZMCityTravelProtocolImpl.h"
#import "ServerURL.h"

@implementation CityTravelViewModel

- (instancetype)initWithServices:(id<ZMViewModelService>)services params:(NSDictionary *)params
{
    if (self = [super initWithServices:services params:params]) {
        
        _travelData = [NSArray new];
        _bannerData = [NSArray new];
        _isSearch = NO;
    }
    return self;
}


- (void)initialize
{
    [super initialize];
    
    RACSignal *visibleStateChanged = [RACObserve(self, isSearch) skip:1];
    
    [visibleStateChanged subscribeNext:^(NSNumber *visible) {
        
        _isSearch = visible.boolValue;
    }];
    //更多数据
    _travelMoreDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [[[self.services getCityTravelService] requestCityTravelMoreDataSignal:CityTravel_URL] doNext:^(id  _Nullable result) {
            //接收数据_travelData
            self.travelData = result[TravelDatakey];
            
        }];
    }];
    _travelMoreConnectionErrors = _travelMoreDataCommand.errors;
}



//执行请求
- (RACSignal *)executeRequestDataSignal:(id)input
{
    if ([input integerValue] == RealStatusNotReachable) {
        
        self.netWorkStatus = RealStatusNotReachable;
        return [RACSignal empty];
    }else{

//        ZMCityTravelProtocolImpl *_cityTravelProtocol = [ZMCityTravelProtocolImpl new];
//        //获取服务：实现请求协议
//        return [[_cityTravelProtocol requestCityTravelDataSignal:CityTravel_URL] doNext:^(id  _Nullable result) {
//            //获取数据后
//            NSLogline(@"-----> executeRequestDataSignal_requestCityTravelDataSignal_getData \n ");
//            self.bannerData = result[BannerDatakey];
//            self.travelData = result[TravelDatakey];
//        }];
        
        //同上
        //获取服务：实现请求协议
        return [[[self.services getCityTravelService] requestCityTravelDataSignal:CityTravel_URL] doNext:^(id  _Nullable result) {
            //获取数据后
            NSLog(@"-----> executeRequestDataSignal_requestCityTravelDataSignal_getData \n ");
            self.bannerData = result[BannerDatakey];
            self.travelData = result[TravelDatakey];
        }];
    }
}

@end
