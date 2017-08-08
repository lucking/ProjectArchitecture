//
//  MoreViewController.m
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "MoreViewController.h"
#import "ItemScrollView.h"

@interface MoreViewController ()
{
    
}
@property (nonatomic, strong) ItemScrollView *itemScrollView;
@end

@implementation MoreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated {
    //显示tabBar
    self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setCaseUI];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    _itemScrollView = [[ItemScrollView alloc] initWithFrame:CGRectMake(0, 100, SSWIDTH, 40)];
    _itemScrollView.backgroundColor = BgGrayColor;
    [self.view addSubview:_itemScrollView];
  
    _itemScrollView.titleArray = @[@"公司介绍",@"产品理念",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴",@"联系方式",@"合作伙伴"];
    _itemScrollView.itemClickBlock = ^(NSInteger itemTag) {
        
        NSLog(@"itemTag= %ld", itemTag);
    };

    
    
}

- (void)setCaseUI {
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<6; i++) {
        
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) Tag:i];
    }
    
    //    CGFloat yy = SSHEIGHT-90;
    //    [self addBtnTitle:@"attentionCase3_1" frame:CGRectMake(10, yy, width, 35) Tag:111];
    //    [self addBtnTitle:@"attentionCase3_2" frame:CGRectMake(10*2+width, yy, width, 35) Tag:222];
    //    [self addBtnTitle:@"solveCase3_1" frame:CGRectMake(10, yy+45, width, 35) Tag:333];
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
    
    if (Btn.tag==111) {
    }else if (Btn.tag==222) {
    }else if (Btn.tag==333) {
    }
}
//例一：
- (void)case1 {
    self.tabBarController.selectedIndex = 3;

}
//例二：
- (void)case2 {
    
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


@end
