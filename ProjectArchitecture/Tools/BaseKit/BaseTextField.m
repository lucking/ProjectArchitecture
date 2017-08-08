//
//  BaseTextField.m
//  Architecture
//
//  Created by ZM on 16/7/21.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField



// 金额处理
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //获取文本
    NSString * currentText= [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //当@“.“的数量大于1或者小数点后2位以上时不改变字符串
    if ([currentText rangeOfString:@"."].length>0)
    {//临时数组，用完请释放
        NSArray *goestArray=[currentText componentsSeparatedByString:@"."];
        if ([goestArray count]>2||[[goestArray objectAtIndex:1] length]>2){
            return NO;
        }
    }
    //限制输入框的位数
    if (textField.tag==111) {
        if ([currentText length] > 9){//限制只能输入9位数字
            return NO;
        }
    }else if (textField.tag==222) {
        if ([currentText length] > 6){//限制只能输入6位数字
            return NO;
        }
    }
    
    return YES;
}



@end
