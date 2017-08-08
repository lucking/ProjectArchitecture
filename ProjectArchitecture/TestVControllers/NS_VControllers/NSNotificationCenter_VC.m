//
//  NSNotificationCenter_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/16.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSNotificationCenter_VC.h"

// 添加通知
#define PostNotificat(_name,_obj) [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj]
// 接收通知
#define GetNotificatSelector(_selector,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:_obj]


// 监听输入框： (UIControlEventEditingChanged：内容改变时)
#define NNotificatTextFieldEditingChanged(_textFiled)	[_textFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged]
//	监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
#define NNotificatTextFieldKeyboardWillHide(_textFiled)	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


@interface NSNotificationCenter_VC ()
{
    
}
@property (nonatomic, strong) UITextField *pwdText;
@end

@implementation NSNotificationCenter_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];
    
    
}

// 通知传值
- (void)ChangSelIndex:(NSNotification *)notify{
    
    NSLog(@"notify = %@",notify);
    NSLog(@"notify = %@",[notify description]);
    
    id obj = [notify object];//获取到传递的对象
    NSLog(@"obj = %@",obj);
    
    
    NSInteger index = [[notify object] integerValue];
    NSLog(@"index = %ld \n \n ",(long)index);
    
}


- (void)NotificatClick{
    
}


#pragma mark 接收通知变化
- (void)ChangNotification {
    
    NSLog(@" 通知变化,立即启动 \n ");
}
#pragma mark 键盘将要隐藏时：通知变化
- (void)NotificatKeyboardWillHide:(UITextField *)textField{
    
    NSLog(@" NotificatKeyboardWillHide \n ");
}
#pragma mark 输入框内容改变时：通知变化
- (void)textFieldEditingChanged:(UITextField *)textField{
    
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
    }
}



//例一：
- (void)case1 {
    
    
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"通知变化" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BackToFirst" object:@"111"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BackToSecond" object:@"222"];
    // 接受通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatClick)
                                                 name:@"通知变化" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:)
                                                 name:@"BackToFirst" object:@"111"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:)
                                                 name:@"BackToSecond" object:nil];
    
    //测试例子
    // 发出通知
    PostNotificat(@"Post",nil);
    // 接受通知：
    GetNotificatSelector(ChangNotification,@"Get", nil);
    GetNotificatSelector(ChangSelIndex:, @"Get", @"obj");
    
    NNotificatTextFieldEditingChanged(_pwdText);

  
    
    
    UITextField* pwdTextFiled = nil;
    [pwdTextFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    // 监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // 监听输入框： (UITextFieldTextDidChangeNotification：内容改变时)
    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){
        NSLog(@" textField ");
        if ([notificate.object isEqual:self]){
        }
//        if ([notificate.object isEqual:_phoneText.mainText] || [notificate.object isEqual:_pwdText.mainText]){
//            if (_phoneText.mainText.text.length > 11) {
//                _phoneText.mainText.text = [_phoneText.mainText.text substringToIndex:11];
//            }
//            if (_pwdText.mainText.text.length > 6) {
//                _pwdText.mainText.text = [_pwdText.mainText.text substringToIndex:6];
//            }
//        }

    }];
    
    

}


//例二：
- (void)case2 {
    
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:@"loginSuccess" object:nil];
}
- (void)loginSuccess {
    //延迟执行函数
    [self performSelector:@selector(scrollDone) withObject:nil afterDelay:0.5];
    
    //在0.5秒内取消执行函数，带的参数必须一样，才能取消成功
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(scrollDone) object:nil];
}
- (void)scrollDone {
    
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


@end
