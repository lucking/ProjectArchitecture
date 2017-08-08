//
//  TXHandleCrash.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TXHandleCrash.h"
#import"NSDictionary+TXHandleCrash.h"


@implementation TXHandleCrash


- (void)testUse {
    //http://www.jianshu.com/p/a4b1d3506fb9
    //强大的NSException
}

+(void)startHandle
{
    dispatch_once_t token;
    dispatch_once(&token , ^{
        [NSDictionary handleCrash];
    });
    
}

+(void)handleClass:(Class)anClass exchangeClassMethod:(SEL)method1 Method:(SEL)method2
{
    Method mtd1 =class_getClassMethod(anClass, method1);
    Method mtd2 =class_getClassMethod(anClass, method2);
    method_exchangeImplementations(mtd1, mtd2);
}

+(void)handleClass:(Class)anClass exchangeCInstanceMethod:(SEL)method1 Method:(SEL)method2
{
    Method mtd1 =class_getInstanceMethod(anClass, method1);
    Method mtd2 =class_getInstanceMethod(anClass, method2);
    method_exchangeImplementations(mtd1, mtd2);
}

+(void)handleException:(NSException*)exception remark:(NSString*)remark

{
    //堆栈数据
    
    NSArray*callStackSymbols = [NSThread callStackSymbols];
    
    //获取在哪个类的哪个方法中实例化的数组，并格式化：-[类名方法名]、+[类名方法名]
    NSString*locationMsg = [self locationExcptionThroughCallStackSymbols:callStackSymbols];
    
    if(!locationMsg) {
        
        locationMsg =@"崩溃位置定位失败，请查看函数调用栈排查错误";
    }
    
    NSString*exceptionName = exception.name;
    
    NSString*exceptionReason = exception.reason;
    
    NSString*exceptionLocation = [NSString stringWithFormat:@"exception location:%@",locationMsg];
    
    NSString*exceptionMsg = [NSString stringWithFormat:@"\n\n%@\n\n%@\n%@\n%@\n%@\n\n%@\n\n",HandleCrashLogBegin, exceptionName, exceptionReason, exceptionLocation, remark,HandleCrashLogEnd];
    
    NSLog(@"%@", exceptionMsg);
    
    NSDictionary*exceptionInfoDic =@{
                                     @"exceptionName": exceptionName,
                                     @"exceptionReason": exceptionReason,
                                     @"exceptionLocation": exceptionLocation,
                                     @"remark": remark,
                                     @"exception": exception,
                                     @"callStackSymbols": callStackSymbols
                                     };
    
    //将错误信息放在字典里，用通知的形式发送出去
    [[NSNotificationCenter defaultCenter]postNotificationName:HandleCrashLogNotification object:nil userInfo:exceptionInfoDic];
    
}

+(NSString*)locationExcptionThroughCallStackSymbols:(NSArray*)callStackSymbols

{
    
    __block NSString *locationMsg =nil;
    
    NSLog(@"callStackSymbols=%@",callStackSymbols);
    
    //通过正则匹配出的格式为，-[类名方法名]、+[类名方法名]
    
//    NSString*regularExpStr =@"[-\\+]\\[.+\\]";
    
//    NSRegularExpression* regularExp = [[NSRegularExpression alloc]initWithPattern:regularExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    
//    for(int index=2; index
//        
//        NSString *callStackSymbol = callStackSymbols[index];
//        
//        [regularExp enumerateMatchesInString:callStackSymboloptions:NSMatchingReportProgressrange:NSMakeRange(0, callStackSymbol.length)usingBlock:^(NSTextCheckingResult*_Nullableresult,NSMatchingFlagsflags,BOOL*_Nonnullstop) {
//        
//        if(result) {
//            
//            NSString*tmpLocationMsg = [callStackSymbolsubstringWithRange:result.range];
//            
//            //get class name
//            
//            NSString*className = [tmpLocationMsg componentsSeparatedByString:@" "].firstObject;
//            
//            className = [className componentsSeparatedByString:@"["].lastObject;
//            
//            NSBundle*bundle = [NSBundle bundleForClass:NSClassFromString(className)];
//            
//            //filter catalog and system Class
//            if(![classNamehasPrefix:@")"] && bundle == [NSBundlemainBundle]) {
//                
//                locationMsg = tmpLocationMsg ;
//                
//            }
//            *stop =YES;
//            
//        }
//        
//    }];
//        
//        if(locationMsg.length) {
//            
//            break;
//            
//        }
//        
//    }
    
    return locationMsg ;
}
        
        
@end
