//
//  TableView_VC_CheckMoreBox.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/14.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TableView_VC_CheckMoreBox.h"
#import "UIView+ZMFrame.h"
#import "UIView+ZMAdd.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "CollectCell.h"
#import "Collect.h"

static NSString *_cellId = @"collect_CellID";
static CGFloat _rowHeight = 100;    // cell的高度
static CGFloat rowPage = 10;        //每页10条数据
static CGFloat const SelectDealViewHeight = 40;//处理选择View的高度
#import "CollectDealView.h"
#import "NSObject+MJRefresh.h"
#import "NSString+ZMAdd.h"
@interface TableView_VC_CheckMoreBox ()<UITableViewDelegate, UITableViewDataSource>
{
    CGRect topRect, bottomRect;
}
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) NSMutableArray *dataArray;//数据源
@property (nonatomic, strong) NSMutableArray *selectArray;//多选，当前选中的行
@property (nonatomic) CGRect showRect;  // 显示_View
@property (nonatomic) CGRect hiddenRect;// 隐藏_View
@property (nonatomic, assign) int page; // 咨询页数

@property (nonatomic, strong) CollectDealView *selectDealView;
@property (nonatomic, strong) Collect *currentModel;//
@property (nonatomic, strong) UIButton *editBtn;
@end

@implementation TableView_VC_CheckMoreBox

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidDisappear:(BOOL)animated {
    self.automaticallyAdjustsScrollViewInsets = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收藏";
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    self.view.backgroundColor = White_COLOR;
    
    _currentModel = [[Collect alloc] init];
    _dataArray = [[NSMutableArray alloc] init];
    _selectArray = [[NSMutableArray alloc] init];
    _hiddenRect = CGRectMake(0, 0, SSWIDTH, _rowHeight);
    _showRect = CGRectMake(58, 0, SSWIDTH, _rowHeight);
    // UITableView
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setTableView:CGRectMake(0, 64, SSWIDTH,SSHEIGHT-64) withstyle:UITableViewStylePlain];
    //编辑
    [self setNavItemButton];
    //全选、删除
    topRect    = CGRectMake(0, SSHEIGHT- SelectDealViewHeight, SSWIDTH, SelectDealViewHeight);
    bottomRect = CGRectMake(0, SSHEIGHT, SSWIDTH, SelectDealViewHeight);
    [self.view addSubview:self.selectDealView];
    //选择行为：（全选、删除）
    [self setAction];
    
    //模仿请求：造假数据
    // 下拉刷新
    __weak __typeof(self)weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        weakSelf.page = 1;
        [weakSelf collectList_IsHeader:YES];
    }];
    self.ttableView.mj_header = header;
    self.ttableView.mj_header.automaticallyChangeAlpha = YES;
    // 立即刷新：默认请求
    [self.ttableView.mj_header beginRefreshing];
    // 上拉加载更多
    self.ttableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉加载更多");
        weakSelf.page = weakSelf.page +1;
        [weakSelf collectList_IsHeader:NO];
    }];
    
}
#pragma mark --- 没数据：点击刷新
- (void)noDataBtnToRequestData {
    // 马上进入刷新状态
    [self.ttableView.mj_header beginRefreshing];
}

#pragma mark ------------- 请求：收藏列表 ---------
- (void)collectList_IsHeader:(BOOL)isHeader {
    
    [self endRefreshTableView:self.ttableView isHeader:isHeader];
    self.editBtn.hidden = NO;
    
    for (int i=0; i<rowPage; i++) {
        Collect *model = [[Collect alloc] init];
        model.newsId = @"201705090001";
        model.skimNum = @"51678";
        model.title = [NSString stringWithFormat:@"标题_%d",i+ (self.page-1)*10 ];
        model.content = @"新闻内容";
        model.imageURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494397013780&di=f44a75aeb77a6c3a80a5931ccb763f46&imgtype=0&src=http%3A%2F%2Fwww.itbulu.com%2Fwp-content%2Fuploads%2F2016%2F01%2Fnc-ssl-10.jpg";
        model.createtime = @"2017-5-10 12:30:00";
        model.isSelect = NO;
        [_dataArray addObject:model];
    }
    //NSLog(@"---> _dataArray= %@", _dataArray);
    self.selectDealView.allNum = _dataArray.count;
    [_ttableView reloadData];
    
}

#pragma mark - /************************  响应方法  **************************/

#pragma mark --- 编辑
- (void)selectBtnClick
{
    
    if (self.dataArray.count>0 ) {
    }else{
        [self hudShowMessage:@"没有收藏" afterDelay:Hud_AlertTime];
        
        return;
    }
    self.selectDealView.selectNum = 0;
    [self.selectArray removeAllObjects];
    
    NSLog(@"--> _editBtn_selected = %d",_editBtn.selected);
    if (_editBtn.selected) {
        //完成：正常状态
        // 隐藏_View
        [_selectDealView flipView:_selectDealView Rect:bottomRect forView:self.view timeInterval:0.3];
        _ttableView.frame = CGRectMake(0, 64, SSWIDTH,SSHEIGHT-64);
    }else {
        //编辑中...
        // 显示_View
        [_selectDealView flipView:_selectDealView Rect:topRect forView:self.view timeInterval:0.3];
        _ttableView.frame = CGRectMake(0, 64, SSWIDTH, SSHEIGHT-64-_selectDealView.height);
        
        //方式一：删除后，全部重新添加
        //方式二：替换
        Collect *model = nil;
        for (int i=0; i< [_dataArray count]; i++) {
            model = _dataArray[i];
            model.isSelect = NO;
            [_dataArray replaceObjectAtIndex:i withObject:model];
        }
    }
    [_ttableView reloadData];
    _editBtn.selected = !_editBtn.selected;
    
}
#pragma mark --- 选择行为： 全选、删除
//选择行为
- (void)setAction
{
    __weak typeof(self) weakSf = self;
    _selectDealView.collectSelectBlock = ^(CollectDealView *dealView, ActionType actionType){
        NSLog(@"--> actionType = %ld",(long)actionType);
        //全选
        if (actionType== SelectAction) {
            NSLog(@"--> dealView.allSelect = %d \n ",dealView.allSelect);
            if (dealView.allSelect) {
                //全部选择
                [weakSf.selectArray removeAllObjects];
                dealView.selectText = @"取消全选";
                for (int i=0; i< weakSf.dataArray.count; i++) {
                    weakSf.currentModel = weakSf.dataArray[i];
                    weakSf.currentModel.isSelect = YES;
                    [weakSf.dataArray replaceObjectAtIndex:i withObject:weakSf.currentModel];
                }
                [weakSf.selectArray addObjectsFromArray:weakSf.dataArray];
                
            }else {
                //都不选
                dealView.selectText = @"全选";
                for (int i=0; i< weakSf.dataArray.count; i++) {
                    weakSf.currentModel = weakSf.dataArray[i];
                    weakSf.currentModel.isSelect = NO;
                    [weakSf.dataArray replaceObjectAtIndex:i withObject:weakSf.currentModel];
                }
                [weakSf.selectArray removeAllObjects];
            }
            weakSf.selectDealView.selectNum = weakSf.selectArray.count;
            [weakSf.ttableView reloadData];
            
        }//删除
        else{
            //NSLog(@"--> dataArray.count = %ld",(long)weakSf.dataArray.count);
            NSLog(@"--> deleteArray.count = %ld",(long)weakSf.selectArray.count);
            
            if (weakSf.dataArray.count>0 && weakSf.selectArray.count>0  ) {
                UIAlertView * aletrtVIew =[[UIAlertView alloc]initWithTitle:@"删除选择" message:@"" delegate:weakSf cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                [aletrtVIew show];
            }else{
                [weakSf hudShowMessage:@"没有选项" afterDelay:Hud_AlertTime];
            }
        }
    };
}
#pragma mark ---- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0){
        //请求：收藏_删除
        [self removeCollectSelect:self.selectArray];
    }else{
        //取消
    }
}

#pragma mark ---- 请求：收藏_删除
- (void)removeCollectSelect:(NSMutableArray *)array
{
    __weak typeof(self) WSelf = self;
    //服务器数据删除成功，本地的也要响应删除
    WSelf.selectDealView.selectNum = 0;
    [WSelf.dataArray removeObjectsInArray:WSelf.selectArray];
    [WSelf.selectArray removeAllObjects];
    [WSelf.ttableView reloadData];
    WSelf.selectDealView.allNum = WSelf.dataArray.count;
    
    if (WSelf.dataArray.count == 0) {
        // 隐藏_View
        [WSelf.selectDealView flipView:WSelf.selectDealView Rect:bottomRect forView:WSelf.view timeInterval:0.3];
        WSelf.editBtn.hidden = YES;
        WSelf.editBtn.selected = NO;
    }
    [WSelf hudShowSucceed:@"删除成功" afterDelay:Hud_AlertTime];
    
}

#pragma mark --- 请求：收藏删除_单条
- (void)deleteCollectInForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Collect *model = _dataArray[indexPath.row];
    [self hudShowSucceed:@"删除收藏成功" afterDelay:Hud_AlertTime];
    
    // 确认删除：从数据源中删除行。
    [_dataArray removeObjectAtIndex:indexPath.row];
    self.selectDealView.allNum = self.dataArray.count;
    [self.ttableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.ttableView reloadData];
    
}

#pragma mark ------"  UITableViewDataSource、UITableViewDelegate  "------
//RowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _rowHeight;
}
//Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
    if (cell == nil){
        cell = [[CollectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId rowHeight:_rowHeight];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    cell.backgroundColor = [UIColor whiteColor];
    //配置数据
    _currentModel = _dataArray[indexPath.row];
    cell.model = _currentModel;
    
    if (_currentModel.isSelect) {
        //选择
        cell.checkImgView.image = IMG(@"check");
        cell.checkBgView.backgroundColor = BgColor;
    }else{
        //没选择
        cell.checkImgView.image = IMG(@"circle");
        cell.checkBgView.backgroundColor = BgLightColor;
    }
    if (_editBtn.selected) {
        //编辑
        [cell flipView:cell.BgView Rect:_showRect forView:self.view timeInterval:0.1];
        cell.checkImgView.hidden= NO;
    }else {
        //不编辑
        [cell flipView:cell.BgView Rect:_hiddenRect forView:self.view timeInterval:0.1];
        cell.checkImgView.hidden= YES;
    }
    return cell;
}

//先要设Cell可滑动编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_editBtn.selected) {
        return NO;
    }else{
        return YES;
    }
}
//定义滑动编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == (999999) ) {
        return UITableViewCellEditingStyleNone;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}
//修改滑动编辑按钮文字
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
//进入滑动编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //请求：收藏删除_单条
        [self deleteCollectInForRowAtIndexPath:indexPath];
    }
}
#pragma mark ----  didSelect：（正选）将选中的cell加入删除的数据数组中
// didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---> row = %ld",(long)indexPath.row);
    _currentModel = _dataArray[indexPath.row];
    
    if (_editBtn.selected) {
        //编辑中：方式二
        CollectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (_currentModel.isSelect) {
            //不选：移除
            cell.checkImgView.image = IMG(@"circle");
            cell.checkBgView.backgroundColor = BgLightColor;
            
            _currentModel.isSelect = NO;
            [_selectArray removeObject:_dataArray[indexPath.row]];
        }else{
            //选择：添加
            cell.checkImgView.image = IMG(@"check");
            cell.checkBgView.backgroundColor = BgColor;
            
            _currentModel.isSelect = YES;
            [_selectArray addObject:_dataArray[indexPath.row]];
        }
        [_dataArray replaceObjectAtIndex:indexPath.row withObject:_currentModel];
        _selectDealView.selectNum = self.selectArray.count;
        
    }else{
        //进入详情
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    }
}
#pragma mark ---- didDeselect：（反选）
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark -------------布局 setter getter ---------

- (UITableView *)setTableView:(CGRect)fame withstyle:(UITableViewStyle )allstyle
{
    if (!_ttableView) {
        _ttableView = [[UITableView alloc] initWithFrame:fame style:allstyle]; //有背景色
        _ttableView.dataSource = self;
        _ttableView.delegate = self;
        _ttableView.scrollEnabled = YES;
        [self clearTableViewLine:_ttableView isHeaderView:YES isFooterView:YES];
        [self.view addSubview:self.ttableView];
    }return _ttableView;
}
- (CollectDealView *)selectDealView
{
    if (!_selectDealView) {
        _selectDealView = [[CollectDealView alloc] initWithFrame:bottomRect];
        _selectDealView.backgroundColor = BgGrayColor;
    }return _selectDealView;
}
//编辑、完成
- (void)setNavItemButton {
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake(0, 0, 60, 30);
    [_editBtn addTarget:self action:@selector(selectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitle:@"完成" forState:UIControlStateSelected];
    [_editBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
    [_editBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    
    UIBarButtonItem *rightItem =[[UIBarButtonItem alloc]initWithCustomView:_editBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

@end

