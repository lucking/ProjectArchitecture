//
//  AccountViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "AccountViewController.h"
#import "MoreCell.h"
#import "UIColor+ZMAdd.h"
#import "UIView+ZMFrame.h"
#import "NSString+ZMAdd.h"
#import "UILabel+ZMAdd.h"
#import "TabelTextFieldVController.h"
#import "AppMacro.h"

@interface AccountViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    float rowHeight;
    UIButton* nextBtn;
}
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *imgNameArray;

@end

@implementation AccountViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //显示tabBar
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

//	NNSLog(@"---> getCurrentVC_CC = %@ \n ",[Common getCurrentVC]);
//    if ([[[Common getCurrentVC] class] isEqual:[AccountViewController class]]) {
//    }

    [self initUI];

    self.view.backgroundColor = White_COLOR;

}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"等级特权",@"业务管理",@"业务统计",@"提现申请",@"体现记录",@""
                        ,@"联系客服",@"",@"个人信息维护"];
    }
    return _titleArray;
}
- (NSArray *)imgNameArray {
    if (!_imgNameArray) {
        _imgNameArray = @[@"headerImgA",@"headerImgB",@"headerImgC",@"headerImgD",@"headerImgE",@""
                          ,@"headerImgF",@"",@"Photo"];
    }
    return _imgNameArray;
}
- (void)initUI {
    
    rowHeight = 50;
    
    [self setTableView:CGRectMake(0, 0, SSWIDTH,SSHEIGHT) withstyle:UITableViewStyleGrouped];
    self.tableView.tableHeaderView= [self topView];
    
    
}

// didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"---> row = %ld",(long)indexPath.row);
    if (indexPath.row==8) {
        // push
        TabelTextFieldVController *pushVC = [[TabelTextFieldVController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else {
        
    }
    
}


#pragma mark ============="  UITableViewDataSource、UITableViewDelegate  "==================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==5 || indexPath.row==7) {
        return 20;
    }
    return rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"CellID";
    MoreCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[MoreCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId rowHeight:rowHeight];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    };
    if (indexPath.row==5 || indexPath.row==7) {
        cell.backgroundColor = Clear_COLOR;
        cell.separatorInset = UIEdgeInsetsZero;
        return cell;
    }else {
        cell.backgroundColor = White_COLOR;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //小灰色箭头
        cell.imgName = self.imgNameArray[indexPath.row];
        cell.title = self.titleArray[indexPath.row];
        
        if (indexPath.row==4 || indexPath.row==6) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        return cell;
    }
}

#pragma mark -------------布局---------
-(UITableView *)setTableView:(CGRect)fame withstyle:(UITableViewStyle )allstyle{
    if (!_tableView) {
        //_tableView = [[UITableView alloc] initWithFrame:fame]; //无背景色
        //_tableView.backgroundColor = [UIColor colorHexString:@"FFFAFA"];
        _tableView = [[UITableView alloc] initWithFrame:fame style:allstyle]; //有背景色
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = YES;
        [self clearTableViewLine:_tableView isHeaderView:YES isFooterView:YES];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

-(UIView *)topView {
    if (!_topView) {
        float hh = GetHeight(100);
        _topView=[[UIView alloc]init];
        _topView.frame=CGRectMake(0, 0,SSWIDTH, hh);
        _topView.backgroundColor = White_COLOR;
        
        float xx = GetHeight(15), ww = (GetHeight(100) - xx*2);
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(xx, xx, ww, ww)];
        imgV.image = [UIImage imageNamed:@"Photo"];
        imgV.layer.cornerRadius = ww/2;
        imgV.clipsToBounds = YES;
        imgV.backgroundColor = Color_With_Hex(0xFFF5EE);
        [_topView addSubview:imgV];
        
        
        float labHH = 20;
        
                //同上
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+5, hh/2-labHH-5, 0, labHH)];
        nameLab.font = FFont(16);
        nameLab.textOfHeightFixed = @"xx经理";
        [_topView addSubview:nameLab];
        
        
        UILabel *detailLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+5, hh/2+5, 120, labHH)];
        detailLab.text = @"金服来了襄阳公司";
        detailLab.font = FFont(14);
        detailLab.textColor = Color_With_Hex(0xBC8F8F);
        [_topView addSubview:detailLab];
        
        
        UIImageView *imgVIP = [[UIImageView alloc]initWithFrame:CGRectMake(nameLab.right+5, nameLab.top, 20, 20)];
        imgVIP.image = [UIImage imageNamed:@"VIP_gold"];
        imgVIP.backgroundColor = Color_With_Hex(0xFFF5EE);
        [_topView addSubview:imgVIP];
        
    }
    return _topView;
}


@end
