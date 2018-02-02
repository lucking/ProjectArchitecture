//
//  UILabel_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UILabel_VController.h"
#import "UILabel+ZMAdd.h"
#import "UIViewController+ZMAdd.h"
#import "TestColorHeader.h"

@interface UILabel_VController ()
{
    
}
@property (nonatomic, strong) UILabel * titleLab;
@end

@implementation UILabel_VController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UILabel_VC";
    
    //覆盖默认返回按钮：处理有其他返回情况
    [self backBtnNoNavBar:NO normalBack:NO];
    __weak typeof(self) weakSf = self;
    self.popBlock = ^(UIButton *Btn) {
        NSLog(@"--> popBlock_UILabel_VC");
        [weakSf.navigationController popViewControllerAnimated:YES];
    };
    
    
    [self case1];
    
    // UILabel
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
//    label.backgroundColor = [UIColor yellowColor];
//    label.font = [UIFont systemFontOfSize:15];
//    label.text = @"hello,girl";
//    label.textColor = [UIColor redColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:label];
    

    // UIButton
    UIButton* Btn=[UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame= CGRectMake(60, 200, 160, 36);
    Btn.backgroundColor= [UIColor cyanColor];
    Btn.layer.cornerRadius = 3.f;
    Btn.clipsToBounds = YES;
    [Btn setTitle:@"按钮" forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn setTintColor:[UIColor whiteColor]];
    [Btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn];

    Btn.titleLabel.font = [UIFont systemFontOfSize:18];

}
// 按钮
-(void)BtnClick{
    [self.titleLab hudContextInfo:@"lab 提示框" afterDelay:Hud_AlertTime];
}


- (void)case1 {
//    //测试
//    NSString *str = @"    上海棠棣信息科技有限公司（股票代码833777，简称“棠棣信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n    棠棣信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n    棠棣信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，棠棣信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。";
//    
//    //    str = @"1.周一了 \n 2.周二了 \n 3.周三了 ";
//    self.titleLab.text = str;
//    
//    [self.titleLab changeLabTextArray:@[@"上海棠棣信息科技有限公司",@"833777"]
//                           colorArray:@[[UIColor darkTextColor],Blue_2599FA]
//                            fontArray:@[@"16",@"14"]
//                            alignment:NSTextAlignmentLeft
//                            lineSpace:4.4f
//                       paragraphSpace:30.f
//                       characterSpace:@2.0f
//                             autoSize:YES];

}

// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 300, 30)];
        _titleLab.font = FFont(16);
        _titleLab.textColor = Black_COLOR;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.numberOfLines = 0;
        [self.view addSubview: _titleLab];
        _titleLab.backgroundColor = Yellow_COLOR;
    }
    return _titleLab;
}


@end
