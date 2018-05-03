//
//  ZMBaseViewController.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZMBaseViewController.h"

@interface ZMBaseViewController ()

@end

@implementation ZMBaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBar.tintColor = Clear_COLOR;
    //[self test];
}

//view 将要出现
- (void)viewWillAppear:(BOOL)animated {
}
//view 已经出现
- (void)viewDidAppear:(BOOL)animated {
}
//view 将要消失
- (void)viewWillDisappear:(BOOL)animated {
}
//view 已经消失
- (void)viewDidDisappear:(BOOL)animated {
}


//系统方法：右滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"---> self.navVC.childVCs.count = %ld ",self.navigationController.childViewControllers.count);
    NSLog(@"---> self.childVCs.count = %ld \n ",self.childViewControllers.count);
    return self.navigationController.childViewControllers.count > 1;
    //或 return YES;
}

//导航标题 navTitle
-(void)setTitle:(NSString*)title TitleColor:(UIColor*)color
{
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.frame= CGRectMake(0, 0, 100, 30);
    titleLab.textColor = color;
    [titleLab setText:title];
    titleLab.text = title;
    titleLab.textAlignment= NSTextAlignmentCenter;
    titleLab.font= [UIFont boldSystemFontOfSize:20];
    self.titleNavLab = titleLab;
    self.navigationItem.titleView = self.titleNavLab;
}

- (void)setTitleCustom:(NSString *)titleCustom {
    _titleCustom = titleCustom;
    _titleNavLab.text = titleCustom;
}

//使用系统的 BarButtonSystemItem
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action
                     tintColor:(UIColor *)tintColor isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        
    }
}
//添加带图片的 BarButtonItem
- (void)addBarButtonImageItemImgName:(NSString *)imgName action:(SEL)action
                           tintColor:(UIColor *)tintColor isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
    }
}

// 菊花停止
- (void)hudHidden {
    [[HudProgress singleton] hudHidden];
}
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    [[HudProgress singleton] hudShowLoadingMsg:message afterDelay:delay addSubview:nil];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [[HudProgress singleton] hudShowLoadingMsg:message afterDelay:delay addSubview:nil];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [[HudProgress singleton] hudShowSucceedMsg:message afterDelay:delay addSubview:nil];
}

- (void)dealloc {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
