//
//  ZMBaseViewController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMBBaseViewController.h"
#import "ZMViewModel.h"
#import "AppDelegate.h"

@interface ZMBBaseViewController ()
@property (strong, nonatomic, readwrite) ZMViewModel *viewModel;

@end

@implementation ZMBBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}
//- (void)loadView{ }

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBar.tintColor = Clear_COLOR;
    
    //[self test];
    
    [self bindViewModel];
    
}
- (instancetype)initWithViewModel:(ZMViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        
    }
    return self;
}
- (void)bindViewModel
{
    [RACObserve(ZM_APPDelegate , NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
        
        if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
            NSLog(@"------> execute:@(RealStatusNotReachable)  ");
            [self.viewModel.requestDataCommand execute:@(RealStatusNotReachable)];
        }else{
            NSLog(@"------> execute:@1  ");
            [self.viewModel.requestDataCommand execute:@1];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
