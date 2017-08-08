//
//  ZMViewModelServicesImpl.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMViewModelService.h"

#pragma mark - /************************  加载服务 实现“ 获取服务协议 ”  方法 **************************/
@interface ZMViewModelServicesImpl : NSObject<ZMViewModelService>

- (instancetype)initModelServiceImpl;

@end
