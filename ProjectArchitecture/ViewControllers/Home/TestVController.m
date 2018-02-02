//
//  TestVController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/8/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestVController.h"
#import "TestAAView.h"
#import "UILabel+ZMAdd.h"

@interface TestVController ()
@property (nonatomic, strong) TestAAView *testAAView;
@end

@implementation TestVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = White_COLOR;
    // self.navigationItem.titleView.backgroundColor = [UIColor purpleColor];
    // self.title = @" ";
    //自定义：titleView
    [self nav_titleView];
    
    //标题
    // [self setTitle:@"AATestVC" TitleColor:[UIColor whiteColor]];
    //返回按钮
    //    [self backBtnNoNavBar:NO normalBack:YES];
    [self initUI];
}

//http://blog.csdn.net/u010212550/article/details/51547259
- (void)nav_titleView {
    
    CGFloat ScreenWidth= [UIScreen mainScreen].bounds.size.width;
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;  //设置titleview，不过这个view并不是我们需要的居中的view；
    
    __weak typeof(self) WSelf = self;
    //主线程列队一个block， 这样做 可以获取到autolayout布局后的frame，也就是titleview的frame。在viewDidLayoutSubviews中同样可以获取到布局后的坐标
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //设置居中的view
        CGFloat ScreenWidth= [UIScreen mainScreen].bounds.size.width;
        CGFloat width = 120; //要居中view的宽度
        UIView *centerView = [[UIView alloc]init];
        centerView.backgroundColor = [UIColor greenColor];
        centerView.frame = CGRectMake(ScreenWidth/2, 20, width, 44);//设置一个基于window居中的坐标
        //坐标系转换到titleview
        centerView.frame = [WSelf.view.window convertRect:centerView.frame
                                                   toView:WSelf.navigationItem.titleView];
        [WSelf.navigationItem.titleView addSubview:centerView]; //centerview添加到titleview
    });
    
}
- (TestAAView *)testAAView {
    if (_testAAView==nil) {
        _testAAView = [[TestAAView alloc] init];
        _testAAView.backgroundColor = Yellow_COLOR;
    }
    return _testAAView;
}
-(void)BtnClick {
    NSLog(@"--->  按钮 = %@", @"BtnClick");
}
//例一：
- (void)case1 {}
//例二：按钮超出 边界可响应
- (void)case2 {
    
    [self.view addSubview:self.testAAView];
    
    _testAAView.frame = CGRectMake(30, 80, SSWIDTH-60, 200);
    _testAAView.acceptBtn.frame = CGRectMake(20, 200-50+20, 200, 50);
    [_testAAView.acceptBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];

}
//例三：
- (void)case3 {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 300)];
    textView.text = @"Hello textView";
    [self.view addSubview:textView];
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 80, SSWIDTH-60, 300) textContainer:textContainer];
    
    //textView.textContainer = textContainer;
    
}
//例四：
- (void)case4 {}
//例五：
- (void)case5 {}
//例六：
- (void)case6 {}
//例七：
- (void)case7 {}
//例八：
- (void)case8 {}
//例九：
- (void)case9 {}
//例十：
- (void)case10 {}

#pragma mark -- lazy load

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        if (i==1) { title = @"111"; }
        if (i==2) { title = @"222"; }
        if (i==3) { title = @"333"; }
        if (i==4) { title = @"444"; }
        if (i==5) { title = @"555"; }
        if (i==6) { title = @"666"; }
        if (i==7) { title = @"777"; }
        [self addBtnTitle:title frame:CGRectMake(10, 30+ (35+10)*i+ 40, width, 35) Tag:i];
    }
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
