//
//  ZMCityTravelProtocolImpl.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMCityTravelProtocolImpl.h"
#import "ZMModelProtocol.h"
#import "BannerModel.h"
#import "CityTravelItemModel.h"
#import "HTConst.h"
#import "MJExtension.h"
#import "ServerURL.h"

@interface ZMCityTravelProtocolImpl()<ZMModelProtocol>
// banner数组
@property (strong, nonatomic) NSMutableArray *bannerData;
// item数组
@property (strong, nonatomic) NSMutableArray *itemData;
// 首页model数据
@property (strong, nonatomic) NSMutableDictionary *travelData;
/**
 *  加载更多
 */
@property (copy, nonatomic) NSString *next_start;
@end

@implementation ZMCityTravelProtocolImpl

- (RACSignal *)requestCityTravelDataSignal:(NSString *)requestUrl
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        __block NSURLSessionDataTask *task = nil;
        NSDictionary *params = @{@"cid":@"remen",
                                 };
        task = [NetworkManager requestGetURL:CityTravel_URL withParameters:params hudShow:NO success:^(id data) {
            // NSLog(@"---> data = %@ \n \n", data);
            [self.bannerData removeAllObjects];
            [self.itemData removeAllObjects];

            NSDictionary *responseDic = data;
            NSArray *responseArr = responseDic[@"data"][@"elements"];
            
            self.next_start = [NSString stringWithFormat:@"%@",data[@"data"][@"next_start"]];
            NSLog(@"---> next_start = %@ ", self.next_start);

            [responseArr enumerateObjectsUsingBlock:^(NSDictionary *data, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([data[@"type"] integerValue] == 1) {// 广告数据
                    
                    [data[@"data"][0] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        BannerModel *bannerModel = [BannerModel mj_objectWithKeyValues:obj];
                        [self.bannerData addObject:bannerModel];
                    }];
                    //self.bannerData = [BannerModel mj_objectArrayWithKeyValuesArray:data[@"data"][0]];

                }else if ([data[@"type"] integerValue] == 4){// item数据
                    
                    [data[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        CityTravelItemModel *itemModel = [CityTravelItemModel mj_objectWithKeyValues:obj];
                        [self.itemData addObject:itemModel];
                    }];
                    //self.itemData = [CityTravelItemModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
                }
            }];
            
            [self.travelData setValue:self.bannerData forKey:BannerDatakey];
            [self.travelData setValue:self.itemData forKey:TravelDatakey];
            
            [subscriber sendNext:self.travelData];
            [subscriber sendCompleted];
            
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)requestCityTravelMoreDataSignal:(NSString *)requestUrl
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSDictionary *params = @{@"next_start":(self.next_start ? self.next_start : @"1")};
        NSLog(@"------> params = %@",params);

        __block NSURLSessionDataTask *task = nil;
        task = [NetworkManager requestGetURL:CityTravel_URL withParameters:params hudShow:NO success:^(id data) {

            NSDictionary *responseDic = data;
            NSArray *responseArr = responseDic[@"data"][@"elements"];
            self.next_start = [NSString stringWithFormat:@"%@",data[@"data"][@"next_start"]];
            NSLog(@"------> next_start = %@",self.next_start);

            [responseArr enumerateObjectsUsingBlock:^(NSDictionary *data, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([data[@"type"] integerValue] == 4){// item数据
                    
                    [data[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        CityTravelItemModel *bannerModel = [CityTravelItemModel mj_objectWithKeyValues:obj];
                        [self.itemData addObject:bannerModel];
                    }];
                }
            }];
            
            //NSLog(@"---> self.itemData= %@",self.itemData);
            [self.travelData setValue:self.itemData forKey:TravelDatakey];
            //发送数据_travelData
            [subscriber sendNext:self.travelData];
            [subscriber sendCompleted];
            
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}


#pragma mark - getter
- (NSMutableArray *)bannerData
{
    return ZM_LAZY(_bannerData, @[].mutableCopy);
}
- (NSMutableArray *)itemData
{
    return ZM_LAZY(_itemData, @[].mutableCopy);
}
- (NSMutableDictionary *)travelData
{
    return ZM_LAZY(_travelData, @{}.mutableCopy);
}

@end
