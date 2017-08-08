//
//  ZMViewModel.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMViewModel.h"
#import "ServerURL.h"

@interface ZMViewModel ()

@property (strong, nonatomic, readwrite) id<ZMViewModelService> services;
@property (strong, nonatomic, readwrite) RACCommand *requestDataCommand;
@property (assign, nonatomic, readwrite) ZMNavBarStyleType navBarStyleType;
@property (copy, nonatomic, readwrite) NSString *title;
@end

@implementation ZMViewModel

- (instancetype)initWithServices:(id<ZMViewModelService>)services params:(NSDictionary *)params
{
    if ([super init]) {
        
        self.services = services;//读取属性：CityTravelViewModel.m中使用
        self.navBarStyleType = [params[NavBarStyleTypekey] integerValue];
        self.title = params[ViewTitlekey];
        //请求信号
        @weakify(self);
        self.requestDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [[self executeRequestDataSignal:input] takeUntil:self.rac_willDeallocSignal];
        }];
        
        [self initialize];
    }
    return self;
}

- (void)initialize{}

- (RACSignal *)executeRequestDataSignal:(id)input
{
    return [RACSignal empty];
}



@end
