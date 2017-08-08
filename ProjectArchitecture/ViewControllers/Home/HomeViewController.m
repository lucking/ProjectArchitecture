//
//  HomeViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "HomeViewController.h"

#import "AppDelegate.h"
#import "TestViewController.h"
#import "ZMCache.h"
#import "DatePickerView.h"
#import "BLDatePickerView.h"

#import "RegisterViewController.h"
#import "CityTravelNotesController.h"
#import "LoginVC.h"

static NSString *_cellId = @"CellCC_Id";
//static CGFloat rowHeight = 200;  // cell的高度

@interface HomeViewController ()<BLDatePickerViewDelegate>
{
//	NSTimer* timer;
    Ivar aa;
}
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) DatePickerView *datePickerView;
@property (nonatomic, strong) BLDatePickerView *BLdatePicker;
@property (nonatomic, strong) UILabel *dateLabel;
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
	//[super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:NO animated:YES]; //显示_navBar
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidAppear:(BOOL)animated {
}
- (void)viewWillDisappear:(BOOL)animated {
    //[self.navigationController setNavigationBarHidden:YES animated:YES]; //隐藏_navBar
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// 初始化UI
	[self initUI];
    
}

//例一：
- (void)case1 {
//    
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
    RegisterViewController* pushVC= [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];

}
//例五：
- (void)case5 {
    CityTravelNotesController* pushVC= [[CityTravelNotesController alloc] init];
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
    //日期选择
    [self.BLdatePicker bl_show];
    //获取日期
    self.datePickerView.dateStringBlock = ^(NSString *dateString) {
        NSLog(@"---> destDateString = %@",dateString);
    };

}
//例八：
- (void)case8 {
   
}
//例九：
- (void)case9 {
  
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


#pragma mark - - lazy load
// 第一步
- (BLDatePickerView *)BLdatePicker{
    if (!_BLdatePicker) {
        _BLdatePicker = [[BLDatePickerView alloc] init];
        _BLdatePicker.pickViewDelegate = self;
        [_BLdatePicker bl_setUpDefaultDateWithYear:2016 month:9 day:8];
    }
    return _BLdatePicker;
}

#pragma mark - - BLDatePickerViewDelegate
// 第三步
- (void)bl_selectedDateResultWithYear:(NSString *)year
                                month:(NSString *)month
                                  day:(NSString *)day{
    _dateLabel.text = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
}

- (DatePickerView *)datePickerView {
    if (_datePickerView==nil) {
        _datePickerView = [[DatePickerView alloc] initWithFrame:CGRectMake(10, SSHEIGHT-250, SSWIDTH-20, 230)];
        _datePickerView.backgroundColor = White_COLOR;
        _datePickerView.layer.cornerRadius = 5.f;
        _datePickerView.clipsToBounds = YES;
        
        _datePickerView.datePickerMode= UIDatePickerModeDate;
        _datePickerView.dateFormatterString = @"yyyy-MM-dd";
        [self.view addSubview:_datePickerView];
//        [_datePickerView dismissView];
    }
    return _datePickerView;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 280, 150, 40)];
        _dateLabel.font = [UIFont systemFontOfSize:15];
        _dateLabel.textColor = [UIColor orangeColor];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.text = @"点击屏幕";
        [_dateLabel.layer setMasksToBounds:YES];
        [_dateLabel.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [_dateLabel.layer setBorderWidth:0.5];
        [_dateLabel.layer setCornerRadius:4];
    }
    return _dateLabel;
}
- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        if (i==1) { title = @"UIVC"; }
        if (i==2) { title = @"NSVC"; }
        if (i==3) { title = @"OtherVC"; }
        if (i==5) { title = @"CityTravel"; }
        [self addBtnTitle:title frame:CGRectMake(10, 30+ (35+10)*i, width, 35) Tag:i];
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

@end
