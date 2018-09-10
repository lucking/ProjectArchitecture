//
//  CityTravelNotesController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CityTravelNotesController.h"
#import "UIViewController+ZMAdd.h"
#import "ZMModelProtocol.h"
#import "AppDelegate.h"
#import "CityTravelViewModel.h"
#import "ZMViewModelService.h"
#import "ZMViewModelServicesImpl.h"
#import "BannerModel.h"
#import "CityTravelItemModel.h"
#import "ZMCarouselView.h"
#import "UIView+ZMFrame.h"
#import <MJRefresh.h>
#import "CityTravelCell.h"
#import "ServerURL.h"

static NSString *Identifier = @"CityTravelCell";

@interface CityTravelNotesController ()<ZMModelProtocol, UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView* ttableView;
// BannerView
@property (strong, nonatomic) ZMCarouselView *bannerView;
// banner数组
@property (strong, nonatomic) NSMutableArray *bannerData;
// item数组
@property (strong, nonatomic) NSMutableArray *itemData;
// 首页model数据
@property (strong, nonatomic) NSArray *travelData;

@property (strong, nonatomic) BannerModel *bannerModel;
@property (strong, nonatomic) CityTravelItemModel *itemModel;
/**
 *  首页viewModel
 */
@property (strong, nonatomic) CityTravelViewModel *cityTravelViewModel;
/**
 *  数据服务
 */
@property (strong, nonatomic) ZMViewModelServicesImpl *viewModelService;
@end

@implementation CityTravelNotesController


- (void)viewWillAppear:(BOOL)animated {
    [self.bannerView startAnimation];
    self.bannerView.hidden= NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.bannerView stopAnimation];
    self.bannerView.hidden= YES;
}
- (void)viewDidDisappear:(BOOL)animated {

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self zm_backBtnNoNavBar:NO normalBack:YES];
    self.title = @"旅游";

    self.itemData = [[NSMutableArray alloc] initWithObjects:@"去你妈的",@"去你妈的", nil];
    self.bannerModel = [[BannerModel alloc] init];
    self.itemModel = [[CityTravelItemModel alloc] init];

    [self.view addSubview:self.ttableView];
    //[self.view addSubview:self.bannerView];
    
    // 数据服务协议
    self.viewModelService = [[ZMViewModelServicesImpl alloc] initModelServiceImpl];
    // 首页：视图模型
    self.cityTravelViewModel = [[CityTravelViewModel alloc] initWithServices:self.viewModelService params:nil];
    
    [self bindViewModel];
    
    @weakify(self);
    // 下拉刷新
    self.ttableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
       @strongify(self);
       [self.cityTravelViewModel.requestDataCommand execute:@1];
    }];
    [[self.cityTravelViewModel.requestDataCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        @strongify(self);
        if (!executing.boolValue) {
            [self.ttableView.mj_header endRefreshing];
        }
    }];
    
    // 上拉加载更多
    self.ttableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉加载更多");
        [self.cityTravelViewModel.travelMoreDataCommand execute:@1];
    }];
    [[self.cityTravelViewModel.travelMoreDataCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        @strongify(self);
        if (!executing.boolValue) {
            [self.ttableView.mj_footer endRefreshing];
        }
    }];

    
    //观察 travelData 数据信号
    RACSignal *source = RACObserve(self.cityTravelViewModel, travelData);
    [source subscribeNext:^(id x) {
        @strongify(self);
        self.travelData = x;
        //NSLog(@"------> travelData data_x = %@",x);
        NSLog(@"------> travelData.count = %ld \n ",self.travelData.count);
        [self.ttableView reloadData];
    }];
    //观察 bannerData 数据信号
    self.bannerView.imageURLSignal = RACObserve(self.cityTravelViewModel, bannerData);
}

//绑定模型视图
- (void)bindViewModel
{
    [RACObserve(ZM_APPDelegate , NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
        
        if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
            NSLog(@"------> execute:@(RealStatusNotReachable)");
            
            [self.cityTravelViewModel.requestDataCommand execute:@(RealStatusNotReachable)];
        }else{
            NSLog(@"------> execute:@1 ");
            [self.cityTravelViewModel.requestDataCommand execute:@1];
        }
    }];
}

#pragma mark ============="  UITableViewDataSource、UITableViewDelegate  "==================
#pragma
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.travelData.count > 0) {
        self.ttableView.mj_footer.hidden = (self.travelData.count == 0) ? YES : NO;
        return self.travelData.count;
    }else{
        //return self.itemData.count;
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityTravelCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[CityTravelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    if (self.travelData.count > 0) {
        [cell bindViewModel:self.cityTravelViewModel withParams:@{DataIndex:@(indexPath.row)}];
    }else{
        //cell.textLabel.text = self.itemData[indexPath.row];
    }
    return cell;
}

#pragma mark - getter_Coco
- (NSMutableArray *)bannerData {
    return ZM_LAZY(_bannerData, @[].mutableCopy);
}
- (NSMutableArray *)itemData {
    return ZM_LAZY(_itemData, @[].mutableCopy);
}
- (NSArray *)travelData {
    return ZM_LAZY(_travelData, @{}.mutableCopy);
}

#pragma mark - getter_UI
- (UITableView *)ttableView
{
    return ZM_LAZY(_ttableView, ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableHeaderView = self.bannerView;
        tableView.rowHeight = 180;
        tableView.tableFooterView = [UIView new];
        tableView;
    }));
}
- (ZMCarouselView *)bannerView
{
    return ZM_LAZY(_bannerView, ({
        ZMCarouselView *view = [[ZMCarouselView alloc] initWithFrame:CGRectMake(0, 70, SSWIDTH, 170)];
        view.cornerRadius = 5;
        view.autoScrollTimeInterval = 0.2;
        view.placeholder = @"tripdisplay_photocell_placeholder";
        view;
    }));
}


@end
