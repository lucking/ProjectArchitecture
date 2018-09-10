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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    //系统返回按钮：隐藏文字、自定义文字、返回按钮的颜色
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];  
    //返回按钮的箭头颜色
    [self.navigationController.navigationBar setTintColor:Gray_888888];
    //    [self navBarColor:Gray_F5F5F5];
    //    [self navBackColor:Gray_888888];
    //    [self navBarColor:White_COLOR];
    
}

//系统方法：右滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.childViewControllers.count > 1;
}

// 导航背景颜色
- (void)navBarColor:(UIColor *)navColor {
    self.navigationController.navigationBar.barTintColor    = navColor;
    self.navigationController.navigationBar.backgroundColor = navColor;
}

/**
 * 设置航条：带右按钮 导
 */
- (void)zm_setNavTitle:(NSString *)str backBtnHidden:(BOOL)hidden originalBack:(BOOL)originalBack {
    
    ZMNavigationBarView *nav = [[ZMNavigationBarView alloc] init];
    nav.backButton.hidden = hidden;
    nav.title = str;
    [self.view addSubview:nav];
    self.zmNavBarView= nav;
    zmWS(weakSf);
    if (originalBack) {
        nav.zmBackBlock = ^{
            [weakSf.navigationController popViewControllerAnimated:YES];
        };
    }
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
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor
                   isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        
    }
}
//添加带标题的 BarButtonItemTitle
- (void)addBarButtonItemTitle:(NSString *)title itemStyle:(UIBarButtonItemStyle)itemStyle
                       target:(id)target action:(SEL)action font:(UIFont *)font
                    tintColor:(UIColor *)tintColor 
                  isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:itemStyle target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] forState:UIControlStateNormal];
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:itemStyle target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] forState:UIControlStateNormal];
    } 
}

//添加带图片的 BarButtonItem
- (void)addBarButtonItemImgName:(NSString *)imgName action:(SEL)action
                      tintColor:(UIColor *)tintColor
                    isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
    }
}

// 清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView {
    UIView *View= [UIView new];
    View.backgroundColor= [UIColor clearColor];
    [tabelView setTableHeaderView:View];
    [tabelView setTableFooterView:View];
}
// 菊花停止
- (void)hudHidden {
    [HHudProgress hudHidden];
}
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay{
    [HHudProgress hudShowMsg:message delay:delay addSubview:self.view];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [HHudProgress hudShowMsg:message delay:delay addSubview:self.view];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [HHudProgress hudShowSucceedMsg:message afterDelay:delay addSubview:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
