//
//  TabelTextFieldVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TabelTextFieldVController.h"
#import "UIColor+ZMAdd.h"
#import "UIView+ZMFrame.h"
#import "IQKeyboardManager.h"
#import "AccountModel.h"

@interface TabelTextFieldVController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    float rowHeight;
    UIButton* nextBtn;
}
@property (nonatomic,strong) UITableView* ttableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSMutableArray *tableDataArray;
@property (nonatomic,strong) AccountModel *accountModel;
@property (nonatomic,strong) AccounTDataModel *dataModel;
@end

@implementation TabelTextFieldVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    [self setTitle:@"TabelFieldVC" TitleColor:[UIColor whiteColor]];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    self.view.backgroundColor = [UIColor colorHexString:@"FFFAFA"];
    // 添加单击手势
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(KeyBoardDown)];
    [self.view addGestureRecognizer:tap];
    
    [self initUI];
    
}
//手势绑定的事件
-(void)KeyBoardDown {
    [self.view endEditing:YES];
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"str1：",@"str2：",@"str3：",@"str4：",@"str5："
                        ,@"str6：",@"str7：",@"str8：",@"str9：",@"str10："
                        ,@"str11：",@"str12：",@"str13：",@"str14：",@"str15："];
    }
    return _titleArray;
}

- (void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    rowHeight = 50;
    [self setTableView:CGRectMake(0, 64, SSWIDTH,SSHEIGHT-64)];
    
    [self setDataSource];

}

- (void)setDataSource
{
    _accountModel = [[AccountModel alloc] init];
    _dataModel = [[AccounTDataModel alloc] init];
    
    _tableDataArray = [[NSMutableArray alloc] init];
    NSString* str = @"";
    for (int i=1; i<(self.titleArray.count+1); i++) {
        
        str = [NSString stringWithFormat:@"str%d：",i];
        
        AccountModel *nameModel = [[AccountModel alloc] init];
        nameModel.title = str;
        nameModel.placeholder = [NSString stringWithFormat:@"请输入网店名称str%d",i];;
        nameModel.key = [NSString stringWithFormat:@"str%d",i];;
        [_tableDataArray addObject:nameModel];
    }
    NSLog(@"--> _tableDataArray = %@",_tableDataArray);
    if(_ttableView){
        [_ttableView reloadData];
    }
}

#pragma mark -------------布局---------
-(UITableView *)setTableView:(CGRect)fame {
    if (!_ttableView) {
        _ttableView = [[UITableView alloc] initWithFrame:fame];
        _ttableView.backgroundColor = White_COLOR;
        _ttableView.dataSource = self;
        _ttableView.delegate = self;
        _ttableView.scrollEnabled = YES;
        [self clearTableViewLine:_ttableView isHeaderView:YES isFooterView:YES];
        [self.view addSubview:self.ttableView];
    }
    return _ttableView;
}

#pragma mark ============="  UITableViewDataSource、UITableViewDelegate  "==================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"CellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSeparatorInset:UIEdgeInsetsMake(0, SSWIDTH, 0, 0)];
    };
    
    //同上
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 60, rowHeight)];
    nameLab.font = FFont(16);
    nameLab.backgroundColor = White_COLOR;
    [cell addSubview:nameLab];

    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(nameLab.right+10, 5, SSWIDTH-nameLab.right-10-10, rowHeight-10)];
    field.font = FFont(16);
    field.layer.cornerRadius = 3.f;
    field.clipsToBounds = YES;
    field.layer.borderWidth = 1.f;
    field.layer.borderColor = [UIColor grayColor].CGColor;
    [cell addSubview:field];

    [field addTarget:self action:@selector(textFiledEditChanged:) forControlEvents:UIControlEventEditingChanged];
    field.tag = indexPath.row;
    
    
    AccountModel *aModel = _tableDataArray[indexPath.row];
    nameLab.text = aModel.title;
    field.placeholder =  aModel.placeholder;
    //利用 KVC 控制变量
    field.text = [_dataModel valueForKey:aModel.key];

    return cell;
}


- (void)textFiledEditChanged:(UITextField *)textField
{
    //利用 KVC 控制变量：找到对应的 key // 将textField中的值赋给_dataModel
    _accountModel = _tableDataArray[textField.tag];
    [_dataModel setValue:textField.text forKey:_accountModel.key];
    
    //NSLog(@"--> textField.text = %@",textField.text);
    //NSLog(@"--> key = %@",_accountModel.key);
    //NSLog(@"--> value = %@ \n ",[_dataModel valueForKey:_accountModel.key]);
    
}

@end
