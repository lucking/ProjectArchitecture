//
//  ZMWebViewModel.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMWebViewModel.h"
#import "ServerURL.h"

@implementation ZMWebViewModel

- (instancetype)initWithServices:(id<ZMViewModelService>)services params:(NSDictionary *)params
{
    if (self = [super initWithServices:services params:params]) {
        
        _requestURL = params[RequestURLkey];
        _webType = [params[WebViewTypekey] unsignedIntegerValue];
    }
    return self;
}

@end
