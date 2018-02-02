//
//  HomeViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZM_HomeVController.h"

#import "AppDelegate.h"
#import "TestViewController.h"
#import "ZMCache.h"

#import "RegisterViewController.h"
#import "CityTravelNotesController.h"
#import "LoginVC.h"
#import "TestVController.h"

static NSString *_cellId = @"CellCC_Id";

@interface ZM_HomeVController ()
{
    Ivar aa;
}
@property (nonatomic, strong) UILabel *dateLabel;
@end

@implementation ZM_HomeVController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:NO animated:YES]; //显示_navBar
    //[self.navigationController setNavigationBarHidden:YES animated:YES]; //隐藏_navBar
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)viewDidAppear:(BOOL)animated {
}
- (void)viewWillDisappear:(BOOL)animated {
}
- (void)viewDidLoad {
    [super viewDidLoad];
	// 初始化UI
	[self initUI];
    [self addBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(BarButtonItem) tintColor:[UIColor magentaColor] isRightItem:YES];

    
    //UITabBar 高度由49pt变成了83pt
    //NavTabBar 高度由20pt变成了44pt
    CGFloat statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    NSLog(@"---statusBarHeight= %f",statusBarHeight);
    // <8x ---statusBarHeight= 20.000000
    // =8x ---statusBarHeight= 44.000000
    //在其他型号的iPhone上StatusBar是20,在iPhone X上StatusBar的高度是44，
    //当你设置了这个属性的时候：Navigation bar height是140,否则 Navigation bar height是88
    if (@available(iOS 11.0, *)) {
        //self.navigationController.navigationBar.prefersLargeTitles = true;
    } else {
        // Fallback on earlier versions
    }

}
//可在子VC中重写
- (void)BarButtonItem {
    [HHudProgress hudHidden];
}

- (void)zm_aaa {
    
}
//例一：
- (void)case1 {
    TestViewController* pushVC= [[TestViewController alloc] init];
    pushVC.vcType = @"UIVC";
    [self.navigationController pushViewController:pushVC animated:YES];

//    UICollectionView_VC* pushVC= [[UICollectionView_VC alloc] init];
//    pushVC.title = @"UICollectionView_VC";
//    [self.navigationController pushViewController:pushVC animated:YES];
}
//例二：
- (void)case2 {
    TestViewController* pushVC= [[TestViewController alloc] init];
    pushVC.vcType = @"NSVC";
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例三：
- (void)case3 {
    TestViewController* pushVC= [[TestViewController alloc] init];
    pushVC.vcType = @"OtherVC";
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例四：
- (void)case4 {
    CityTravelNotesController* pushVC= [[CityTravelNotesController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例五：
- (void)case5 {
    RegisterViewController* pushVC= [[RegisterViewController alloc] init];
    pushVC.title = @"RegisterVC";
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例六：
- (void)case6 {
    LoginVC* pushVC= [[LoginVC alloc] init];
    pushVC.title = @"LoginVC";
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例七：
- (void)case7 {
    TestVController* pushVC= [[TestVController alloc] init];
    pushVC.title = @"TestVC";
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例八：
- (void)case8 {
//    [HHudProgress hudShowLoadingMsg:@"显示提醒数字" addSubview:self.view];
//    [HHudProgress hudShowMsg:@"显示提醒数字" delay:1.0f addSubview:self.view];
    [HHudProgress hudShowMsg:@"显示提醒数字" addSubview:self.view];

}
//例九：
- (void)case9 {
    [HHudProgress hudHidden];
}
//例十：
- (void)case10 {
    //跳转tabBar
    self.tabBarController.selectedIndex = 2;
    //显示提醒数字
    self.navigationController.tabBarItem.badgeValue = @"2";
    //不显示提醒数字
    self.navigationController.tabBarItem.badgeValue = nil;
}

#pragma mark -- lazy load

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        if (i==1) { title = @"UIVC"; }
        if (i==2) { title = @"NSVC"; }
        if (i==3) { title = @"OtherVC"; }
        if (i==4) { title = @"CityTravel"; }
        if (i==5) { title = @"RegisterVC"; }
        if (i==6) { title = @"LoginVC"; }
        if (i==7) { title = @"TestVC"; }

        [self addBtnTitle:title frame:CGRectMake(10, 30+ (35+10)*i+ 40, width, 35) Tag:i];
    }
    [self.view addSubview:self.dateLabel];
}
- (void)myBtnClick:(UIButton *)Btn{
    
    if (Btn.tag==1) {
        [self case1];
        Btn.selected=  !Btn.selected;
        
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }else if (Btn.tag==10) { [self case10];
    }
    if (Btn.tag==111) {
    }else if (Btn.tag==222) {
    }else if (Btn.tag==333) {
    }
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 280, 150, 40)];
        _dateLabel.font = [UIFont systemFontOfSize:15];
        _dateLabel.textColor = [UIColor orangeColor];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.text = @"点击屏幕";
        
    }
    return _dateLabel;
}

@end
