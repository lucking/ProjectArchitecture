//
//  UIAlertController_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIAlertController_VC.h"
#import "UIViewController+ZMAdd.h"
#import "NSObject+AlertView.h"

@interface UIAlertController_VC ()
{
    
}
@property (nonatomic, strong)NSArray *titleImgArray;
@property (nonatomic, strong)NSArray *titleArray;
@end

@implementation UIAlertController_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];
    
    _titleImgArray = @[@"yuE",@"weiXinPay",@"zhiFuBaoPay",@"unionpay"];
    _titleArray    = @[@"余额支付",@"微信支付",@"支付宝支付",@"银行卡支付"];

}

//例一：
- (void)case1 {
    // 测试
    [self showAlertTitle:nil message:@"第一次进入" okTitle:@"确定" cancelTitle:nil okAction:^{
        NSLog(@"---> 确定");
        
    }  cancelAction:^{
        NSLog(@"---> 取消");
        
    } completion:^{
        NSLog(@"---> 弹出时");
    }];
}
//例二：
- (void)case2 {
    
    [self AlertTitle:@"银行卡支付" message:@"" andOthers:_titleArray animated:YES action:^(NSInteger index) {
        NSLog(@"index = %ld",index);
        
    }];

}
//例三：
- (void)case3 {
}
//例四：
- (void)case4 {
}
//例五：
- (void)case5 {
}
//例六：
- (void)case6 {
}
//例七：
- (void)case7 {
}
//例八：
- (void)case8 {
}
//例九：
- (void)case9 {
}

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) tag:i];
    }
    
}


@end
