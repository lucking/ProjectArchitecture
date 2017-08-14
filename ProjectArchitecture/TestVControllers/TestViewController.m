//
//  TestViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "TestViewController.h"
#import "UIViewController+ZMAdd.h"

#import "UIVController.h"
#import "UIView_VController.h"
#import "UILabel_VController.h"
#import "UIButton_VController.h"
#import "UITextField_VController.h"
#import "UIScrollView_VController.h"
#import "UITableView_VC_HeaderStretch.h"
#import "TableView_VC_Checkmark.h"
#import "TableView_VC_CheckImage.h"
#import "TableView_VC_CheckMoreBox.h"
#import "TableVC_CheckMoreBox.h"
#import "UICollectionView_VC.h"
#import "UISearchBar_VC.h"

#import "NSObject_VController.h"
#import "NSArray_VController.h"

#import "NumeralVController.h"
#import "HeadersVController.h"
#import "Placeholder_VC.h"
#import "AFNetworkingBase_VC.h"
#import "Network_VController.h"
#import <YYWebImage.h>
#import "UIView+ZMAdd.h"

@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   
}
@property (nonatomic, strong) UITableView* ttableView;;
@property (nonatomic, retain) NSArray* titleArray;
@property (nonatomic, strong) NSArray *controllers;
@end

@implementation TestViewController
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    //隐藏tabBar
//    self.tabBarController.tabBar.hidden = YES;
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //返回按钮
//    [self backBtnWhiteColorNoNavBar:NO];
//    NSLogline(@"---> title= %@", self.title);
//}

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.title = @"Examples";
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    
    self.controllers = nil;
    self.titleArray = nil;
    //测试UI：UIKit.framework
    if ([self.vcType isEqualToString:@"UIVC"]) {
        [self UI_VC];
    }
    //测试NS：Foundation.framework
    else if ([self.vcType isEqualToString:@"NSVC"]){
        [self testNS_VC];
    }
    //测试 其他类型
    else if ([self.vcType isEqualToString:@"OtherVC"]){
        [self OtherVC];
    }
    if (_ttableView!= nil) {
        [_ttableView reloadData];
    }
    
}

- (void)test {
    //    AATestVController* pushVC= [[AATestVController alloc] init];
    //    [self.navigationController pushViewController:pushVC animated:YES];
    
    //    BBTestVController* pushVC= [[BBTestVController alloc] init];
    //    [self.navigationController pushViewController:pushVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"OtherVC";
    self.view.backgroundColor = BgColor;
    
    [self initUI];
    
}

#pragma mark ---------" UI_VC：控件视图 "------------
#pragma
- (void)UI_VC {
    
    self.controllers = @[[[UIVController alloc]init],
                         [UIView_VController new],
                         [UILabel_VController new],
                         [UIButton_VController new],
                         [UITextField_VController new],
                         [UIScrollView_VController new],
                         
                         [UITableView_VC_HeaderStretch new],
                         [TableView_VC_Checkmark new],
                         [TableView_VC_CheckImage new],
                         [TableView_VC_CheckMoreBox new],
                         [TableVC_CheckMoreBox new],
                         [UICollectionView_VC new],

                         [UISearchBar_VC new],
                         [UIView_VController new],
                         ];
    self.titleArray = @[@"UIVController",
                        @"UIView_VC",
                        @"UILabel_VC",
                        @"UIButton_VC",
                        @"UITextField_VC",
                        @"UIScrollView_VC",
                        @"UITableView_VC_HeaderStretch",
                        @"TableView_VC_Checkmark",
                        @"TableView_VC_CheckImage",
                        @"TableView_VC_CheckMoreBox",
                        @"TableVC_CheckMoreBox",
                        @"UICollectionView_VC",

                        @"UISearchBar_VC",
                        ];
    UIViewController *vc;
    for (int i=0; i<self.titleArray.count; i++) {
        vc = self.controllers[i];
        vc.title = self.titleArray[i];
    }
}

#pragma mark ---------" NS_VC：基础类型 "------------
#pragma
- (void)testNS_VC {
    self.controllers = @[[[NSObject_VController alloc]init],
                         [[NSArray_VController alloc]init],
                         ];
    self.titleArray = @[@"NSObject_VC",
                        @"NSArray_VC",
                        ];
    UIViewController *vc;
    for (int i=0; i<self.titleArray.count; i++) {
        vc = self.controllers[i];
        vc.title = self.titleArray[i];
    }
}

#pragma mark ---------" OtherVC：其他类型 "------------
#pragma
- (void)OtherVC {
    self.controllers = @[[[HeadersVController alloc]init],
                         [[NumeralVController alloc]init],
                         [[Placeholder_VC alloc]init],
                         [[AFNetworkingBase_VC alloc]init],
                         [[Network_VController alloc]init],
                         ];
    self.titleArray = @[@"HeadersVC",
                        @"NumeralVC",
                        @"Placeholder_VC",
                        @"AFNetworkingBase_VC",
                        @"Network_VC",
                        ];
    UIViewController *vc;
    for (int i=0; i<self.titleArray.count; i++) {
        vc = self.controllers[i];
        vc.title = self.titleArray[i];
    }
}

#pragma mark UITableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSSLog(@"indexPath = %ld",(long)indexPath.row);
    // 刚选中又马上取消选中，格子不变色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //进入测试页
    [self.navigationController pushViewController:self.controllers[indexPath.row] animated:YES];
    //FirstViewController *firstVC = [[FirstViewController alloc]init];
    //[self.navigationController pushViewController:firstVC animated:YES];
    if (indexPath.row == 0) {
    }else if (indexPath.row == 1 ){
    }else if (indexPath.row == 2 ){
    }else if (indexPath.row == 3 ){
    }else if (indexPath.row == 4 ){
    }
}
#pragma mark ------"  UITableViewDataSource、UITableViewDelegate  "------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    for (UIView *subviews in [cell.contentView subviews]) {
        [subviews removeFromSuperview];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}
- (void)initUI
{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    float yy = 74;
    _ttableView= [[UITableView alloc]initWithFrame:CGRectMake(5, yy,SSWIDTH-10, SSHEIGHT-yy)];
    _ttableView.backgroundColor = White_COLOR;
    _ttableView.delegate = self;
    _ttableView.dataSource= self;
    _ttableView.scrollEnabled= YES;
    _ttableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_ttableView];
    [UIView clearTableViewLine:_ttableView isHeaderView:YES isFooterView:YES];
}

@end

