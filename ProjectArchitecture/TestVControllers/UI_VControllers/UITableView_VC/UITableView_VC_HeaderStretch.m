//
//  UITableView_VC_HeaderStretch.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UITableView_VC_HeaderStretch.h"

#define KScreen_Width   [UIScreen mainScreen].bounds.size.width
#define KScreen_Height  [UIScreen mainScreen].bounds.size.height
static CGFloat const imageBGHeight = 150;       // 背景图片的高度
static NSString *const identifier = @"cellId";    // cell重用标识符

@interface UITableView_VC_HeaderStretch ()<UITableViewDataSource, UITableViewDelegate>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageBG;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation UITableView_VC_HeaderStretch

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidDisappear:(BOOL)animated {
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarTintColor:NavBg_COLOR];

    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor clearColor] colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];

}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);
    [self setupNav];
    
    [self setupTableView];
}

- (void)setupNav {
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.navigationItem.titleView = self.titleLabel;
}

-(void)setupTableView {
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView addSubview:self.imageBG];
}

#pragma mark - tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据--%zd", indexPath.row];
    return cell;
}

#pragma mark -  重点的地方在这里 滚动时候进行计算
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetH = imageBGHeight + offsetY;
    if (offsetH < 0) {
        CGRect frame = self.imageBG.frame;
        frame.size.height = imageBGHeight - offsetH;
        frame.origin.y = -imageBGHeight + offsetH;
        self.imageBG.frame = frame;

    }
    CGFloat alpha = offsetH / imageBGHeight;
    
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor cyanColor] colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    self.titleLabel.alpha = alpha;
    self.backBtn.alpha = alpha;
    
    self.navigationController.navigationBar.alpha = alpha;
}

/** 返回一张纯色图片 */
- (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);

    UIGraphicsBeginImageContext(rect.size);                     // 开启位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();       // 获取位图上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);   // 使用color演示填充上下文
    // 渲染上下文
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext(); // 从上下文中获取图片
    UIGraphicsEndImageContext();                                // 结束上下文
    
    return img;
}


#pragma mark - privateLazy
- (UIImageView *)imageBG {
    if (_imageBG == nil) {
        _imageBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
        _imageBG.frame = CGRectMake(0, -imageBGHeight, KScreen_Width, imageBGHeight);
        _imageBG.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageBG;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = [UIScreen mainScreen].bounds;
        _tableView.contentInset = UIEdgeInsetsMake(imageBGHeight, 0, 0, 0);
    }
    return _tableView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.text=@"title";
        _titleLabel.textColor = [UIColor whiteColor];
        [_titleLabel sizeToFit];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.alpha = 0;
    }
    return _titleLabel;
}

@end

