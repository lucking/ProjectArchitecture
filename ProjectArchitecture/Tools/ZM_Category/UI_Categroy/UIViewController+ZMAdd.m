//
//  UIViewController+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIViewController+ZMAdd.h"
#import "objc/runtime.h"
#import "AppDelegate.h"
#import "UIWindow+ZMAdd.h"
#import "TestColorHeader.h"

@implementation UIViewController (ZMAdd)

#pragma mark 基础使用方式

- (void)BaseUse {
    
    //测试
    self.name = @"我的名字";
    NSLog(@"--> name= %@", self.name);
    
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
    // 返回按钮：正常返回
    [self backBtnNoNavBar:NO normalBack:YES];
    // 返回按钮：其他情况返回
    [self backBtnNoNavBar:NO normalBack:NO];
    self.backBlock = ^(id object) {
        NSLog(@"--> backBlock");
    };
    
    //暂无数据，点击刷新
    [self addNoDataBtnToSuperview:self.view];
    self.noDataRefreshBlock = ^{
        //NSLog(@"---> noDataRefreshBlock 马上进入刷新状态");
    };
    
    //是否隐藏导航栏最下的一条线
    [self navBarlineImgViewHidden:YES];
    [self navBarlineImgViewHidden:NO];
    [self navBarlineImgViewChangeFrame];
    
}

// 测试 UIButton
- (void)addBtn {
    CGFloat  ww=130, hh= 36;
    // [self addBtnTitle:@"直播列表"   frame:CGRectMake(20, 220+(hh+20)*0, ww, hh) tag:101];
    [self addBtnTitle:@"提问"       frame:CGRectMake(20, 220+(hh+20)*0, ww, hh) tag:102];
    [self addBtnTitle:@"我的订阅"    frame:CGRectMake(20, 220+(hh+20)*1, ww, hh) tag:103];
    [self addBtnTitle:@"订阅我的"    frame:CGRectMake(20, 220+(hh+20)*2, ww, hh) tag:104];    
    [self addBtnTitle:@"webDemo"    frame:CGRectMake(20, 220+(hh+20)*3, ww, hh) tag:105];    
    [self addBtnTitle:@"ZM_webDemo" frame:CGRectMake(20, 220+(hh+20)*4, ww, hh) tag:106];    
    
    [self addBtnTitle:@"评论列表"   frame:CGRectMake(180, 220+(hh+20)*0, ww, hh) tag:201];
    [self addBtnTitle:@"评论详情"   frame:CGRectMake(180, 220+(hh+20)*1, ww, hh) tag:202];
    [self addBtnTitle:@"回答"      frame:CGRectMake(180, 220+(hh+20)*2, ww, hh) tag:203];    
    [self addBtnTitle:@"问答详情"   frame:CGRectMake(180, 220+(hh+20)*3, ww, hh) tag:204];
}

//测试使用
- (void )addBtnTitle:(NSString *)title frame:(CGRect)frame tag:(int)tag {
    
    UIButton* Btn=[[UIButton alloc] initWithFrame:frame];
    Btn.backgroundColor= [UIColor purpleColor];
    Btn.layer.cornerRadius = 3.f;
    Btn.clipsToBounds = YES;
    Btn.titleLabel.font = [UIFont systemFontOfSize:18]; 
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn setTintColor:[UIColor whiteColor]];
    [Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    Btn.tag = tag;
    [self.view addSubview:Btn];
}
// 测试使用 按钮
- (void)BtnClick:(UIButton *)Btn {
}

#pragma mark ============================"  添加属性  "==============================

//定义常量 必须是C语言字符串
static char *PersonNameKey = "PersonNameKey";
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, PersonNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)name{
    return objc_getAssociatedObject(self, PersonNameKey);
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

// UIButton -> noDataBtn 暂无数据，点击刷新
static char *noDataBtnKey = "noDataBtnKey";
- (void)setNoDataBtn:(UIButton *)noDataBtn {
    objc_setAssociatedObject(self, noDataBtnKey, noDataBtn, OBJC_ASSOCIATION_ASSIGN);
}
- (UIButton *)noDataBtn {
    return objc_getAssociatedObject(self, noDataBtnKey);
}

// UIView -> statusBarView IPhoneX，状态栏
static char *statusBarViewKey = "statusBarViewKey";
- (void)setStatusBarView:(UIImageView *)statusBarView {
    objc_setAssociatedObject(self, statusBarViewKey, statusBarView, OBJC_ASSOCIATION_ASSIGN);
}
- (UIImageView *)statusBarView {
    return objc_getAssociatedObject(self, statusBarViewKey);
}


// BackBlock -> backBlock
- (BackBlock)backBlock {
    return objc_getAssociatedObject(self, @selector(backBlock));
}
- (void)setBackBlock:(BackBlock)backBlock {
    objc_setAssociatedObject(self,
                             @selector(backBlock), backBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// NoDataBtnBlock -> noDataRefreshBlock
- (NoDataBtnBlock)noDataRefreshBlock {
    return objc_getAssociatedObject(self, @selector(noDataRefreshBlock));
}
- (void)setNoDataRefreshBlock:(NoDataBtnBlock)noDataRefreshBlock {
    objc_setAssociatedObject(self,
                             @selector(noDataRefreshBlock), noDataRefreshBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark - /************************ above add property   **************************/




#pragma mark ======================"  Private methods  "==============================

#pragma mark- 自定义：状态栏
- (void)addStatusBarViewImgName:(NSString *)imgName frame:(CGRect)frame {
    
    CGFloat topHeight = 30;
    UIImageView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SSWIDTH, topHeight)];
    statusBarView.backgroundColor = [UIColor blackColor];
    if (imgName.length!=0 && imgName!=nil) {
        statusBarView.image = [UIImage imageNamed:imgName];
    }
    [self.view addSubview:statusBarView];
    //使用weak
    self.statusBarView = statusBarView;
}


#pragma mark- 自定义：暂无数据，点击刷新
- (void)addNoDataBtnToSuperview:(UIView *)superview 
                          title:(NSString *)title
                        imgName:(NSString *)imgName frame:(CGRect)frame 
                    isAddWindow:(BOOL)isAddWindow {
    
    NoDataButton *noDataBtn = [[NoDataButton alloc] initWithFrame:frame];  
    noDataBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [noDataBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [noDataBtn setTitle:title forState:UIControlStateNormal];
    [noDataBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [noDataBtn setAdjustsImageWhenHighlighted:NO];  //默认是YES 高亮效果
    [noDataBtn addTarget:self action:@selector(noDataBtnClickToRequestData) forControlEvents:UIControlEventTouchUpInside];
    //noDataBtn.backgroundColor = Yellow_COLOR;
    noDataBtn.hidden = YES;
    if (isAddWindow) {
        noDataBtn.center = [AppDelegate shareInstance].window.center;
        [[AppDelegate shareInstance].window addSubview:noDataBtn];
    }else{
        //noDataBtn.center = self.view.center;
        //noDataBtn.center = superview.center;
        [superview addSubview:noDataBtn];
    }
    //使用weak
    self.noDataBtn = noDataBtn;
}

- (void)addNoDataBtnToSuperview:(UIView *)superview {
    
    NoDataButton *noDataBtn = [[NoDataButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    noDataBtn.center = self.view.center;
    noDataBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [noDataBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [noDataBtn setTitle:@"暂无数据，点击刷新" forState:UIControlStateNormal];
    [noDataBtn setImage:IMG(@"noData2") forState:UIControlStateNormal];
    [noDataBtn addTarget:self action:@selector(noDataBtnClickToRequestData) forControlEvents:UIControlEventTouchUpInside];
    //noDataBtn.backgroundColor = Yellow_COLOR;
    noDataBtn.hidden = YES;
    //使用weak
    self.noDataBtn = noDataBtn;
    [superview addSubview:noDataBtn];
}

- (void)noDataBtnClickToRequestData {
    //其他情况返回
    //NSLog(@"--> noDataRefreshBlock");
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

// 返回按钮：自定义图片
-(void)backBtnNoNavBar:(BOOL)noNavBar normalBack:(BOOL)normalBack
{
    CGFloat ww=25, hh=28;
    //隐藏系统的
    // self.navigationItem.hidesBackButton = YES;
    //返回按钮
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,ww, hh)];
    [backBtn setImage:[UIImage imageNamed:@"backBlack1"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backNav:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.tag = normalBack;
    backBtn.backgroundColor = Clear_COLOR;
    if (noNavBar) {
        backBtn.frame = CGRectMake(10,27,ww, hh);
        [self.view addSubview:backBtn];
        self.backBtn = backBtn;
    }else{
        UIBarButtonItem *leftBarBtn= [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem= leftBarBtn;
        self.backBtn = backBtn;
        if ([self systemVersionFloat] >= 11.0) {
            self.backBtn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
            [self.backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        }
    }
}
-(void)backNav:(UIButton *)Btn {
    //正常返回
    if (Btn.tag==1) {
        [self.navigationController popViewControllerAnimated:YES];
    }{
        //其他情况返回
        NSLog(@"--> backBlock");
        if (self.backBlock) {
            self.backBlock(Btn);
        }
    }
}

#pragma mark 导航栏最下的一条线
- (UIImageView *)navBarlineImgView {
    UIImageView *navBarlineImgView= [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    return navBarlineImgView;
}
#pragma mark 导航栏最下的一条线 改变坐标
- (void)navBarlineImgViewChangeFrame {
    UIImageView *navBarlineImgView= [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    [navBarlineImgView setFrame:CGRectMake(0, 64, SSWIDTH, 0.5)];
}
#pragma mark 是否隐藏导航栏最下的一条线
- (void)navBarlineImgViewHidden:(BOOL)hidden {
    UIImageView *navBarlineImgView= [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    NSLog(@"---navBarlineImgView= %@",navBarlineImgView);
    navBarlineImgView.hidden = hidden;
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
#pragma mark - 注意：这个是UIImage 导航栏最下的一条线
- (UIImage *)createImageWithColor:(UIColor*) color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 0.5f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


//获取当前屏幕显示的_viewController
+ (UIViewController *)getCurrentVC {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *currentVC = [window visibleViewController];
    NSLog(@"---> currentVC = %@ \n ",currentVC);
    return currentVC;
}
// 添加线：坐标、颜色、透明度
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha
{
    UIView* line1= [[UIView alloc]initWithFrame:rect];
    line1.backgroundColor= color;
    line1.alpha= alpha;
    [view addSubview:line1];
}
//停止菊花
- (void)hudHidden {
    [HHudProgress hudHidden];
}
// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
//    [HHudProgress hudShowMessage:message afterDelay:delay add];
    [HHudProgress hudShowMsg:message delay:delay addSubview:self.view];
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [HHudProgress hudShowMsg:message delay:delay addSubview:self.view];
}


- (CGFloat )systemVersionFloat {
    return [[UIDevice currentDevice].systemVersion floatValue];
}

@end

