//
//  ZM_TestTableViewVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_TestTableViewVC.h"
#import "TestCell.h"
#import "TableReusableViewA.h"
#import "TableReusableViewB.h"

static NSString *kHeaderViewId      = @"TableReusableViewA";
static NSString *kFooterViewId      = @"TableReusableViewB";
static NSString *kTestNormalCellId  = @"TestNormalCell";
static NSString *kTestCellId        = @"TestCell";
static CGFloat rowHeight = 80;           // cell的高度
static CGFloat EstimatedRowHeight = 500; // cell的预估高度
static CGFloat HeaderViewHeight = 30.f; 
static CGFloat FooterViewHeight = 50.f; 

@interface ZM_TestTableViewVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView* ttableView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, assign) int page; 
@end

@implementation ZM_TestTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

/**
 * UITableViewController
 */
-(void)viewDidLayoutSubviews {
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//    [self.tableView setFrame:CGRectMake(0.0, 0.0, SSWIDTH, SSHEIGHT-49)];
} 

- (void)configUI {
    [self.view addSubview:self.ttableView];
    self.ttableView.frame = CGRectMake(0, SS_NavBarHeight, SSWIDTH, SSHEIGHT-49-SS_NavBarHeight);
}

#pragma mark -UITableViewDataSource && UITableViewDelegate
//section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
//Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 5;
    }else{
        return 10;
    }
}
//RowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (indexPath.section==0) {
        return 50;
    }else{
        tableView.estimatedRowHeight = EstimatedRowHeight;
        return  UITableViewAutomaticDimension;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestNormalCellId];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTestNormalCellId];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //小灰色箭头
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //防止滑动时重叠
        for (UIView *subviews in [cell.contentView subviews]) {
            [subviews removeFromSuperview];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"test_%ld",(long)indexPath.row];
        return cell;
        
    }else {
        TestCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestCellId];
        if (self.dataArray.count>0) {
            //cell.model = self.dataArray[indexPath.row];
        }
        return cell;
    }    
    
}
#pragma mark  ----------------"   Section headerView & footerView  "--------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HeaderViewHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return FooterViewHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TableReusableViewA *reuseView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderViewId];
    if(!reuseView){
        reuseView = [[TableReusableViewA alloc] initWithReuseIdentifier:kHeaderViewId];
    }
    return reuseView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    TableReusableViewB *reuseView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kFooterViewId];
    if(!reuseView){
        reuseView = [[TableReusableViewB alloc] initWithReuseIdentifier:kFooterViewId];
    }return reuseView;
}


#pragma mark  --- didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // 进入测试页
    UIViewController *pushVC = [[UIViewController alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
    // 获取对应的cell
    TestCell *cell = (TestCell *)[_ttableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
}
- (void)configTableView {
    /** 增删改查 */
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1]; 
    
    [self.ttableView beginUpdates];
    [self.ttableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.ttableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]  withRowAnimation:UITableViewRowAnimationNone];
    [self.ttableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.ttableView endUpdates];
    
    // 滚动到指定位置  
    [self.ttableView reloadData];  
    NSIndexPath * dayOne = [NSIndexPath indexPathForRow:0 inSection:2];  
    [self.ttableView scrollToRowAtIndexPath:dayOne atScrollPosition:UITableViewScrollPositionTop animated:YES]; 
}



-(UITableView *)ttableView {
    if (!_ttableView) {
        _ttableView = [[UITableView alloc] init];
        _ttableView.backgroundColor = [UIColor clearColor];
        _ttableView.dataSource = self;
        _ttableView.delegate = self;
        _ttableView.frame = self.view.bounds;
        _ttableView.rowHeight = rowHeight;
        // _ttableView.estimatedRowHeight = rowHeight;
        // _ttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 分割线 自左向右 全部显示
        _ttableView.separatorInset = UIEdgeInsetsZero;
        _ttableView.layoutMargins  = UIEdgeInsetsZero;
        if (@available(iOS 11.0, *)) {
            _ttableView.estimatedRowHeight = 0;
            _ttableView.estimatedSectionHeaderHeight = 0;
            _ttableView.estimatedSectionFooterHeight = 0;
        }
        //注册 Cell（code）
        [_ttableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTestNormalCellId];
        //注册 Cell（xib）
        [_ttableView registerNib:[UINib nibWithNibName:kTestCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kTestCellId];
        //注册 HeaderView、FooterView （code）
        [_ttableView registerClass:[TableReusableViewA class] forHeaderFooterViewReuseIdentifier:kHeaderViewId];
        //注册 HeaderView、FooterView （xib） Nib的view需要继承UICollectionReusableView
        [_ttableView registerNib:[UINib nibWithNibName:@"TableReusableViewB" bundle:[NSBundle mainBundle]] forHeaderFooterViewReuseIdentifier:kFooterViewId];
        //分割线 颜色
        [_ttableView setSeparatorColor:White_COLOR];
        //清除UITableView底部多余的分割线
        UIView *View= [UIView new];
        [_ttableView setTableFooterView:View];
        [_ttableView setTableHeaderView:View];
    } return _ttableView;
}

@end
