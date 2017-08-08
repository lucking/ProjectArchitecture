//
//  CityTravelViewModel.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMViewModel.h"

@interface CityTravelViewModel : ZMViewModel

// 错误信号
@property (strong, nonatomic) RACSignal *travelConnectionErrors;
// 更多错误信号
@property (strong, nonatomic) RACSignal *travelMoreConnectionErrors;

// 更多数据请求
@property (strong, nonatomic) RACCommand *travelMoreDataCommand;
// 导航栏rightBar
@property (strong, nonatomic) RACCommand *rightBarButtonItemCommand;
// 游记详情
@property (strong, nonatomic) RACCommand *travelDetailCommand;


/**
 *  游记数据
 */
@property (strong, nonatomic) NSArray *travelData;
/**
 *  banner数据
 */
@property (strong, nonatomic) NSArray *bannerData;
/**
 *  是否为搜索
 */
@property (assign , nonatomic) BOOL  isSearch;

@end
