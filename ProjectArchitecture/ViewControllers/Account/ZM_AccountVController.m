//
//  AccountViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZM_AccountVController.h"
#import "MoreCell.h"
#import "UIView+ZMFrame.h"
#import "UIView+ZMAdd.h"
#import "UILabel+ZMAdd.h"
#import "TabelTextFieldVController.h"
#import "LoginViewController.h"

@interface ZM_AccountVController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
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

@implementation ZM_AccountVController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;//显示tabBar
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = White_COLOR;
//	NSLog(@"---> getCurrentVC_CC = %@ \n ",[Common getCurrentVC]);
//    if ([[[Common getCurrentVC] class] isEqual:[AccountViewController class]]) {
//    }

    [self initUI];
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"等级特权",@"业务管理",@"业务统计",@"提现申请",@"体现记录",@""
                        ,@"联系客服",@"",@"个人信息维护"];
    }return _titleArray;
}
- (NSArray *)imgNameArray {
    if (!_imgNameArray) {
        _imgNameArray = @[@"headerImgA",@"headerImgB",@"headerImgC",@"headerImgD",@"headerImgE",@""
                          ,@"headerImgF",@"",@"Photo"];
    }return _imgNameArray;
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
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
        [UIView zm_clearTableViewLine:_tableView isHeaderView:YES isFooterView:YES];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

-(UIView *)topView {
    if (!_topView) {
        float hh = 100;
        _topView=[[UIView alloc]init];
        _topView.frame=CGRectMake(0, 0, SSWIDTH, hh);
        _topView.backgroundColor = White_COLOR;
        
        float xx = 15, ww = (100 - xx*2);
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(xx, xx, ww, ww)];
        imgV.image = [UIImage imageNamed:@"Photo"];
        imgV.layer.cornerRadius = ww/2;
        imgV.clipsToBounds = YES;
        imgV.backgroundColor = ColorHex(0xFFF5EE);
        [_topView addSubview:imgV];
        
        
        float labHH = 20;
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+5, hh/2-labHH-5, 0, labHH)];
        nameLab.font = FFont(16);
        nameLab.textOfHeightFixed = @"xx经理";
        [_topView addSubview:nameLab];
        
        UILabel *detailLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+5, hh/2+5, 120, labHH)];
        detailLab.text = @"金服来了襄阳公司";
        detailLab.font = FFont(14);
        detailLab.textColor = ColorHex(0xBC8F8F);
        [_topView addSubview:detailLab];
        
        UIImageView *imgVIP = [[UIImageView alloc]initWithFrame:CGRectMake(nameLab.right+5, nameLab.top, 20, 20)];
        imgVIP.image = [UIImage imageNamed:@"VIP_gold"];
        imgVIP.backgroundColor = ColorHex(0xFFF5EE);
        [_topView addSubview:imgVIP];
        
        UIButton* Btn= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 36)];
        Btn.center = CGPointMake(SSWIDTH-50, _topView.centerY);
        //Btn.backgroundColor = [UIColor yellowColor];
        //Btn.titleLabel.font = [UIFont systemFontOfSize:18]; 
        [Btn setTitle:@"登录" forState:UIControlStateNormal];
        [Btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [Btn addTarget:self action:@selector(zm_longinClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:Btn];
        
    }
    return _topView;
}
- (void)zm_longinClick {
    LoginViewController *presentVC = [[LoginViewController alloc]init];
    // 1.没有导航栏：present
    // [self presentViewController:presentVC animated:YES completion:nil];
    // 2.有导航栏：present
    UINavigationController *_Nav= [[UINavigationController alloc] initWithRootViewController:presentVC];
    [self presentViewController:_Nav animated:YES completion:nil];
}

@end
