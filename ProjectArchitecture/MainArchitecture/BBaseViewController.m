//
//  BBaseViewController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "BBaseViewController.h"
#import "AppDelegate.h"
#import "BaseHeader.h"
#import "ZMTabBarController.h"

@interface BBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BBaseViewController
//- (void)loadView{}

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
- (void)viewWillAppear:(BOOL)animated
{
    //[super viewWillAppear:animated];
    //[self.navigationController.navigationBar setBarTintColor:NavBg_COLOR];
    //在此写（在viewWillAppear里写），有3级以上vc，vc消失时，delegate为重新代理，依然支持右滑返回功能
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;
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
    //或
    //    return YES;
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
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target
                        action:(SEL)action
                     tintColor:(UIColor *)tintColor
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
//添加带图片的 BarButtonItem
- (void)addBarButtonImageItemImgName:(NSString *)imgName
                              action:(SEL)action
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
- (void)clearTableViewLine:(UITableView *)tabelView
              isHeaderView:(BOOL)isHeader
              isFooterView:(BOOL)isFooter {
    UIView *View=[UIView new];
    View.backgroundColor= [UIColor clearColor];
    if (isHeader) { [tabelView setTableHeaderView:View]; }
    if (isFooter) { [tabelView setTableFooterView:View]; }
}


// 添加线 控制：坐标、颜色、透明度
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha
{
    UIView* line1= [[UIView alloc]initWithFrame:rect];
    line1.backgroundColor= color;
    line1.alpha= alpha;
    [view addSubview:line1]; 
}


// 添加单击手势：控制键盘
- (void)addTapGesture
{
    UITapGestureRecognizer * gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
}
//手势绑定的事件
-(void)tapGestureClick{
    [self.view endEditing:YES];
}

// 添加按钮：UIButton
-(void)addBtnTitle:(NSString*)title frame:(CGRect)frame Tag:(int)tag
{
    UIButton *Btn1= [UIButton buttonWithType:UIButtonTypeCustom];
    Btn1.backgroundColor = [UIColor whiteColor];
    Btn1.frame = frame;
    Btn1.layer.cornerRadius= 5;
    Btn1.layer.masksToBounds= YES;
    Btn1.layer.borderWidth= 1.2;
    Btn1.layer.borderColor= Color_70AEE1.CGColor;
    Btn1.titleLabel.font= [UIFont systemFontOfSize:15];
    Btn1.tag = tag;
    [Btn1 setTitle:title forState:UIControlStateNormal];
    [Btn1 setTitleColor:Color_F44336 forState:UIControlStateNormal];
    [Btn1 addTarget:self action:@selector(myBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn1];
    
//    Btn1.backgroundColor = RandomColor;
//    [Btn1 setTitleColor:White_COLOR forState:UIControlStateNormal];
    //NSLog(@"---> RandomColor= %@", Btn1.backgroundColor);
}
- (void)myBtnClick:(UIButton *)Btn{
    
}
// 菊花停止
- (void)hudHidden {
//    [MMBProgress hudHiddenImmediately];
}
// 等待：提示信息
- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay
{
//    [MMBProgress hudShowLoading:message afterDelay:delay];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
//    [MMBProgress hudShowMessage:message afterDelay:delay];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
//    [MMBProgress hudShowSucceed:message afterDelay:delay];
}


- (void)test {
    
    //在此写（在viewDidLoad里写），有3级以上vc，vc消失时，delegate为nil，失去右滑返回功能
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;
    //self.backBtn.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
