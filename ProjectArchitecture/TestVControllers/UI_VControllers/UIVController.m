//
//  UIVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIVController.h"
#import "AppDelegate+BaseSetting.h"
#import "UIViewController+ZMAdd.h"
#import "UIView_VController.h"
#import "UILabel_VController.h"

static const  float SSPureHeight45  = (568-64-49);

@interface UIVController ()

@end

@implementation UIVController

/**
 *  系统返回按钮
 */
//- (BOOL)navigationShouldPopOnBackButton {
//    NSLog(@"---> 系统返回按钮_navigationShouldPopOnBackButton");
//    //使用自己的
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    //禁用系统的
//    return NO;
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //	[self tabBarHidden:YES];//隐藏tabBar
    //    [self backBtnWhiteHidden:NO];
    //显示navBar
    //self.navigationController.navigationBar.hidden = NO;
    //返回按钮颜色
    // self.navigationController.navigationBar.tintColor = Green_COLOR;
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    //  [self setTitle:@"UIVC" TitleColor:[UIColor whiteColor]];
    // self.title = @"UIVC";
    self.navigationItem.title = @"nav_UIVC";
    //覆盖默认返回按钮：处理有其他返回情况
    [self backBtnNoNavBar:NO normalBack:NO];
    __weak typeof(self) weakSf = self;
    self.backBlock = ^(UIButton *Btn) {
        NSLog(@"--> backBlock_UIVC");
        [weakSf.navigationController popViewControllerAnimated:YES];
    };
    
    // 初始化UI
    [self initUI];
    
}
//例一：
- (void)case1 {
    UIView_VController *pushVC= [[UIView_VController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
//例二：
- (void)case2 {
    UILabel_VController *pushVC= [[UILabel_VController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
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
- (void)myBtnClick:(UIButton *)Btn{
    if (Btn.tag==1) {       [self case1];
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }
}



- (void)sizeTest {
    
    NSLog(@"mainScreen_width  = %f",[UIScreen mainScreen].bounds.size.width);
    NSLog(@"mainScreen_height = %f \n ",[UIScreen mainScreen].bounds.size.height);
    NSLog(@"bounds_width  = %f",self.view.bounds.size.width);
    NSLog(@"bounds_height = %f \n ",self.view.bounds.size.height);
    NSLog(@"frame_width = %f",self.view.frame.size.width);
    NSLog(@"frame_height= %f \n  \n ",self.view.frame.size.height);
    
    NSLog(@"SSPureHeight45 = %f",SSPureHeight45);
    
    float aa =  SSPureHeight45;
    float bb =  SSPureHeight45;
    float cc =  SSHEIGHT;
    float dd =  SSHEIGHT;
    NSLog(@"aa = %p",&aa);
    NSLog(@"bb = %p",&bb);
    NSLog(@"cc = %p",&cc);
    NSLog(@"dd = %p",&dd);
    
    NSLog(@"aa = %f",aa);
    NSLog(@"bb = %f \n \n ",bb);
    
}

#pragma mark -----------------------"  视图、子视图  "---------------------------------
- (void)subviews
{
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [self.navigationController.view addSubview:view];
    [self.tabBarController.view addSubview:view];
    [[AppDelegate sharedAppDelegate].window addSubview:view];
    [view removeFromSuperview];
    
    
    UISearchBar* searchBar= [[ UISearchBar alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    searchBar.text =  @"子试图s";
    [self.view addSubview:searchBar];
    
    NSMutableArray* mutArray = [[NSMutableArray alloc] init];
    //遍历所有子视图subView
    for (UIView *subView in searchBar.subviews) {
        
        NSLog(@"searchBar.subviews = %@",subView);
        
        [mutArray  addObject:subView];
    }
    
    NNSLog(@"--> \n \n ");
    for (UIView *subView11 in mutArray) {
        
        NSLog(@"subView11 = %@",subView11.subviews); // 总共有两个子图层： UISearchBarBackground、UISearchBarTextField
    }
    NNSLog(@"--> \n \n ");
    NSLog(@"superview = %@",searchBar.superview);
    NSLog(@"superclass= %@ \n ",searchBar.superclass);
    
    NSLog(@"---> subviews  = %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject]);
    NSLog(@"---> superclass= %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject].superclass);
    NSLog(@"\n \n ");
    
    UIButton* Btn=[UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame= CGRectMake(60, 100, 200, 60);
    Btn.backgroundColor= [UIColor cyanColor];
    [Btn setTitle:@"按钮" forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn setTintColor:[UIColor whiteColor]];
    [self.view addSubview:Btn];
    
    //遍历所有子试图subviews
    for (UIView *subViews in Btn.subviews) {
        
        NSLog(@"Btn.subviews = %@",subViews);
    }
}


@end
