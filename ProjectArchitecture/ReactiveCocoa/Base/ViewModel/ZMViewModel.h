//
//  ZMViewModel.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMViewModelService.h"
#import <RealReachability.h>


typedef NS_ENUM(NSUInteger, ZMNavBarStyleType) {
    kNavBarStyleNomal   = 0, // 默认
    kNavBarStyleHidden  = 1, // 隐藏
};


@interface ZMViewModel : NSObject
/**
 *  数据请求
 */
@property (strong, nonatomic, readonly) RACCommand *requestDataCommand;
/**
 *  网络状态
 */
@property (assign, nonatomic) ReachabilityStatus  netWorkStatus;
/**
 *  NavBar类型
 */
@property (assign, nonatomic, readonly) ZMNavBarStyleType navBarStyleType;
/**
 *  标题
 */
@property (copy, nonatomic, readonly) NSString *title;
/**
 *  viewModel服务
 */
@property (strong, nonatomic, readonly) id<ZMViewModelService> services;

- (instancetype)initWithServices:(id<ZMViewModelService>)services params:(NSDictionary *)params;
- (void)initialize;

- (RACSignal *)executeRequestDataSignal:(id)input;

@end

