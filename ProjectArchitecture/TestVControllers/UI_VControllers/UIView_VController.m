//
//  UIView_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIView_VController.h"
#import "AAView.h"

@interface UIView_VController ()
{
    AAView *aaView;
}
@end

@implementation UIView_VController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"UIView_VC";
    // 初始化UI
    [self initUI];   

}

//例一：
- (void)case1 {
    //    aaView = [AAView new];
    //    aaView = [AAView  init]; //cannot init a class object. 只初始化，不分配内存，会崩溃
    //    aaView = [AAView alloc]; // 只分配内存，不初始化，不会崩溃
    
    aaView = [[AAView alloc] init];
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

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) Tag:i];
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

@end
