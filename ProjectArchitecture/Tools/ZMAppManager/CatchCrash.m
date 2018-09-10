//
//  CatchCrash.m
//  Architecture
//
//  Created by ZM on 16/6/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "CatchCrash.h"
#import "APPInfoManager.h"


#define CatchCrash_Email  @"mailto:whfandtank@163.com"

@implementation CatchCrash


- (void)test {
    
    //常见异常1---不存在方法引用
    //[self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    //[[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    [[NSArray array] objectAtIndex:1];
    
    //常见异常4---memoryWarning级别3以上
    //[self performSelector:@selector(killMemory) withObject:nil];
    
    //其他大家去想吧
}


void uncaughtExceptionHandler(NSException *exception)
{
    //异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    //出现异常的原因
    NSString *reason    = [exception reason];
    //异常名称
    NSString *name      = [exception name];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"================异常崩溃报告================\n name:\n%@\n reason:\n%@\n callStackSymbols:\n%@ \n \n ",name,reason,[stackArray componentsJoinedByString:@"\n"]];
    NSLog(@"---> exceptionInfo: %@",exceptionInfo);
    
    // 保存到本地
    [CatchCrash saveAsText:exceptionInfo];
    // 发送邮件
    [CatchCrash sendEmail:exceptionInfo];
    
}

//注册异常处理函数
+ (void)setExceptionHandler{
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
}

+ (NSUncaughtExceptionHandler *)getExceptionHandler{
    return NSGetUncaughtExceptionHandler();
}

// 保存到本地：可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器
+ (void)saveAsText:(NSString *)exceptionInfo{

    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Exception.txt"];
    [exceptionInfo writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

// 发送邮件：到指定的邮件地址
+ (void)sendEmail:(NSString *)exceptionInfo{

    NSString *appName=(NSString *)[APPInfoManager zm_getValueOfInfoDict:@"CFBundleDisplayName"];
    NSString *version=(NSString *)[APPInfoManager zm_getValueOfInfoDict:@"CFBundleVersion"];
    
    NSString *urlStr = [NSString stringWithFormat:@"m13032136839@163.com?subject=嗯,遇到麻烦了...%@&body=%@%@发生未捕捉异常错误,希望发送bug至技术支持邮箱,我们会尽快修复该bug,感谢您的配合!<br><br><br>"
                        "错误详情:%@",[NSDate date],appName,version,exceptionInfo];
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    
}

@end
