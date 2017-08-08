//
//  UIScrollView_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIScrollView_VController.h"

#import "ProductVCAA.h"
#import "ProductVCBB.h"
#import "ProductVCCC.h"
#import "NewsTableVC.h"
#import "ItemScrollView.h"
#import "UIView+ZMFrame.h"

#pragma mark  -----------------------"    "---------------------------------

//#define TopHeight 60
#define TopHeight 0
#define smallWidth  SSWIDTH
// 头部标题栏高度
#define  TitleHeight	40
// 主屏高度
#define  VCHeight	(SSHEIGHT - TopHeight - TitleHeight)

#define PPScreenX(w) (SSWIDTH - (w))/2
#define PPagesCount 4

@interface UIScrollView_VController ()<UIScrollViewDelegate>
{
    
}
@property (nonatomic, weak) UIPageControl *pageControl;

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIScrollView *smallScrollView;
@property (strong, nonatomic) UIScrollView *bigScrollView;
@property (strong, nonatomic) NSArray *titleArray;
@property (nonatomic, strong) ItemScrollView *itemScrollView;

@end

@implementation UIScrollView_VController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    _itemScrollView.hidden = NO;
}
- (void)viewDidDisappear:(BOOL)animated {
    
    _itemScrollView.hidden = YES;
}

#pragma mark - /************************  懒加载  **************************/
- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"公司介绍",@"产品理念",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);
    
//    [self addPadgeController];
    
    [self setScrollView];
}


- (void)setScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /** 添加标题栏 */
    _itemScrollView = [[ItemScrollView alloc] initWithFrame:CGRectMake(0, 0, SSWIDTH, 40)];
    _itemScrollView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:_itemScrollView];
    [self.navigationController.navigationBar addSubview:_itemScrollView];

    _itemScrollView.titleArray = self.titleArray;
    

    __weak typeof(self) weakSelf = self;
    _itemScrollView.itemClickBlock = ^(NSInteger itemTag) {
        
        NSLog(@"itemTag= %ld", itemTag);
        NSLog(@"self.childViewControllers.count= %ld", weakSelf.childViewControllers.count);

        //方式一：vc 无滚动效果
        if (itemTag < self.childViewControllers.count) {
            [weakSelf changeControllerOfIndex:itemTag];
        }
        
//        //方式二：vc 有滚动效果
//        CGFloat offsetX = itemTag * self.bigScrollView.frame.size.width;
//        CGFloat offsetY = weakSelf.bigScrollView.contentOffset.y;
//        CGPoint offset = CGPointMake(offsetX, offsetY);
//        NSLog(@"offsetX= %f", offsetX);//
//        [weakSelf.bigScrollView setContentOffset:offset animated:YES];
    };

    //添加子控制器: self.childViewControllers
    [self addController];
    
//    [self addVC];

    
}
- (void)changeControllerOfIndex:(NSInteger)index {
    
    NSLog(@"superview= %@", self.childViewControllers[index].view.superview);
    NSLog(@"view= %@ \n \n ", self.childViewControllers[index].view);
    
    //if (self.childViewControllers[index].view.superview) return;
    
    self.childViewControllers[index].view.frame = _bigScrollView.bounds;
    [self.bigScrollView addSubview:self.childViewControllers[index].view];
    
    
}
/** 方式一：添加子控制器 */
- (void)addController
{
    //内容栏
    self.bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+_itemScrollView.height, SSWIDTH, VCHeight)];
    self.bigScrollView.backgroundColor = [UIColor clearColor];
    self.bigScrollView.delegate = self;
    [self.view addSubview:self.bigScrollView];
    
    CGFloat contentX = self.titleArray.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScrollView.contentSize = CGSizeMake(contentX, 0);
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    
    
    ProductVCAA* vc1= [[ProductVCAA alloc]init];
    [self addChildViewController:vc1];
    
    ProductVCBB *vc2 = [[ProductVCBB alloc]init];
    [self addChildViewController:vc2];
    
    ProductVCCC *vc3 = [[ProductVCCC alloc]init];
    [self addChildViewController:vc3];
    
    NewsTableVC *vc4 = [[NewsTableVC alloc]init];
    [self addChildViewController:vc4];
    
    // 添加默认控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:vc.view];
}

//方式二：vc 有滚动效果
- (void)addVC {
    
    NSLog(@"self.titleArray.count = %@ ",@(self.titleArray.count));
    //内容栏
    self.bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+_itemScrollView.height, SSWIDTH, VCHeight)];
    self.bigScrollView.backgroundColor = [UIColor clearColor];
    self.bigScrollView.delegate = self;
    [self.view addSubview:self.bigScrollView];
    
    CGFloat contentX = self.titleArray.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScrollView.contentSize = CGSizeMake(contentX, 0);
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.showsHorizontalScrollIndicator = NO;

    
    ProductVCAA* vc1= [[ProductVCAA alloc]init];
    vc1.view.frame = self.bigScrollView.bounds;
    vc1.view.x = self.bigScrollView.width * 0;
    vc1.view.height = self.bigScrollView.height;
    [self addChildViewController:vc1];
    [self.bigScrollView addSubview:vc1.view];

    
    ProductVCBB *vc2 = [[ProductVCBB alloc]init];
    vc2.view.frame = self.bigScrollView.bounds;
    vc2.view.x = self.bigScrollView.width * 1;
    vc2.view.height = self.bigScrollView.height;
    [self addChildViewController:vc2];
    [self.bigScrollView addSubview:vc2.view];

    
    ProductVCCC *vc3 = [[ProductVCCC alloc]init];
    vc3.view.frame = self.bigScrollView.bounds;
    vc3.view.x = self.bigScrollView.width * 2;
    vc3.view.height = self.bigScrollView.height;
    [self addChildViewController:vc3];
    [self.bigScrollView addSubview:vc3.view];

    
    NewsTableVC *vc4 = [[NewsTableVC alloc]init];
    vc4.view.frame = self.bigScrollView.bounds;
    vc4.view.x = self.bigScrollView.width * 3;
    vc4.view.height = self.bigScrollView.height;
    [self addChildViewController:vc4];
    [self.bigScrollView addSubview:vc4.view];
    
    self.view = self.bigScrollView;

    // 添加默认控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:vc.view];
}


#pragma mark -------"  scrollView代理方法：滚动结束后调用（代码导致） "------
#pragma
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    NSLog(@"获得索引_index: %@",@(index));

    _itemScrollView.itemIndex = index;
    
    if (index < self.childViewControllers.count) {
        //方式一：
        [self changeControllerOfIndex:index];
    }
    
//    // 滚动标题栏
//    ZMTitleLable *titleLable = (ZMTitleLable *)self.smallScrollView.subviews[index];
//    titleLable.horizontallLine.hidden = NO;//显示最新的横线
//    titleLable.scale = 1.0;//颜色还原为
//    CGFloat offsetx = titleLable.center.x - self.smallScrollView.frame.size.width * 0.5;
//    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
//    if (offsetx < 0) {
//        offsetx = 0;
//    }else if (offsetx > offsetMax){
//        offsetx = offsetMax;
//    }
//    
//    // 遍历所有子视图（subviews）
//    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        
//        if (idx != index) { //如果找到的不是当前点击的标题
//            ZMTitleLable *temlabel = self.smallScrollView.subviews[idx];
//            temlabel.scale = 0.0;//颜色还原为黑色
//            temlabel.horizontallLine.hidden = YES;  //隐藏横线
//        }
//    }];
//    // 添加控制器：索引（childViewControllers）
//    UIViewController*  ViewControl = nil;
//    if (index == 0) {
//        ProductVCAA* vc1= self.childViewControllers[index];
//        ViewControl = vc1;
//        
//    }else if (index ==1){
//        ProductVCBB *vc2 = self.childViewControllers[index];
//        ViewControl = vc2;
//        
//    }else if (index ==2){
//        ProductVCCC *vc3 = self.childViewControllers[index];
//        ViewControl = vc3;
//        
//    }else if (index ==3){
//        NewsTableVC *vc4 = self.childViewControllers[index];
//        ViewControl = vc4;
//    }
//    
//    if (ViewControl.view.superview) return;
//    ViewControl.view.frame = scrollView.bounds;
//    [self.bigScrollView addSubview:ViewControl.view];
    
    
}
#pragma 滚动结束（手势导致）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addPadgeController
{
    //设置圆点的效果
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(PPScreenX(200), SSHEIGHT-100, 200,50)];
    //page.center = CGPointMake(self.view.frame.size.width/2, PPHEIGHT-20);
    page.backgroundColor = [UIColor yellowColor];
    page.numberOfPages = PPagesCount;                       //页数
    page.pageIndicatorTintColor = [UIColor whiteColor];     //当前显示页 圆点的颜色
    page.currentPageIndicatorTintColor = [UIColor redColor];//圆点默认颜色
    _pageControl = page;
    [self.view addSubview:page];
    
}

@end
