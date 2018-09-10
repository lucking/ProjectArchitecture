//
//  ZM_TestBaseVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/6/7.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_TestBaseVC.h"
#import "ZM_TestHeader.h"
#import "UIViewController+ZMAdd.h"
#import "UIView+ZMAdd.h"


//在堆区的变量：NSStringFromClass([self class])
//下面在变量区：SelfClassString
static NSString *SelfClassString = @"ZM_TestVController";

@interface ZM_TestBaseVC ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property (nonatomic, retain) NSArray* titleArray;
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@end

@implementation ZM_TestBaseVC


// 非storyBoard(xib或非xib)都走这个方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"---initWithNibName= %s", __FUNCTION__);
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}
// 如果连接了串联图storyBoard 走这个方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"---initWithCoder= %s", __FUNCTION__);
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
// xib 加载 完成
- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"---awakeFromNib=%s", __FUNCTION__);
}
- (void)loadView {
    [super loadView];
    NSLog(@"---loadView= %s \n ", __FUNCTION__);
    
}
//+ (void)load {
//    NSLog(@"---load= %s \n ", __FUNCTION__);
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];    
    //    self.controllers = nil;
    //    self.titleArray = nil;
    //    if (_ttableView!= nil) {
    //        [_ttableView reloadData];
    //    }
}
- (void)configUI {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; 
    self.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBarHidden = YES;
    [self zm_setNavTitle:@"创世吧主" backBtnHidden:NO originalBack:YES];
    [self.zmNavBarView rightItemTitle:@"" font:0 imgName:@"zm_share_707070"];
    [self.zmNavBarView setBackgroundColor:UIColorRGB(233,233,233)];
    //    self.zmNavBarView.zmBackBlock = ^{
    //        NSLog(@"---zmBackBlock 特殊返回情况下使用");
    //    };
    //    self.zmNavBarView.rightItemBlock = ^{
    //        NSLog(@"---rightItemBlock ");
    //    };
    
    //标题
    self.title = @"OtherVC";
    self.view.backgroundColor = BgColor;
    // self.navigationItem.titleView = self.coinTitleView;
    //设置状态栏颜色
    // [self setStatusBarBackgroundColor:[UIColor yellowColor]];
    // [self setStatusBarBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.3f]];
    // [self setStatusBarBackgroundColor:[UIColor purpleColor]];
//    NSLog(@"---getCurrentVC_BB = %@ \n ",[self getCurrentVC]);
    
    NSString *classString = NSStringFromClass([self class]);
    UIViewController *stringClass = (UIViewController *)NSClassFromString(classString);
    NSLog(@"---NSStringFromClass= %@",classString);
    NSLog(@"---NSClassFromString= %@",stringClass);
    NSLog(@"---[stringClass class]= %@",[stringClass class]);
    NSLog(@"---[UIViewController class]= %@",[UIViewController class]);
    NSLog(@"---[stringClass superclass]= %@",[stringClass superclass]);
    if ([[[stringClass superclass] superclass] isEqual:[UIViewController class]]) {
        NSLog(@"isEqualSuperclass \n ");
    }
}


#pragma mark- ======================"  private  "==============================

- (void)shareBtnClick {
    
}

- (void)test {
    /*
     UIBarButtonSystemItemEdit      //编辑
     UIBarButtonSystemItemCompose   //文本书写
     UIBarButtonSystemItemReply     //分享
     UIBarButtonSystemItemAction    //上传
     UIBarButtonSystemItemOrganize  //文件
     UIBarButtonSystemItemBookmarks //书籍
     UIBarButtonSystemItemSearch    //搜索
     UIBarButtonSystemItemRefresh   //刷新
     */
    [self addBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(BarItemClick) tintColor:[UIColor cyanColor] isRightItem:NO];
    [self addBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(BarItemClick) tintColor:[UIColor magentaColor] isRightItem:YES];
    
    [self addBarButtonItemTitle:@"完成" itemStyle:UIBarButtonItemStylePlain target:self action:@selector(BarItemClick) font:[UIFont systemFontOfSize:14]tintColor:Gray_333333 isRightItem:YES];
    
    [self addBarButtonItemImgName:@"home3" action:@selector(BarItemClick) tintColor:[UIColor orangeColor] isRightItem:YES];
    [self addBarButtonItemImgName:@"search" action:@selector(BarItemClick) tintColor:Gray_999999
                      isRightItem:YES];
    
    UIBarButtonItem *pulishButton = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(BarItemClick)];  
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(BarItemClick)];  
    
    UIBarButtonItem *Btn1  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share3"] style:UIBarButtonItemStylePlain target:self action:@selector(BarItemClick)];
    
    UIBarButtonItem *Btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarItemClick)];    
    
    [Btn1 setTintColor:Gray_666666];  
    [Btn2 setTintColor:Gray_666666];  
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pulishButton,saveButton,Btn1,Btn2,nil]];
    
}
//可在子VC中重写
- (void)BarItemClick {
}

#pragma mark- 设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)configViewWillAppear {
    
    //--->同时别忘了在info plist里面将View controller-based status bar appearance设置成NO，（默认是YES）
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];//白字
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO]; //黑字
    
    // self.navigationController.navigationBar.barTintColor    = Gray_FAFAFA; 
    // self.navigationController.navigationBar.backgroundColor = Gray_FAFAFA;
    // [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    // [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:Gray_CCCCCC]];
    
    //系统返回按钮：隐藏文字、自定义文字、返回按钮的颜色
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];  
    self.navigationController.navigationBar.topItem.title = @"";
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //将title 文字的颜色改为透明
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:0.01],
                                 NSForegroundColorAttributeName:[UIColor clearColor]};
    [item setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    //    //无效
    //    UIImage *image = [UIImage imageNamed:@"arrow_left_g1"]; //navigationbar_back
    //    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    [self.navigationItem.backBarButtonItem setImage:image];
    //    [self.navigationItem.backBarButtonItem setLandscapeImagePhone:image];
    
    //方式一：对当前根视图 的VC生效 
    //系统返回按钮：隐藏文字、自定义文字、返回按钮的颜色
    UIImage *image = [UIImage imageNamed:@"arrow_left_g1"]; //navigationbar_back
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.navigationController.navigationBar setTintColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBackIndicatorImage:image];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:image];
    
    //    //方式二：对所有根视图 的VC生效
    //    UIImage *image = [UIImage imageNamed:@"arrow_left_g1"]; 
    //    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
    //    [[UINavigationBar appearance] setBackIndicatorImage:image];
    //    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:image];
    
    //    //方式三：对所有根视图 的VC生效（同方式二）
    //    UIImage *image = [UIImage imageNamed:@"arrow_left_g1"]; //navigationbar_back
    //    UINavigationBar * navigationBar = [UINavigationBar appearance];
    //    //返回按钮的箭头颜色
    //    [navigationBar setTintColor:[UIColor whiteColor]];
    //    //设置返回样式图片
    //    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    [navigationBar setBackIndicatorImage:image];
    //    [navigationBar setBackIndicatorTransitionMaskImage:image];    
    
}

#pragma mark - /************************  以下测试 为使用案例  **************************/
- (void)testNavSetter {
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
    }else {
        
    }
    self.view.backgroundColor = [UIColor purpleColor];
    /*  “ 注意 ！！”
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
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    // 添加 通知：恢复_滑动返回功能
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"recoverSlideBack" object:nil];
    // 接收 通知：恢复_滑动返回功能
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recoverSlideBack) name:@"recoverSlideBack" object:nil];
    /**
     *  UITableView、UIWebView、UIScrollView：因为 SSHEIGHT 的高度是全屏的高度
     */
    UIWebView *wwebView = nil;
    //方式一：navigationBar下（0，0）开始, 自适应
    self.navigationController.navigationBar.translucent = YES;// navigationBar的毛玻璃效果
    self.automaticallyAdjustsScrollViewInsets = NO;
    wwebView = [[UIWebView alloc] initWithFrame:CGRectMake(5,70, SSWIDTH-10, SSHEIGHT-80)];
    
    //方式二：navigationBar下（0，0）开始,自适应
    self.navigationController.navigationBar.translucent = NO;// navigationBar的毛玻璃效果
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
     *  -------------------"  状态栏  "-------------------
     * 修改背景颜色  iOS 状态栏设置为白色
     * 1、首先需要再info.plist中添加一项View controller-based status bar appearance为no
     * 2、在需要的地方添加代码 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
     */
    // 黑底白字
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    // 白底黑字
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];    
    /**
     *  -------------------"  导航栏  "-------------------
     * 修改背景颜色 
     * 改变UINavigationBar的颜色
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
    //显示真实的图片高度
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"pink.png"]]; 
    
    // 设置状态栏 背景颜色 方式二：//navigationBar的毛玻璃效果 (设置背景色使用，设为YES颜色会变淡)
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
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
    [self.navigationController.navigationBar setTitleTextAttributes:titleChange];
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
    // UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"通讯录" style:UIBarButtonItemStylePlain target:self action:@selector(contactMenu)];
    //    self.navigationItem.rightBarButtonItem = rightButton;
    //方式一
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //方式二
    NSDictionary *titleAttributesDic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor whiteColor],NSForegroundColorAttributeName,
                                         [UIFont boldSystemFontOfSize:16],NSFontAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:titleAttributesDic2 forState:UIControlStateNormal];
    
    //方式三
    // rightButton.tintColor=[UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
}

- (void)UITabBar_NavTabBar {
    //UITabBar 高度由49pt变成了83pt
    //NavTabBar 高度由20pt变成了44pt
    CGFloat statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    NSLog(@"---statusBarHeight= %f",statusBarHeight);
    // <8x ---statusBarHeight= 20.000000
    // =8x ---statusBarHeight= 44.000000
    //在其他型号的iPhone上StatusBar是20,在iPhone X上StatusBar的高度是44， 状态栏
    //当你设置了这个属性的时候：Navigation bar height是140,否则 Navigation bar height是88
    
    //SafeArea
    //在iOS 11中Apple干掉了ViewController中的automaticallyAdjustsScrollViewInsets这个属性，当tableview的frame超出了安全区域后系统会自动的调整SafeAreaInsets的值，而iOS 11中真正影响tableview内容与边缘的变成了adjustedContentInset而不是以前的contentInset。由于系统对adjustedContentInset进行了调整导致了tableView的内容到边缘的距离发生了变化，下移距离分别是20pt（没有navigationBar，下移了一个statusBar的高度），64pt（navigationBar的高度以及statusBar的高度）。
    //SafeAreaInsets    
    if (@available(iOS 11.0, *)) {
        //self.navigationController.navigationBar.prefersLargeTitles = true;
    } else {
        // Fallback on earlier versions
    }
    if (ZM_IsiPhoneX) {
        NSLog(@"---iPhone8X");
        //[self addStatusBarViewImgName:@"" frame:StatusBarViewFrameA];
        //_ttableView.frame = CGRectMake(0, ZM_IPhoneXStatusBarHeight, SSWIDTH, SSHEIGHT-49-ZM_IPhoneXStatusBarHeight-34);
        _ttableView.frame = CGRectMake(0, 0, SSWIDTH, SSHEIGHT-49-0-34);
    }
    if (ZM_IsiPhoneX) {
        NSLog(@"---IS_IPHONE8X \n ");
    }
    NSLog(@"---IPhoneX_MainHeight    = %f",IPhoneXMainHeight);
    NSLog(@"---IPhoneX_SafeAreaHeight= %f",IPhoneXSafeAreaHeight);
    CGRect rect1 = [self.navigationController.navigationBar frame];
    CGRect rect2 = [self.tabBarController.tabBar frame];
    // navigationBar
    NSLog(@"---navBar: rect1.origin.x    = %f",rect1.origin.x);
    NSLog(@"---navBar: rect1.origin.y    = %f",rect1.origin.y);
    NSLog(@"---navBar: rect1.size.width  = %f",rect1.size.width);
    NSLog(@"---navBar: rect1.size.height = %f \n ",rect1.size.height);
    // tabBar
    NSLog(@"---tabBar: rect2.origin.x    = %f",rect2.origin.x);
    NSLog(@"---tabBar: rect2.origin.y    = %f",rect2.origin.y);
    NSLog(@"---tabBar: rect2.size.width  = %f",rect2.size.width);
    NSLog(@"---tabBar: rect2.size.height = %f \n ",rect2.size.height);  
}


@end
