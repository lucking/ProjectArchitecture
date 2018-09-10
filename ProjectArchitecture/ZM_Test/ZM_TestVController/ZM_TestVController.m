//
//  TestViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZM_TestVController.h"
#import "APPUpdateAlertView.h"
#import "TestBBView.h"
#import "TestModel.h"
#define _HeaderViewHeight  100


@interface ZM_TestVController ()
@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, strong) NSMutableArray <TestModel *>*testArray;
@end

@implementation ZM_TestVController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //将要出现
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //已经出现
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //将要消失
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //已经消失
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    [self zm_setNavTitle:@"ZM_TestBaseVC" backBtnHidden:NO originalBack:YES];
    [self.zmNavBarView setBackgroundColor:UIColorRGB(233,233,233)];
    
    
    APPUpdateAlertView  *view1 = [APPUpdateAlertView appUpdateAlertView] ;
    //    APPUpdateAlertView  *view1 = [[APPUpdateAlertView alloc] init];
    [self.view addSubview:view1];
    view1.frame = CGRectMake(100,50, 200, 100);
    
    //    TestBBView  *view2 = [[TestBBView alloc] init];
    //    [self.view addSubview:view2];
    //    view2.frame = CGRectMake(50,300, 300, 200);
    
    TestBBView  *view3 = [TestBBView appUpdateAlertView];
    [self.view addSubview:view3];
    view3.frame = CGRectMake(50,300, 300, 200);
    view3.backgroundColor = [RandomColor colorWithAlphaComponent:0.1];    
}


#pragma mark ------------------  setter getter ------------------、

- (UIView *)headerView{
    return ZM_LAZY(_headerView, ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SSWIDTH, _HeaderViewHeight)];
        view;
    }));
}
- (NSMutableArray<TestModel *> *)testArray{
    return ZM_LAZY(_testArray, @[].mutableCopy);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    NSLog(@"---内存警告_%@：",NSStringFromClass([self class]));
}

- (void)dealloc {
//    NSLog(@"---dealloc: %@：",NSStringFromClass([self class]));
}


@end

