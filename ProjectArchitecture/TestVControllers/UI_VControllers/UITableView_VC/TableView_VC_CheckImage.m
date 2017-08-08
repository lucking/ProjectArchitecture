//
//  TableView_VC_CheckImage.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 ZM. All rights reserved.
//


#import "TableView_VC_CheckImage.h"
#import "UIView+ZMFrame.h"
#import "CheckmarkCell.h"
//#import "SelectModel.h"
#import "SelectCheckModel.h"

static NSString *_cellId = @"cellID";

@interface TableView_VC_CheckImage ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _rowHeight;
    NSInteger _selectIndex;
    
}
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) UILabel* nickLab;
@property (nonatomic, strong) UITextField* nickText;

@property (nonatomic,strong) NSIndexPath *lastPath;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行

@property (strong, nonatomic) NSMutableArray *selectArray;//多选选，当前选中的行
@property (strong, nonatomic) UIButton *rightItemBtn;//
//@property (strong, nonatomic) SelectModel *currentModel;//
@property (strong, nonatomic) SelectCheckModel *currentModel;//
@property (nonatomic, strong) UIButton *backTopBtn;


@end

@implementation TableView_VC_CheckImage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    self.automaticallyAdjustsScrollViewInsets = YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSLogline(@"---> title= %@", self.title);
    self.title = @"cell_多选";

    [self addNavigationItemRect:CGRectMake(0,0,60, 20) title:@"全选" imgName:nil tag:222 isRightItem:YES];

    
    //默认选第一个
    [UserDefaults setBool:YES forKey:@"selectIndex_First"];
    
    _currentModel = [[SelectCheckModel alloc] init];

    _selectArray = [[NSMutableArray alloc] init];

    for (int i=0; i<25; i++) {
        SelectCheckModel *model = [[SelectCheckModel alloc] init];
        model.isSelect = NO;
        model.index = i;
        [_selectArray addObject:model];
    }
    //NSLogline(@"---> _selectArray= %@", _selectArray);

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _rowHeight = 50;
    CGFloat yy = 64-20;
    [self setTableView:CGRectMake(0, yy, SSWIDTH,SSHEIGHT) withstyle:UITableViewStyleGrouped];
    //默认选第一个
    _selectIndex = 0;
    //返回顶部
    [self.view addSubview:self.backTopBtn];

}

#pragma mark -------------布局---------
-(UITableView *)setTableView:(CGRect)fame withstyle:(UITableViewStyle )allstyle{
    if (!_ttableView) {
        _ttableView = [[UITableView alloc] initWithFrame:fame style:allstyle]; //有背景色
        _ttableView.dataSource = self;
        _ttableView.delegate = self;
        _ttableView.scrollEnabled = YES;
        [self clearTableViewLine:_ttableView isHeaderView:YES isFooterView:YES];
        [self.view addSubview:self.ttableView]; 
    }
    return _ttableView;
}
#pragma mark ------"  UITableViewDataSource、UITableViewDelegate  "------
//RowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _rowHeight;
}
//Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectArray.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckmarkCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
    if (cell == nil){
        cell = [[CheckmarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
//    [cell.selectBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectBtn.tag = indexPath.row;
    cell.selectBtn.userInteractionEnabled = NO;
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.row==0) {
        cell.textLabel.text = [NSString stringWithFormat:@"男_%ld",indexPath.row];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"女_%ld",indexPath.row];;
    }
    
    
    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
//    if (_selIndex == indexPath) {
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
//    }else {
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        
//        if (indexPath.row==0) {
//            if ([UserDefaults getBoolStorageWithKey:@"selectIndex_First"]) {
//                //这个是系统中对勾的那种选择框 默认选择第一个
//                [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
//            }
//        }
//    }
    
    //多选：（自定义）
    //方式一
//    if ([_selectArray[indexPath.row] isEqualToString:@"NO"]) {
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    }else{
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1.png"] forState:UIControlStateNormal];
//    }
    
    
    //方式二
    _currentModel = _selectArray[indexPath.row];
    if (_currentModel.isSelect) {
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1.png"] forState:UIControlStateNormal];
    }else{
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    

    return cell;
}


// didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---> row = %ld",(long)indexPath.row);

    //多选：（自定义）
    //方式一
//    CheckmarkCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//
//    if ([_selectArray[indexPath.row] isEqualToString:@"NO"]) {
//        [_selectArray replaceObjectAtIndex:indexPath.row withObject:@"YES"];
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1.png"] forState:UIControlStateNormal];
//
//    }else{
//        [_selectArray replaceObjectAtIndex:indexPath.row withObject:@"NO"];
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    }
    
    
    //方式二
    CheckmarkCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    _currentModel = _selectArray[indexPath.row];
    
    if (_currentModel.isSelect) {
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _currentModel.isSelect = NO;
    }else{
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1.png"] forState:UIControlStateNormal];
        
        _currentModel.isSelect = YES;
    }
    [_selectArray replaceObjectAtIndex:indexPath.row withObject:_currentModel];
        
    
    //单选：方式四 （自定义）
    //[self tableView:tableView selectRow:indexPath];
    
}

- (void)tableView:(UITableView *)tableView selectRow:(NSIndexPath *)indexPath
{
    //单选：方式四 （自定义）
    if (indexPath.row!=0) {
        
        //取消默认的第一个
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        CheckmarkCell *cell = [tableView cellForRowAtIndexPath:index];
        
        if ([UserDefaults getBoolForKey:@"selectIndex_First"]) {
            [UserDefaults removeObjectForKey:@"selectIndex_First"];
            [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }
    CheckmarkCell *newCell = [tableView cellForRowAtIndexPath:_selIndex];
    [newCell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    //记录当前选中的位置索引
    _selIndex = indexPath;
    
    CheckmarkCell *oldCell = [tableView cellForRowAtIndexPath:indexPath];
    [oldCell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];

}


#pragma mark 自定义 navigationItem
- (void)addNavigationItemRect:(CGRect)rect title:(NSString *)title imgName:(NSString *)imgName tag:(NSInteger)tag isRightItem:(BOOL)isRightItem
{
    UIButton *itemBtn= [[UIButton alloc] initWithFrame:rect];
    [itemBtn setTitle:title forState:UIControlStateNormal];
    [itemBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [itemBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
    [itemBtn addTarget:self action:@selector(navigationItemClick:) forControlEvents:UIControlEventTouchUpInside];
    itemBtn.tag = tag;
    
    
    if (isRightItem) {
        _rightItemBtn = itemBtn;
        
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
        self.navigationItem.rightBarButtonItem= BarButtonItem;
    }else{
        UIBarButtonItem *BarButtonItem= [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
        self.navigationItem.leftBarButtonItem= BarButtonItem;
    }
}
// 导航栏按钮
- (void)navigationItemClick:(UIButton *)btn {
//    NSLog(@"--> navigationItemClick = %ld",btn.tag);
    
    NSLog(@"--> selected = %d",_rightItemBtn.selected);
    
    //方式一
//    if (_rightItemBtn.selected) {
//        [_rightItemBtn setTitle:@"全选" forState:UIControlStateNormal];
//        
//        for (int i=0; i< _selectArray.count; i++) {
//            [_selectArray replaceObjectAtIndex:i withObject:@"NO"];
//        }
//        
//    }else {
//        [_rightItemBtn setTitle:@"都不选" forState:UIControlStateNormal];
//        for (int i=0; i< _selectArray.count; i++) {
//            [_selectArray replaceObjectAtIndex:i withObject:@"YES"];
//        }
//    }
    //方式二
    if (_rightItemBtn.selected) {
        [_rightItemBtn setTitle:@"全选" forState:UIControlStateNormal];
        
        for (int i=0; i< _selectArray.count; i++) {
            _currentModel = _selectArray[i];
            _currentModel.isSelect = NO;
            _currentModel.index = i;
            [_selectArray replaceObjectAtIndex:i withObject:_currentModel];
        }
    }else {
        [_rightItemBtn setTitle:@"都不选" forState:UIControlStateNormal];
        for (int i=0; i< _selectArray.count; i++) {
            _currentModel = _selectArray[i];
            _currentModel.isSelect = YES;
            _currentModel.index = i;
            [_selectArray replaceObjectAtIndex:i withObject:_currentModel];
        }
    }

    [_ttableView reloadData];
    _rightItemBtn.selected = !_rightItemBtn.selected;

}

- (void)backTopBtnClick {
    
    [_ttableView reloadData];
}

- (UIButton *)backTopBtn {
    if (_backTopBtn==nil) {
        CGFloat hh = 36;
        _backTopBtn = [[UIButton alloc] initWithFrame:CGRectMake(SSWIDTH-hh-20, SSHEIGHT-49-hh, hh, hh)];
        _backTopBtn.backgroundColor = [Blue_2599FA colorWithAlphaComponent:0.7];
        _backTopBtn.layer.cornerRadius = hh/2;
        _backTopBtn.layer.masksToBounds= YES;
        [_backTopBtn setTitle:@"顶部" forState:UIControlStateNormal];
        [_backTopBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
        [_backTopBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_backTopBtn addTarget:self action:@selector(backTopBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backTopBtn;
}

@end

