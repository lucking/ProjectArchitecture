//
//  LoginVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "LoginVC.h"
#import "LoginSuccessVC.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;


}
- (IBAction)Login:(id)sender {
    if ([self isLogin]) {
        LoginSuccessVC *loginSuccessVC = [[LoginSuccessVC alloc] init];
        [self.navigationController pushViewController:loginSuccessVC animated:YES];
    }
    
}
- (BOOL)isLogin{
    if ([self.userName.text isEqual:@""] || [self.passWord.text isEqual:@""]) {
        return NO;
    }else{
        return YES;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
