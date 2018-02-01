//
//  ZMNavController.m
//  ZM_NavTabBar
//
//  Created by ZM on 14/9/23.
//  Copyright (c) 2014年 ZM. All rights reserved.
//

#import "ZMNavController.h"
#import "UIImage+ZMAdd.h"
#import "UIView+ZMFrame.h"
#import "BBaseViewController.h"

@interface ZMNavController ()<UIGestureRecognizerDelegate>

@end

@implementation ZMNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.title = @"首页";
    }
    return self;
}

+ (void)initialize
{
    //设置navigationBar样式
    [ZMNavController setNavigationBarAppearance];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    //3.自适应  （ 去掉：UITableView 、UIScrollView 空白间隙问题 ）
    self.automaticallyAdjustsScrollViewInsets = NO;
    //4.右滑返回的代理
    self.interactivePopGestureRecognizer.delegate = self;
    
    // 添加 通知：恢复_滑动返回功能
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"recoverSlideBack" object:nil];
    // 接收 通知：恢复_滑动返回功能
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recoverSlideBack) name:@"recoverSlideBack" object:nil];
}

- (void)recoverSlideBack {
    //右滑返回的代理
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
}

//系统方法：右滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    BOOL isBack = YES; // 默认为支持右滑返回
    //如果继承 BBaseViewController 也支持右滑返回 （//其他继承，根据要求另作处理）
    if ([self.topViewController isKindOfClass:[BBaseViewController class]]) {
        isBack = YES;
    }
    return isBack;
}

#pragma mark - Public Method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self setBackBtnItemNavVC:viewController];
    }
    [super pushViewController:viewController animated:YES];
}
//设置：默认返回按钮
- (void)setBackBtnItemNavVC:(UIViewController *)viewController {

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = Clear_COLOR;

    UIImage * imageNormal = [UIImage imageNamed:@"backWhite"];
    UIImage * imageSelect = [UIImage imageNamed:@"gray_Back@2x"];
    [btn setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:imageSelect forState:UIControlStateHighlighted];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setTitle:@"" forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(leftBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.size = imageNormal.size;
    
    UIBarButtonItem * BarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    viewController.navigationItem.leftBarButtonItem = BarBtnItem;
    
}
- (void)leftBarBtnClick:(UIButton *)Btn
{
    [self popViewControllerAnimated:YES];
}

/**
 *  设置navigationBar样式
 */
+ (void)setNavigationBarAppearance {
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:NavBg_COLOR];
}

#pragma mark 初始化导航栏主题
- (void)setNavTheme
{
    // 1.设置导航栏背景
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage resizeImage:@"NavigationBar_Background.png"] forBarMetrics:UIBarMetricsDefault];
    // 状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    // 2.设置导航栏文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    [barAttrs setObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName];
    [barAttrs setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:NSShadowAttributeName];
    [bar setTitleTextAttributes:barAttrs];
    
    // 3.按钮
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackgroundImage:[UIImage stretchableImage:@"BarButtonItem_Normal.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage stretchableImage:@"BarButtonItem_Pressed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionaryWithDictionary:barAttrs];
    [itemAttrs setObject:[UIFont boldSystemFontOfSize:13] forKey:NSFontAttributeName];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateHighlighted];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateDisabled];
    
    // 4.返回按钮
    [item setBackButtonBackgroundImage:[UIImage stretchableImage:@"BarButtonItem_Back_Normal.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackButtonBackgroundImage:[UIImage stretchableImage:@"BarButtonItem_Back_Pressed.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}



#pragma mark - /************************  以下测试 为使用案例  **************************/
- (void)testSetUI {
    
    self.view.backgroundColor = [UIColor purpleColor];
    /*  “ 注意 ！！”
     *
     *  在继承 UIViewController 里使用： self.navigationController.navigationBar 
     *  在本类 ZMNavController  里使用： self.navigationBar
     */

    //1.navigationBar下（0，0）开始
    // self.navigationBar.translucent = YES;//navigationBar的毛玻璃效果
    
    //2.导航栏下的起始坐标设置为(0,0)
    // self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //3.自适应  （ 去掉：UITableView 、UIScrollView、UIWebView 空白间隙问题 ）
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //4.右滑返回的代理
    self.interactivePopGestureRecognizer.delegate = self;
    
    // 添加 通知：恢复_滑动返回功能
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"recoverSlideBack" object:nil];
    
    // 接收 通知：恢复_滑动返回功能
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recoverSlideBack) name:@"recoverSlideBack" object:nil];

    
    /**
     *  UITableView、UIWebView、UIScrollView：因为 SSHEIGHT 的高度是全屏的高度
     */
     UIWebView *wwebView = nil;
     //方式一：
     //navigationBar下（0，0）开始
     self.navigationController.navigationBar.translucent = YES;// navigationBar的毛玻璃效果
     //自适应
     self.automaticallyAdjustsScrollViewInsets = NO;
     wwebView = [[UIWebView alloc] initWithFrame:CGRectMake(5,70, SSWIDTH-10, SSHEIGHT-80)];
     
     //方式二：
     //navigationBar下（0，0）开始
     self.navigationController.navigationBar.translucent = NO;// navigationBar的毛玻璃效果
     //自适应
     self.automaticallyAdjustsScrollViewInsets = NO;
     wwebView = [[UIWebView alloc] initWithFrame:CGRectMake(5,10, SSWIDTH-10, SSHEIGHT-80)];
   
    //用了UIWebView，顶部一直有64点的背景色的空条
    //解决方法：controller中添加 如下
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    // 没有效果
    //[[UINavigationBar appearance] setTintColor:NavBg_COLOR];//UIColorRGBA(227, 0, 42, 1.0)
    //iOS7之后由于navigationBar.translucent默认是YES，坐标零点默认在（0，0）点  当不透明的时候，零点坐标在（0，64）；如果你想设置成透明的，而且还要零点从（0，64）开始，那就添加：self.edgesForExtendedLayout = UIRectEdgeNone;
    //NSLog(@"---> onBack ");


    /**
     *  状态栏：修改背景颜色 
     */
    //黑底白字
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //白底黑字
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];    
    
    /**
     *  导航栏：修改背景颜色 改变UINavigationBar的颜色
     */
    // 方式一：
    UIImage *BgImg = [UIImage imageNamed:@"BgImg"];
    UIImage *ShadowImg = [UIImage imageNamed:@"ShadowImg"];
    
    // UINavigationController 使用
    [[UINavigationBar appearance] setBackgroundImage:BgImg forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:ShadowImg];

    // UIViewController 使用
    [self.navigationController.navigationBar setBackgroundImage:BgImg forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:ShadowImg];
    
    [self.navigationController.navigationBar.layer setBorderWidth:2.0];
    [self.navigationController.navigationBar.layer setBorderColor:[[UIColor redColor] CGColor]];
    
    //例：改变10个像素宽度的线的图像：
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"blue1.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"pink.png"]]; //显示真实的图片高度
    
    // 设置状态栏 背景颜色 方式二：
    self.navigationBar.translucent = NO;//navigationBar的毛玻璃效果 (设置背景色使用，设为YES颜色会变淡)
    self.navigationBar.barTintColor = [UIColor brownColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor brownColor];
    //同上
    // [self.navigationBar setBarTintColor:[UIColor magentaColor]];

    //同上
    // [self.navigationBar setBarTintColor:[UIColor magentaColor]];
    
    // 设置状态栏 背景颜色 方式三：
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    
    
    /**
     *  设置导航 标题 颜色
     */
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor]; //没有作用
    NSDictionary *titleChange = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIColor whiteColor],NSForegroundColorAttributeName,
                                 [UIFont boldSystemFontOfSize:18],NSFontAttributeName, nil];
    [self.navigationBar setTitleTextAttributes:titleChange];
    //self.navigationController.navigationBar.titleTextAttributes = titleChange;    
    
    //修改 NavBar 返回键的颜色
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    
    //修改 NavigationItem 的颜色
    self.navigationItem.title = @"旺旺";
    UIColor *color = [UIColor greenColor];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    //self.navigationItem.backBarButtonItem= BarBtnItem;

    
    /**
     *  修改系统 NavigationItem 的 BarButtonItem 的颜色
     */
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"通讯录" style:UIBarButtonItemStylePlain target:self action:@selector(contactMenu)];
    self.navigationItem.rightBarButtonItem = rightButton;
    //方式一
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //方式二
    NSDictionary *titleAttributesDic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIColor whiteColor],NSForegroundColorAttributeName,
                                        [UIFont boldSystemFontOfSize:16],NSFontAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:titleAttributesDic2 forState:UIControlStateNormal];
    
    //方式三
    rightButton.tintColor=[UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];


    //返回
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backItem)];
    //    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    // 添加联系人: 加号+
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(systemItemBtn)];
    //    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];

}


@end
