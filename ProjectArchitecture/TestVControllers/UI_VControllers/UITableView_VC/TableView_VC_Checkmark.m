//
//  TableView_VC_Checkmark.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TableView_VC_Checkmark.h"
#import "UIView+ZMFrame.h"
#import "UIView+ZMAdd.h"
#import "CheckmarkCell.h"

static NSString *_cellId = @"cellID";

@interface TableView_VC_Checkmark ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _rowHeight;
    NSInteger _selectIndex;
    NSInteger _secondNum;
}
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) UILabel* nickLab;
@property (nonatomic, strong) UITextField* nickText;

@property (nonatomic,strong) NSIndexPath *lastPath;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@end

@implementation TableView_VC_Checkmark

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
    self.title = @"cell_单选";
    //默认选第一个
    [UserDefaults setBool:YES forKey:@"selectIndex_First"];

    self.automaticallyAdjustsScrollViewInsets = NO;
    _rowHeight = 50;
    CGFloat yy = 64-20;
    [self setTableView:CGRectMake(0, yy, SSWIDTH,SSHEIGHT) withstyle:UITableViewStyleGrouped];
    
    //默认选第一个
    _selectIndex = 0;
    

}


#pragma mark -------------布局---------
-(UITableView *)setTableView:(CGRect)fame withstyle:(UITableViewStyle )allstyle{
    if (!_ttableView) {
        _ttableView = [[UITableView alloc] initWithFrame:fame style:allstyle]; //有背景色
        _ttableView.dataSource = self;
        _ttableView.delegate = self;
        _ttableView.scrollEnabled = YES;
        [UIView clearTableViewLine:_ttableView isHeaderView:YES isFooterView:YES];
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
    return 25;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //设置UITableViewCellAccessoryCheckmark颜色
    //完美解决：
    //cell.tintColor = [UIColor colorWithRed:144.0/255 green:195.0/255 blue:76.0/255 alpha:1];
    
    
    //单选：方式一、二
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if (indexPath.row==0) {
//        cell.textLabel.text = @"男";
//    }else{
//        cell.textLabel.text = @"女";
//    }
    //单选：方式一
    //    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
    //    if ( indexPath.row == _selectIndex ) {
    //        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    }else {
    //        cell.accessoryType = UITableViewCellAccessoryNone;
    //    }
    
    
    //单选：方式二
//    if (indexPath.row==0) {
//        //这个是系统中对勾的那种选择框 默认选择第一个
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
    
    
    //单选：自定义选择框的图片
    
    
    //单选：方式三
//    CheckmarkCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
//    if (cell == nil){
//        cell = [[CheckmarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId];
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    [cell.selectBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    cell.selectBtn.tag = indexPath.row;
//
//    if (indexPath.row==0) {
//        cell.textLabel.text = @"男";
//    }else{
//        cell.textLabel.text = @"女";
//    }
//
//    
//    if (indexPath.row==0) {
//        //这个是系统中对勾的那种选择框 默认选择第一个
//        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
//    }

    
    //单选：方式四（系统cell）
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if (indexPath.row==0) {
//        cell.textLabel.text = @"男";
//    }else{
//        cell.textLabel.text = @"女";
//    }
//    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
//    if (_selIndex == indexPath) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    
    //单选：方式四 （自定义cell）
    CheckmarkCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellId];
    if (cell == nil){
        cell = [[CheckmarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    [cell.selectBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectBtn.tag = indexPath.row;
    
    
    
    [cell.selectBtn setTitle: [NSString stringWithFormat:@"%ld",_secondNum] forState:UIControlStateNormal];
    
    if (indexPath.row==0) {
        cell.textLabel.text = [NSString stringWithFormat:@"男_%ld",indexPath.row];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"女_%ld",indexPath.row];;
    }
    
    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
    if (_selIndex == indexPath) {
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
    }else {
        [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        if (indexPath.row==0) {
            if ([UserDefaults getBoolForKey:@"selectIndex_First"]) {
                //这个是系统中对勾的那种选择框 默认选择第一个
                [cell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
            }
        }
    }
    
    return cell;
}

- (void)BtnClick:(UIButton *)Btn {
    
    //单选：方式三   自定义选择框的图片
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:Btn.tag inSection:0];
//    [self didSelectRowAtIndexPath:indexPath];
    
}


// didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---> row = %ld",(long)indexPath.row);
    
    //单选：方式四 （系统cell）
//    //之前选中的，取消选择
//    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
//    celled.accessoryType = UITableViewCellAccessoryNone;
//    
//    //记录当前选中的位置索引
//    _selIndex = indexPath;
//    //当前选择的打勾
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    if (indexPath.row!=0) {
//        //取消默认的第一个
//        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
//        
//        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:index];
//        newCell.accessoryType = UITableViewCellAccessoryNone;
//    }

    
    //单选：方式四 （自定义cell）
    if (indexPath.row!=0) {
        
        //取消默认的第一个
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        CheckmarkCell *cell = [tableView cellForRowAtIndexPath:index];
        [cell.selectBtn setTitle: [NSString stringWithFormat:@"%ld",_secondNum] forState:UIControlStateNormal];

        
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
    
    
    
    //单选：方式一
    //    _selectIndex = indexPath.row;
    //    [_ttableView reloadData];
    
    
    //单选：方式二
//    if (indexPath.row!=0) {
//        //取消默认的第一个
//        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
//        
//        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:index];
//        newCell.accessoryType = UITableViewCellAccessoryNone;
//    }
//    NSInteger newRow = [indexPath row];
//    NSInteger oldRow = (self .lastPath !=nil)?[self .lastPath row]:-1;
//
//    if (newRow != oldRow) {
//        
//        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
//        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
//        
//        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:_lastPath];
//        oldCell.accessoryType = UITableViewCellAccessoryNone;
//        
//        self .lastPath = indexPath;
//    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
     //单选：方式三   自定义选择框的图片
//    [self didSelectRowAtIndexPath:indexPath];
    
    
    
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row!=0) {
        //取消默认的第一个
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        CheckmarkCell *oldCell = [_ttableView cellForRowAtIndexPath:index];
        [oldCell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }

    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (self.lastPath !=nil)?[self.lastPath row]:-1;
    
    //单选：自定义选择框的图片
    if (newRow != oldRow) {
        
        CheckmarkCell *newCell = [_ttableView cellForRowAtIndexPath:indexPath];
        [newCell.selectBtn setBackgroundImage:[UIImage imageNamed:@"yes1"] forState:UIControlStateNormal];
        
        CheckmarkCell *oldCell = [_ttableView cellForRowAtIndexPath:self.lastPath];
        [oldCell.selectBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        self .lastPath = indexPath;
    }
    [_ttableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
