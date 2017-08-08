//
//  UITextField_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UITextField_VController.h"
#import "LetfRightTextView.h"
#import "TopBottomTextView.h"
#import "UIView+ZMFrame.h"
#import "UIColor+ZMAdd.h"

@interface UITextField_VController ()<UIGestureRecognizerDelegate>
{
    NSArray *titleArrayAA;
    
}
@property (nonatomic, weak) LetfRightTextView *accNumView;
@property (nonatomic, weak) LetfRightTextView *phoneNumView;
@property (nonatomic, weak) LetfRightTextView *accDateView;
@property (nonatomic, weak) LetfRightTextView *yearDateView;
@property (nonatomic, weak) TopBottomTextView *topTextView;

@end

@implementation UITextField_VController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];

    [self testField];
}


- (void)testField {
    
    TopBottomTextView *topTextView = [[TopBottomTextView alloc] initWithFrame:CGRectMake(0, 80, SSWIDTH, 80)];
    topTextView.backgroundColor =  UIColorWithRGB(247,247,247);
    topTextView.title = @"帐户余额";
    topTextView.titleLab.font = FFont(16);
    topTextView.titleLab.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
    topTextView.text = @"100.00元";
    topTextView.textField.font = FFBoldFont(20);
    topTextView.textField.textColor = Color_With_Hex(0xf23030);
    topTextView.interval = 5.0f;
    [self.view addSubview:topTextView];
    
    
    [self addTextFieldFrame:CGRectMake(0, topTextView.bottom+10, SSWIDTH, 50) title:@"帐户号码:" text:@"13022155071" bottomLineX:20 tag:111];
    [self addTextFieldFrame:CGRectMake(0, _accNumView.bottom, SSWIDTH, 50) title:@"绑定手机:" text:@"13022155071" bottomLineX:0 tag:222];
    
    [self addTextFieldFrame:CGRectMake(0, _phoneNumView.bottom+10, SSWIDTH, 50) title:@"帐户有效期:" text:@"2017-09-01" bottomLineX:20 tag:333];
    
    [self addTextFieldFrame:CGRectMake(0, _accDateView.bottom, SSWIDTH, 50) title:@"包年有效期:" text:@"您当前不是包年客户" bottomLineX:0 tag:444];
    
    
}
- (void )addTextFieldFrame:(CGRect)frame title:(NSString *)title text:(NSString *)text bottomLineX:(float)bottomLineX tag:(NSInteger)tag
{
    LetfRightTextView *textField = [[LetfRightTextView alloc] initWithFrame:frame];
    textField.backgroundColor = White_COLOR;
    textField.title = title;
    textField.titleLab.textColor = Gray_888888;
    textField.textField.text = text;
    textField.textField.font = FFont(16);
    textField.textField.textColor = Gray_444444; //ColorHexString(@"666666");
    //    textField.topLineX = 20;
    textField.tag = tag;
    [self.view addSubview:textField];
    if (tag==111) {
        _accNumView = textField;
        textField.bottomLineX = bottomLineX;
        
    }else if (tag==222){
        _phoneNumView = textField;
        
    }else if (tag==333){
        _accDateView = textField;
        textField.bottomLineX = bottomLineX;
        
    }else if (tag==444){
        _yearDateView = textField;
    }
}


#pragma mark 按钮方法
-(void)myBtnClick:(UIButton*)Btn{
    [self.view endEditing:YES];
    
    if (Btn.tag==101) {    //
        //        TestAAViewController* pushVC= [[TestAAViewController alloc] init];
        //        [self.navigationController pushViewController:pushVC animated:YES];
    }
    else if (Btn.tag==102){//
        
    }else if (Btn.tag==103){//
        
    }else if (Btn.tag==104){//
        
    }else if (Btn.tag==105){//
        
    }
    
}


- (void)test {
    
    //使用系统返回按钮
    //    [self addBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backItem) tintColor:[UIColor whiteColor] isRightItem:NO];
    //
    // 子视图
    ////	[self subviews];
    //
    //	NSLog(@"---> getCurrentVC_Test = %@ \n ",[Common getCurrentVC]);
    
    
    
}



@end
