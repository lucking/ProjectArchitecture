//
//  UIViewController+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIViewController+ZMAdd.h"
#import "objc/runtime.h"
#import "UIWindow+ZMAdd.h"
#import "TestColorHeader.h"

@implementation UIViewController (ZMAdd)
//@dynamic backBtn;
//@dynamic normalBack;
//@synthesize backBtn= _backBtn;
//@synthesize itemBtn = _itemBtn;
@dynamic name;
@dynamic age;

#pragma mark 基础使用方式

- (void)BaseUse {
    
    //测试
    self.name = @"我的名字";
    NSLog(@"--> name= %@", self.name);
    
    self.age = 18;
    NSLog(@"--> age= %ld", (long)self.age);
    
    self.zmLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    self.zmLab.backgroundColor = CyanColor;
    [self.view addSubview:self.zmLab];
    self.zmLab.text = self.name;
    self.zmLab.textAlignment = NSTextAlignmentCenter;
    
    //错误使用
    if (UUserDefaults.isLogin) {
        self.itemBtn.frame = CGRectMake(0, 0, 0, 0);
        self.itemBtn.backgroundColor = [UIColor yellowColor];
        [self.itemBtn setTitle:@"已登录" forState:UIControlStateNormal];
        [self.itemBtn removeFromSuperview];
        self.itemBtn= nil; //即使是删除置空 方法还是会响应
        self.navigationItem.rightBarButtonItem = nil; //这样才行
    }else{
        //如果已经 置空了，只能创新创建
        [self addNavItemRect:CGRectMake(0,0,40, 20) title:@"登录" imgName:nil tag:222 isRightItem:YES];
    }
    
    //以下是正确使用方式
    [self addNavItemRect:CGRectMake(0,0,40, 20) title:@"登录" imgName:nil tag:222 isRightItem:YES];
    if (UUserDefaults.isLogin) {
        self.itemBtn.hidden = YES;
    }else{
        self.itemBtn.hidden = NO;
    }
    
    // 方式一：返回按钮：正常返回
    [self backBtnNoNavBar:NO normalBack:YES];
    // 方式二：返回按钮：其他情况返回
    [self backBtnNoNavBar:NO normalBack:NO];
    self.popBlock = ^(id object) {
        NSLog(@"--> popBackBlock");
    };
    
    //暂无数据，点击刷新
    [self addNoDataBtnToSuperview:self.view];
    self.noDataRefreshBlock = ^{
        //NSLog(@"---> noDataRefreshBlock");
        // 马上进入刷新状态
    };

    
    //隐藏导航栏最下面的一条线
    UIImageView *navBottonLineImage = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBottonLineImage.hidden = YES;

    
}

#pragma mark ============================"  添加属性  "==============================
#pragma mark 基础解释说明

- (void)explain {
    
    /* objc_AssociationPolicy
     * OBJC_ENUM
     OBJC_ASSOCIATION_ASSIGN = 0,           //assign策略  //<指定一个弱引用相关联的对象。
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1  //retain策略  //<指定相关对象的强引用。*协会不是自动。
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   //copy策略    //<指定相关的对象被复制。*协会不是自动。
     OBJC_ASSOCIATION_RETAIN = 01401,       //<指定相关对象的强引用。*协会是由自动。
     OBJC_ASSOCIATION_COPY = 01403          //<指定相关的对象被复制。*协会是由自动。
     */
    /*
     // setter 创建者
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     
     // getter 获取者
     objc_getAssociatedObject(id object, const void *key)
     
     //参数说明
     id     object      给哪个对象的属性赋值
     const  void *key   属性对应的key
     id     value       设置属性值为value
     objc_AssociationPolicy policy：使用的策略，是一个枚举值，和copy，retain，assign是一样的，
     手机开发一般都选择 NONATOMIC
     */
    
}

//定义常量 必须是C语言字符串

// NSString -> name
static char *PersonNameKey = "PersonNameKey";
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, PersonNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)name{
    return objc_getAssociatedObject(self, PersonNameKey);
}

// NSInteger -> age
static char *AgeKey = "AgeKey";
- (void)setAge:(NSInteger)age {
    objc_setAssociatedObject(self, &AgeKey, @(age), OBJC_ASSOCIATION_ASSIGN);
}
-(NSInteger)age{
    return [objc_getAssociatedObject(self, &AgeKey) intValue];
}

// UIColor -> bgColor
static char *BgColorKey = "BgColorKey";
- (UIColor *)bgColor {
    return objc_getAssociatedObject(self, @selector(property));
}
- (void)setBgColor:(UIColor *)bgColor {
    objc_setAssociatedObject(self, &BgColorKey, bgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// NSObject -> property
- (NSObject *)property {
    return objc_getAssociatedObject(self, @selector(property));
}
- (void)setProperty:(NSObject *)property {
    objc_setAssociatedObject(self,
                             @selector(property), property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



// UILabel -> zmLab
static char *ZMLabKey = "ZMLabKey";

- (void)setZmLab:(UILabel *)zmLab {
    objc_setAssociatedObject(self, ZMLabKey, zmLab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UILabel *)zmLab {
    return objc_getAssociatedObject(self, ZMLabKey);
}

// UIButton -> navItemBtn
static char *NavItemKey = "NavItemKey";
- (void)setItemBtn:(UIButton *)itemBtn {
    objc_setAssociatedObject(self, NavItemKey, itemBtn, OBJC_ASSOCIATION_ASSIGN);
}
- (UIButton *)itemBtn {
    return objc_getAssociatedObject(self, NavItemKey);
}

// UIButton -> backBtn
static char *BackBtnKey = "backBtnKey";
- (void)setBackBtn:(UIButton *)backBtn {
    objc_setAssociatedObject(self, BackBtnKey, backBtn, OBJC_ASSOCIATION_ASSIGN);
}
- (UIButton *)backBtn {
    NSLog(@"--> backBtn");
    return objc_getAssociatedObject(self, BackBtnKey);
}

// UIButton -> noDataBtn
static char *noDataBtnKey = "noDataBtnKey";
- (void)setNoDataButton:(UIButton *)noDataButton {
    objc_setAssociatedObject(self, noDataBtnKey, noDataButton, OBJC_ASSOCIATION_ASSIGN);
}
- (UIButton *)noDataButton {
    NSLog(@"--> noDataButton");
    return objc_getAssociatedObject(self, noDataBtnKey);
}


// BackBlock -> popBlock
- (BackBlock)popBlock {
    return objc_getAssociatedObject(self, @selector(popBlock));
}
- (void)setPopBlock:(BackBlock)popBlock {
    objc_setAssociatedObject(self,
                             @selector(popBlock),
                             popBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// NoDataBtnBlock -> noDataRefreshBlock
- (NoDataBtnBlock)noDataRefreshBlock {
    return objc_getAssociatedObject(self, @selector(noDataRefreshBlock));
}
- (void)setNoDataRefreshBlock:(NoDataBtnBlock)noDataRefreshBlock {
    objc_setAssociatedObject(self,
                             @selector(noDataRefreshBlock),
                             noDataRefreshBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark - /************************ above add property   **************************/


#pragma mark ======================"  Private methods  "==============================

- (void)addNoDataBtnToSuperview:(UIView *)superview {
    
    NoDataButton *noDataBtn = [[NoDataButton alloc] initWithFrame:CGRectMake(0, 0, 160, 100)];
    noDataBtn.center = self.view.center;
    noDataBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [noDataBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [noDataBtn setTitle:@"暂无数据，点击刷新" forState:UIControlStateNormal];
    [noDataBtn setImage:IMG(@"noData2") forState:UIControlStateNormal];
    [noDataBtn addTarget:self action:@selector(noDataBtnClickToRequestData) forControlEvents:UIControlEventTouchUpInside];
    noDataBtn.backgroundColor = Yellow_COLOR;
    [superview addSubview:noDataBtn];
    //使用weak
    self.noDataButton = noDataBtn;
}

- (void)noDataBtnClickToRequestData {
    NSLog(@"--> 刷新");
    if (self.noDataRefreshBlock) {
        self.noDataRefreshBlock();
    }
}


- (void)addNavItemRect:(CGRect)rect
                 title:(NSString *)title
               imgName:(NSString *)imgName tag:(NSInteger)tag isRightItem:(BOOL)isRightItem
{
    UIButton *itemBtn= [[UIButton alloc] initWithFrame:rect];
    [itemBtn setTitle:title forState:UIControlStateNormal];
    [itemBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [itemBtn setTitleColor:Blue_2599FA forState:UIControlStateNormal];
    [itemBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [itemBtn addTarget:self action:@selector(navigationItemClick:) forControlEvents:UIControlEventTouchUpInside];
    itemBtn.tag = tag;
    itemBtn.backgroundColor = Clear_COLOR;
    //使用weak
    self.itemBtn = itemBtn;
    
    if (isRightItem) {
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:self.itemBtn];
        self.navigationItem.rightBarButtonItem= BarButtonItem;
    }else{
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:self.itemBtn];
        self.navigationItem.leftBarButtonItem= BarButtonItem;
    }
}

#pragma mark 自定义 navigationItem
- (void)addNavigationItemRect:(CGRect)rect title:(NSString *)title imgName:(NSString *)imgName tag:(NSInteger)tag isRightItem:(BOOL)isRightItem
{
    UIButton *itemBtn= [[UIButton alloc] initWithFrame:rect];
    [itemBtn setTitle:title forState:UIControlStateNormal];
    [itemBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [itemBtn setTitleColor:Blue_2599FA forState:UIControlStateNormal];
    [itemBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [itemBtn addTarget:self action:@selector(navigationItemClick:) forControlEvents:UIControlEventTouchUpInside];
    itemBtn.tag = tag;
    itemBtn.backgroundColor = Clear_COLOR;
    
    if (isRightItem) {
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
        self.navigationItem.rightBarButtonItem= BarButtonItem;
    }else{
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
        self.navigationItem.leftBarButtonItem= BarButtonItem;
    }
}
// 导航栏按钮：响应
- (void)navigationItemClick:(UIButton *)btn {
    NSLog(@"--> navItemClick = %ld",(long)btn.tag);
}

/*
 如何调整导航条上的leftBarButtonItem和rightBarButtonItem的位置
 http://yikuwang.blog.51cto.com/6186082/1696156
 
 重点：这里需要提到BarButtonSystemItem的样式－ UIBarButtonSystemItemFixedSpace
 
 官方解释: Blank space to add between other items. Only the width property is used when this value is set.
 翻译：添加其他项目之间空格。只有宽度属性时使用这个值设置。
 
 来说说negativeSpacer.width = 0 表示leftBarButtonItem的x离屏幕的左边还有15像素，
 同样表示rightBarButtonItem的CGRectGetMaxX()离屏幕的右边还有15像素，
 那么好像我们就可以通过negativeSpacer.width来调整leftBarButtonItem的位置。搞了老半天原来就是得靠这家伙。
 但有一点：negativeSpacer.width 的赋值
 赋值负数：对于leftBarButtonItem来说是左移多少像素，
 赋值正数：对于rightBarButtonItem来说是右移多少像素.
 imgName：backBlack1、magenta_Back、red_Back、gray_Back
 */
// 返回按钮：自定义图片
-(void)backBtnNoNavBar:(BOOL)noNavBar normalBack:(BOOL)normalBack
{   CGFloat ww=25, hh=28;
    //隐藏系统的
    self.navigationItem.hidesBackButton = YES;
    //返回按钮
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,ww, hh)];
    [backBtn setImage:[UIImage imageNamed:@"magenta_Back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backNav:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.tag = normalBack;
    backBtn.backgroundColor = Clear_COLOR;

    if (noNavBar) {
        backBtn.frame = CGRectMake(10,22+5,ww, hh);
        [self.view addSubview:backBtn];
        self.backBtn = backBtn;
    }else{
        UIBarButtonItem *leftBarBtn= [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem= leftBarBtn;
        
        UIBarButtonItem *fixedBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedBarBtn.width = -5;
        self.navigationItem.leftBarButtonItems = @[fixedBarBtn, leftBarBtn];
        self.backBtn = backBtn;
    }
}
-(void)backNav:(UIButton *)Btn {
    //正常返回
    if (Btn.tag==1) {
        [self.navigationController popViewControllerAnimated:YES];
    }{
        //其他情况返回
        //NSLog(@"--> VC_Categroy_popBackBlock");
        if (self.popBlock) {
            self.popBlock(Btn);
        }
    }
}

//找到导航栏最下面的一条线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

// 添加线：坐标、颜色、透明度
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha
{
    UIView* line1= [[UIView alloc]initWithFrame:rect];
    line1.backgroundColor= color;
    line1.alpha= alpha;
    [view addSubview:line1];
}
// 获取当前屏幕显示的_viewController
+ (UIViewController *)getCurrentVC {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *currentVC = [window visibleViewController];
    //NSLog(@"---> common_currentVC = %@ \n ",currentVC);
    return currentVC;
}

//停止菊花
- (void)hudHidden {
//    [MMBProgress hudHiddenImmediately];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
//    [MMBProgress hudShowMessage:message afterDelay:delay];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
//    [MMBProgress hudShowSucceed:message afterDelay:delay];
}


@end
