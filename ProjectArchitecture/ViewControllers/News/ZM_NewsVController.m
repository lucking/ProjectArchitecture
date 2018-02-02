//
//  ZM_NewsVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/2/2.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_NewsVController.h"
#import "ZMTitleLable.h"

#import "ZM_ProductVCAA.h"
#import "ZM_ProductVCBB.h"
#import "ZM_ProductVCCC.h"
#import "ZM_NewsTableVC.h"

#pragma mark  -----------------------"    "---------------------------------

//#define TopHeight 60
#define TopHeight 0
#define smallWidth  SSWIDTH
// 头部标题栏高度
#define  TitleHeight    40
// 主屏高度
#define  VCHeight    (SSHEIGHT - TopHeight - TitleHeight)


@interface ZM_NewsVController ()< UIScrollViewDelegate >
{
}
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIScrollView *smallScrollView;
@property (strong, nonatomic) UIScrollView *bigScrollView;
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation ZM_NewsVController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO; //显示tabBar
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //NNSLog(@"---> getCurrentVC_BB = %@ \n ",[Common getCurrentVC]);
    [self initUI];
    [HHudProgress hudHidden];
}

- (void)initUI
{
    //    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SSWIDTH, TopHeight)];
    //    _topView.backgroundColor = BgColor;
    //    
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 250, TopHeight)];
    //    label.backgroundColor = [UIColor whiteColor];
    //    label.font = [UIFont systemFontOfSize:18];
    //    label.text = @"topView";
    //    label.textColor = [UIColor redColor];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    [_topView addSubview:label];
    
    
    
    [self.view addSubview:_topView];
    //标题栏
    self.smallScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+TopHeight, smallWidth, TitleHeight)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;
    self.smallScrollView.backgroundColor = Color_With_Hex(0xC6E2FF);
    //self.smallScrollView.delegate = self;// 不可用
    [self.view addSubview:self.smallScrollView];
    
    //内容栏
    self.bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+TopHeight+TitleHeight, SSWIDTH, VCHeight)];
    self.bigScrollView.backgroundColor = [UIColor clearColor];
    self.bigScrollView.delegate = self;
    [self.view addSubview:self.bigScrollView];
    
    //添加子控制器: self.childViewControllers
    [self addController];
    //添加标题栏
    [self addTitleLabel];
    
    CGFloat contentX = self.titleArray.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScrollView.contentSize = CGSizeMake(contentX, 0);
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    
    // 添加默认控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:vc.view];
    
    //标题label
    ZMTitleLable *lable = [self.smallScrollView.subviews firstObject];
    lable.scale = 1.0;
    lable.horizontallLine.hidden = NO;
    
}
/** 添加子控制器 */
- (void)addController
{
    // NSLog(@"self.titleArray.count = %@ ",@(self.titleArray.count));
    // VC
    ZM_ProductVCAA* vc1= [[ZM_ProductVCAA alloc]init];
    [self addChildViewController:vc1];
    
    ZM_ProductVCBB *vc2 = [[ZM_ProductVCBB alloc]init];
    [self addChildViewController:vc2];
    
    ZM_ProductVCCC *vc3 = [[ZM_ProductVCCC alloc]init];
    [self addChildViewController:vc3];
    
    ZM_NewsTableVC *vc4 = [[ZM_NewsTableVC alloc]init];
    [self addChildViewController:vc4];
    
}
/** 添加标题栏 */
- (void)addTitleLabel
{
    for (int i = 0; i < self.titleArray.count; i++) {
        
        CGFloat labW = smallWidth/(self.titleArray.count);
        CGFloat labH = 40;
        CGFloat labY = 0;
        CGFloat labX = i * labW;
        ZMTitleLable *ttlab = [[ZMTitleLable alloc] initWithFrame:CGRectMake(labX, labY, labW, labH)];
        
        ttlab.text = self.titleArray[i];//从视图控制器 获取标题
        [self.smallScrollView addSubview:ttlab];
        ttlab.tag = i;
        ttlab.userInteractionEnabled = YES;
        [ttlab addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick:)]];
    }
}
#pragma mark  标题栏label的点击事件（通过此点击事件来控制：bigScrollView的偏移量）
- (void)labClick:(UITapGestureRecognizer *)recognizer
{
    ZMTitleLable *titlelable = (ZMTitleLable *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * self.bigScrollView.frame.size.width;
    CGFloat offsetY = self.bigScrollView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.bigScrollView setContentOffset:offset animated:YES];
}
#pragma mark -------"  scrollView代理方法：滚动结束后调用（代码导致） "------
#pragma
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    NSLog(@"获得索引_index: %@",@(index));
    
    // 滚动标题栏
    ZMTitleLable *titleLable = (ZMTitleLable *)self.smallScrollView.subviews[index];
    titleLable.horizontallLine.hidden = NO;//显示最新的横线
    titleLable.scale = 1.0;//颜色还原为
    CGFloat offsetx = titleLable.center.x - self.smallScrollView.frame.size.width * 0.5;
    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    
    // 遍历所有子视图（subviews）
    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if (idx != index) { //如果找到的不是当前点击的标题
            ZMTitleLable *temlabel = self.smallScrollView.subviews[idx];
            temlabel.scale = 0.2;//颜色还原为黑色
            temlabel.horizontallLine.hidden = YES;  //隐藏横线
        }
    }];
    // 添加控制器：索引（childViewControllers）
    if (self.childViewControllers[index].view.superview) return;
    
    self.childViewControllers[index].view.frame = scrollView.bounds;
    [self.bigScrollView addSubview:self.childViewControllers[index].view];
    
    
}
#pragma 滚动结束（手势导致）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - /************************  懒加载  **************************/
- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"公司介绍",@"产品理念",@"联系方式",@"合作伙伴"];
    }return _titleArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
