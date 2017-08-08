//
//  AATestVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "AATestVController.h"
#import "TestAAView.h"
#import "UILabel+ZMAdd.h"

@interface AATestVController ()
{
    
}
@property (nonatomic, strong) UIView *BgView;
@property (nonatomic, strong) UIButton * acceptBtn;
@property (nonatomic, strong) UILabel * titleLab;
@property (nonatomic, strong) TestAAView *testAAView;
@end

@implementation AATestVController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

    self.tabBarController.tabBar.hidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    [self setTitle:@"AATestVC" TitleColor:[UIColor whiteColor]];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    
    
//    [self.view addSubview:self.BgView];
//    [self.BgView addSubview:self.acceptBtn];
    
    
//    [self.view addSubview:self.testAAView];
//    
//    _testAAView.acceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _testAAView.acceptBtn.frame = CGRectMake(20, 200-50+20, 200, 50);
//    _testAAView.acceptBtn.backgroundColor = [UIColor orangeColor];
//    _testAAView.acceptBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//    [_testAAView.acceptBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_testAAView.acceptBtn setTitle:@"接单" forState:UIControlStateNormal];
//    _testAAView.acceptBtn.layer.cornerRadius = 3.f;
//    _testAAView.acceptBtn.clipsToBounds = YES;
//    [_testAAView.acceptBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.testAAView addSubview:_testAAView.acceptBtn];
    
    
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

-(void)BtnClick {
    
    NSLog(@"--->  按钮 = %@", @"BtnClick");
}


- (TestAAView *)testAAView {
    if (_testAAView==nil) {
        _testAAView = [[TestAAView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 200)];
        _testAAView.backgroundColor = Yellow_COLOR;
    }
    return _testAAView;
}




- (UIView *)BgView {
    if (_BgView==nil) {
        _BgView = [[UIView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 200)];
        _BgView.backgroundColor = Yellow_COLOR;
    }
    return _BgView;
}

- (UIButton *)acceptBtn {
    if (!_acceptBtn) {
        _acceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _acceptBtn.frame = CGRectMake(20, 200-50+20, 200, 50);
        _acceptBtn.backgroundColor = [UIColor orangeColor];
        _acceptBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_acceptBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_acceptBtn setTitle:@"接单" forState:UIControlStateNormal];
        _acceptBtn.layer.cornerRadius = 3.f;
        _acceptBtn.clipsToBounds = YES;
        [_acceptBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _acceptBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        _acceptBtn.titleLabel.textAlignment = NSTextAlignmentCenter;;

    }
    return _acceptBtn;
}


@end
