//
//  ZMTradeField.m
//  LiCaiStandard
//
//  Created by ZM on 15/10/14.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "ZMTradeField.h"

@implementation ZMTradeField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //初始化
        [self initView];
        
        //通知
        [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
            
            if ([notificate.object isEqual:self]){
                //控制圆点：隐藏、显示
                [self setDotWithCount:self.text.length];
            }
        }];
        //监听事件
        [self addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}
#pragma mark phoneText: 监听事件
- (void)textFieldEditingChanged:(UITextField *)textField
{
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
    }
    NSLog(@"---> 监听事件_textField.text = %@ ",textField.text);
}
- (void)initView
{
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds= YES;
    self.secureTextEntry = YES;
    //[self becomeFirstResponder];//键盘为第一响应：页面出现时就显示键盘
    //self.keyboardType = UIKeyboardTypeNumberPad;
	//self.delegate = self;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.font = [UIFont systemFontOfSize:20];
    self.tintColor = [UIColor clearColor];//隐藏光标
    self.textColor = [UIColor clearColor];//看不到输入内容
    
    dotImgvArrary = [[NSMutableArray alloc] init];
    
    //密码圆点
    for (int i = 0; i < kDotCount; i++)
    {
        UIImageView *dotImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDotwidth, kDotwidth)];
        dotImgV.center = CGPointMake(kInterval/2+ kInterval*i,  kSelfHeght/2);
        dotImgV.backgroundColor = [UIColor lightGrayColor];
        dotImgV.layer.cornerRadius = kDotwidth / 2.0f;
        dotImgV.clipsToBounds = YES;
        dotImgV.hidden = YES;
        [self addSubview:dotImgV];
        
        [dotImgvArrary addObject:dotImgV];
    }
}
#pragma mark  密码圆点：显示、隐藏
#pragma
- (void)setDotWithCount:(NSInteger)count
{
    for (UIImageView *dotImageView in dotImgvArrary){
        dotImageView.hidden = YES;
    }
    for (int i = 0; i< count; i++){
        ((UIImageView*)[dotImgvArrary objectAtIndex:i]).hidden = NO;
    }
}
//#pragma mark  =============="  UITextFieldDelegate  " ==============
//#pragma
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    //NSLog(@"textField.text = %@",textField.text);
//    return YES;
//}

@end






