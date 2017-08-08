//
//  YzmTextField.m
//  Architecture
//
//  Created by ZM on 16/7/5.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "YzmTextField.h"
#import "UserDefaults.h"
#import "NSString+ZMAdd.h"

#define BtnWidth	120	//

@interface YzmTextField()
{
    CGFloat myWidth,myHeight;
    NSTimer *timers;        //到计时
    int secondsCountDown;   // 秒
    NSString *_phoneNum;
}
@end;

@implementation YzmTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = Clear_COLOR;
        myWidth	= self.frame.size.width;
        myHeight= self.frame.size.height;
        
        self.rightBtn.backgroundColor = Green_COLOR;
        self.mainText.backgroundColor = Clear_COLOR;
        self.mainText.font = FFont(14);
        self.mainText.textColor = Black_COLOR;
        
        // 监听输入框： 开始编辑时
        [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
            if ([notificate.object isEqual:self.mainText]){
                self.layer.borderColor  = NavBg_COLOR.CGColor;
            }
        }];
        // 监听输入框： 结束编辑时
        [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidEndEditingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
            
            if ([notificate.object isEqual:self.mainText]){
                self.layer.borderColor  = Gray_cccccc.CGColor;
            }
        }];
    }
    return self;
}

- (void)ImageTextFieldBtnClick:(UIButton *)Btn{
    
    //	self.rightBtnBlock(@"按钮点击了");
    //	if ([self.delegate respondsToSelector:@selector(imageTextField:BtnClick:)]) {
    //		[self.delegate imageTextField:self BtnClick:Btn];
    //		NSSLog(@"代理_按钮点击了");
    //	}
//    _phoneNum = [UserDefaults getObjectForKey:@"getYzmPhoneNum"];
//    if ([_phoneNum isNotBlank]) {
//        if ([NSString validatePhone:_phoneNum]) {
//            
//            secondsCountDown = 10;//设定原始
//            //不允许点击
//            _rightBtn.userInteractionEnabled = NO;
//            //NStimer 到计时
//            timers= [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethods) userInfo:nil repeats:YES];
//            //获取验证码
//            [self goYanZhengMa];
//            
//        }else{  [MMBProgress hudShowError:@"请输入正确手机号"];    }
//    }else{  [MMBProgress hudShowError:@"请输入手机号"];    }
    
}
- (void)goYanZhengMa {
//    __weak typeof(self) weakSelf = self;
//    NSDictionary *params = @{@"phoneNum":_phoneNum
//                             };
//    [NetworkManager requestGetURl:SmsCode withParameters:params hudShow:YES success:^(id data) {
//        NSSLog(@"-----> 获取验证码_data = %@",data);
//        if ([data isNotBlank]) {
//            NSDictionary* dicdata = (NSDictionary *)data;
//
//            NSString *RSPMSG = dicdata[@"REP_HEAD"][@"TRAN_RSPMSG"];
//            NSString *CODE = dicdata[@"REP_HEAD"][@"TRAN_CODE"];
//            
//            if ([CODE isEqualToString:@"0"]) {
//                [weakSelf renew]; //恢复
//                [MMBProgress hudShowMessage:RSPMSG afterDelay:2.0f];
//            }
//        }else{
//        }
//        
//    } failure:^(NSError *error) {
//        [weakSelf renew]; //恢复
//        NSSLog(@"---> error = %@ \n ",error.localizedDescription);
//        if (error.code == WithoutNetworkErrorCode) {
//            
//        }
//    }];
}

/**
 *  输入框
 */
- (UITextField *)mainText
{
    if (_mainText==nil) {
        float textWidth = myWidth-20-BtnWidth-20;
        _mainText = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, textWidth, myHeight)];
        _mainText.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_mainText];
    }
    return _mainText;
}
/**
 *	右图按钮
 */
- (UIButton *)rightBtn
{
    if (_rightBtn==nil) {
        CGFloat hh = (myHeight-10);
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(myWidth-BtnWidth-10, 5, BtnWidth, hh)];
        _rightBtn.layer.cornerRadius = hh/2;
        _rightBtn.layer.masksToBounds= YES;
        _rightBtn.titleLabel.font = FFont(14);
        [_rightBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(ImageTextFieldBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightBtn];
    }
    return _rightBtn;
}
//到计时
-(void)timeFireMethods
{
    NSSLog(@"--->seconds: %d",secondsCountDown);
    secondsCountDown--;
    NSString* BtnTitle= [NSString stringWithFormat:@"%d秒后重新发送",secondsCountDown];
    _rightBtn.backgroundColor = Gray_999999;
    [_rightBtn setTitle:BtnTitle forState:UIControlStateNormal];
    if(secondsCountDown==0){
        //恢复
        [self renew];
    }
}
//释放恢复
- (void)renew {
    if ([timers isValid]) {
        [timers invalidate];
        timers=nil;
    }
    secondsCountDown = 10;
    _rightBtn.backgroundColor = Green_COLOR;
    [_rightBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    [_rightBtn setUserInteractionEnabled:YES];
}
@end


