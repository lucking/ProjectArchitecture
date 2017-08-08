//
//  ZMTabBarController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/20.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMTabBarController.h"

#import "HomeViewController.h"
#import "TransferViewController.h"
#import "AccountViewController.h"
#import "MoreViewController.h"

#import "UIColor+ZMAdd.h"
#import "UIView+ZMFrame.h"

@interface ZMTabBarController ()< UITabBarControllerDelegate, UITabBarDelegate >

@end

@implementation ZMTabBarController
//@dynamic selectedIndex;
//@synthesize selectedIndex = _selectedIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    // 装载子视图控制器
    [self loadViewControllers];
    
    
    //添加突出按钮：（替换原位置Item，若不使用此句话，显示原item）
    [self addUpperButtonIndex:1];
    //通过注册 KVO 来观察选择器的改变，同时切换突出按钮 对属性赋值改的时候进行响应
    [self addObserver:self forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew context:nil];

}
#pragma mark ---" NSKeyValueObserving  观察者"---

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //change 要改变的属性 keyPath
    //改变的内容: [change objectForKey:@"new"]
//    NSLog(@"--->change: %@",change);
//    NSLog(@"--->_upperIndex: %ld",_upperIndex);
//    NSLog(@"--->new: %ld \n ",[[change objectForKey:@"new"] integerValue]);

    if ([keyPath isEqualToString:@"selectedIndex"])
    {
        if (_upperIndex == [[change objectForKey:@"new"] integerValue]) {
            self.zmTabBar.UpperBtn.selected = YES;
        }else{
            self.zmTabBar.UpperBtn.selected = NO;
        }
    }
}

#pragma mark- UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NNSLog(@"---> getCurrentVC_CC = %@",[[Common getCurrentVC] class]);
//    NSSLog(@"---> selectedIndex_11 = %ld",self.selectedIndex);
    //不可选
//    if (viewController == self.viewControllers[3]) {
//        return NO;
//    }
    return YES;
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
//    NSLog(@"--> _upperIndex = %ld ",self.upperIndex);
    NSLog(@"--> didSelect = %ld \n ",self.selectedIndex);
    if (self.selectedIndex==2) {
        [self tabBarController:tabBarController shouldSelectViewController:viewController];
    }
    // 换页和 突出按钮 button的状态关联上
    if (self.selectedIndex==_upperIndex) {
        self.zmTabBar.UpperBtn.selected=YES;
    }else{
        self.zmTabBar.UpperBtn.selected=NO;
    }
}

#pragma mark- UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"--> selectedIndex = %ld ",self.selectedIndex);

}

#pragma mark- 装载子视图控制器

- (void)loadViewControllers {

    //1.
    HomeViewController *aaVC =[[HomeViewController alloc] init];
    //2.
    TransferViewController *bbVC= [[TransferViewController alloc] init];
    //3.
    MoreViewController *ccVC = [[MoreViewController alloc] init];
    //4.
    AccountViewController *ddVC= [[AccountViewController alloc] init];
    
    ZMNavController* navRootVC_1 = [[ZMNavController alloc] initWithRootViewController:aaVC];
    ZMNavController* navRootVC_2 = [[ZMNavController alloc] initWithRootViewController:bbVC];
    ZMNavController* navRootVC_3 = [[ZMNavController alloc] initWithRootViewController:ccVC];
    ZMNavController* navRootVC_4 = [[ZMNavController alloc] initWithRootViewController:ddVC];

    self.viewControllers = @[navRootVC_1,
                             navRootVC_2,
                             navRootVC_3,
                             navRootVC_4];
    // tb_index_gray、tb_index_gray_select
    // tabbar_item_setting、tabbar_item_setting_select
    UITabBarItem *tabBarItem_1 =[self getTabBarItemOfNavController:navRootVC_1  myVC:aaVC title:@"首页"
                                                     normolImgName:@"home_bottom"
                                                     selectImgName:@"home_bottom_click"];
    UITabBarItem *tabBarItem_2 =[self getTabBarItemOfNavController: navRootVC_2 myVC: bbVC title:@"模拟"
                                                     normolImgName:@"money_bottom"
                                                     selectImgName:@"money_bottom_click"];
    
    UITabBarItem *tabBarItem_3 =[self getTabBarItemOfNavController: navRootVC_3 myVC: ccVC title:@"更多"
                                                     normolImgName:@"more_bottom"
                                                     selectImgName:@"more_bottom_click"];
    
    UITabBarItem *tabBarItem_4 = [self getTabBarItemOfNavController: navRootVC_4 myVC: ddVC title:@"我的账户"
                                                     normolImgName:@"mine_bottom"
                                                     selectImgName:@"mine_bottom_click"];
    
    // 调整tabbar
    [self setUpTabBar];
    
    self.zmTabBar.items = @[tabBarItem_1,
                            tabBarItem_2,
                            tabBarItem_3,
                            tabBarItem_4];
    //设置默认 显示项
    self.zmTabBar.selectedItem = tabBarItem_1;
    
    /**
     *  更换系统自带的tabbar：利用 KVC 把系统的 tabBar 类型改为自定义类型。
     *  注意：替换的位置必须在 设置 items 的后面
     */
    [self setValue:self.zmTabBar forKey:@"tabBar"];
}

#pragma mark- 自定义 UITabBar

- (void)setUpTabBar {
    // 设置背景颜色（有效）、设置代理
    self.zmTabBar = [[ZMTabBar alloc] init];
    self.zmTabBar.barTintColor = [UIColor colorHexString:@"5AB963"];
    self.zmTabBar.delegate = self;
}

- (UITabBarItem *)getTabBarItemOfNavController:(UINavigationController *)navVC
                                          myVC:(UIViewController *)myVC
                                         title:(NSString *)title
                                 normolImgName:(NSString *)normolImgName
                                 selectImgName:(NSString *)selectImgName    {
    myVC.title = title;
    myVC.tabBarItem.title= title;

    UIImage *normolImg = [UIImage imageNamed:normolImgName];
    UIImage *selectImg = [UIImage imageNamed:selectImgName];

    navVC.tabBarItem.image         = [normolImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [navVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                               NSForegroundColorAttributeName:White_COLOR} forState:UIControlStateNormal];
    [navVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                               NSForegroundColorAttributeName:Color_select} forState:UIControlStateSelected];
    //设置导航 标题 颜色
    [navVC.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 [UIColor whiteColor],NSForegroundColorAttributeName,
                                                 [UIFont boldSystemFontOfSize:18],NSFontAttributeName, nil]];
    
    return navVC.tabBarItem;
}



#pragma mark- 添加突出按钮 替换索引位置的Item
- (void)addUpperButtonIndex:(NSInteger)upperIndex
{
    self.upperIndex = upperIndex;
    //PlusBtnNormal、root_tab_add_btn
    //PlusBtnNormal、PlusBtn_click
    //upper0、upper1
    [self addUpperButtonWithImage:[UIImage imageNamed:@"PlusNormal"]
                    selectedImage:[UIImage imageNamed:@"Plusclick"]
                       upperIndex:_upperIndex];
    
    //（覆盖原位置Item）应该把 UITabBarItem 的图片置空 @"" ,避免UpperBtn图片没有完全覆盖 UITabBarItem图
    self.zmTabBar.items[_upperIndex].image = IMG(@"");
    self.zmTabBar.items[_upperIndex].selectedImage = IMG(@"");
    // 设置代理：UITabBarControllerDelegate 为了换页和 突出按钮Btn的状态关联上
    self.delegate = self;
    
}
#pragma mark - addCenterButton // 创建一个自定义UIButton并将它添加到我们的标签栏中

-(void)addUpperButtonWithImage:(UIImage*)norImage
                 selectedImage:(UIImage*)selectedImage
                    upperIndex:(NSInteger)upperIndex
{
    self.zmTabBar.UpperBtn = [ZMUpperButton buttonWithType:UIButtonTypeCustom];
    self.zmTabBar.UpperBtn.adjustsImageWhenHighlighted = NO;
    [self.zmTabBar.UpperBtn setImage:norImage forState:UIControlStateNormal];
    [self.zmTabBar.UpperBtn setImage:selectedImage forState:UIControlStateSelected];
    [self.zmTabBar.UpperBtn addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    /*
     *  核心代码：设置button的center，同时做出相对的上浮
     */
    CGFloat itemWidth = self.zmTabBar.width/self.zmTabBar.items.count;
    self.zmTabBar.UpperBtn.frame = CGRectMake(0, 0, itemWidth, self.zmTabBar.height+20);
    self.zmTabBar.UpperBtn.center = CGPointMake(itemWidth * (upperIndex+ 0.5), self.zmTabBar.height/2-10);
    self.zmTabBar.UpperBtn.backgroundColor = Clear_COLOR;
    [self.zmTabBar addSubview:self.zmTabBar.UpperBtn];

}
#pragma mark - UpperBtn 的点击响应
-(void)pressChange:(id)sender
{
    NSLog(@"--> self.zmTabBar= %d",self.zmTabBar.hidden);
    //选择器显示 突出控制器
    self.selectedIndex = _upperIndex;
    //突显图片
    self.zmTabBar.UpperBtn.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end