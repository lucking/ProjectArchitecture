//
//  ZM_TestTool.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/12.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_TestTool.h"
#import "ZM_TestHeader.h"

@implementation ZM_TestTool

+ (ZM_TestTool *)shareSingleton {
    static ZM_TestTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


//测试
+ (void)test {
    
    //[[Test_NSString shareSingleton] test_Sting];
    // [self test_variate];
    // [self LoginUserModel];
    // [self UserModel];
    
    //[self assertCrash];
    //[self timeDate];
    //[self APPDeviceInfo];
    
    //[DeviceInfo ISIPHONEXX];
    // [NSData nowTest];
    
    //测试 配置网络状态
    // [NetworkReachability netWorkReachabilityStatus];
    
    //if_else_Test();
    //strConvertToFlag();    

}


- (void)singleton_Test {
    
    NSString *str8 = @"123456789.00000000";
    NSString *str7 = @"123456789.10000000";
    NSString *str6 = @"123456789.01000000";
    NSString *str5 = @"0.00100000";
    NSString *str4 = @"0.00010000";
    NSString *str3 = @"0.00001000";
    NSString *str2 = @"0.00000100";
    NSString *str1 = @"0.00000010";
    NSString *str0 = @"0.00000001";
    NSLog(@"---str8= %@",[self convertToFlagIsNull8f:str8 priceType:@"$"]);
    NSLog(@"---str7= %@",[self convertToFlagIsNull8f:str7 priceType:@"$"]);
    NSLog(@"---str6= %@",[self convertToFlagIsNull8f:str6 priceType:@"$"]);
    NSLog(@"---str5= %@",[self convertToFlagIsNull8f:str5 priceType:@"￥"]);
    NSLog(@"---str4= %@",[self convertToFlagIsNull8f:str4 priceType:@"￥"]);
    NSLog(@"---str3= %@",[self convertToFlagIsNull8f:str3 priceType:@"￥"]);
    NSLog(@"---str2= %@",[self convertToFlagIsNull8f:str2 priceType:@"￥"]);
    NSLog(@"---str1= %@",[self convertToFlagIsNull8f:str1 priceType:@"￥"]);
    NSLog(@"---str0= %@",[self convertToFlagIsNull8f:str0 priceType:@"￥"]);
}

// 转换为杠杠：为空字符串 (涨跌幅：保留2~8位小数)
- (NSString*)convertToFlagIsNull8f:(NSString *)str priceType:(NSString *)priceType
{
    if (!str || [str isEqual:[NSNull null]]){
        return @"--";
    }else if ([str isKindOfClass:[NSNull class]]){
        return @"--";
    }else if (str == nil) {
        return @"--";
    }else if (str.length==0) {
        return @"--";
    }else if ([str isEqualToString:@""]) {
        return @"--";
    }else{
        if ([str floatValue] > 0.01) {
            return [NSString stringWithFormat:@"%@%.2f",priceType,[str doubleValue]];
        }else{
            NSString *temStr = [NSString stringWithFormat:@"%.8f",[str doubleValue]];
            if ([[self cutStringByEndNum:5 widthNum:1 str:temStr] isEqualToString:@"0"]) {
                
                if ([[self cutStringByEndNum:4 widthNum:1 str:temStr] isEqualToString:@"0"]) {
                    
                    if ([[self cutStringByEndNum:3 widthNum:1 str:temStr] isEqualToString:@"0"]) {
                        
                        if ([[self cutStringByEndNum:2 widthNum:1 str:temStr] isEqualToString:@"0"]) {
                            
                            if ([[self cutStringByEndNum:1 widthNum:1 str:temStr] isEqualToString:@"0"]) {
                                return [NSString stringWithFormat:@"%@%.8f",priceType,[str doubleValue]];
                            } else{ return [NSString stringWithFormat:@"%@%.8f",priceType,[str doubleValue]];
                            }
                            
                        } else{ return [NSString stringWithFormat:@"%@%.7f",priceType,[str doubleValue]];//2
                        }
                    } else{ return [NSString stringWithFormat:@"%@%.6f",priceType,[str doubleValue]];//3
                    }                    
                } else{ return [NSString stringWithFormat:@"%@%.5f",priceType,[str doubleValue]];//4
                }                
            } else { return [NSString stringWithFormat:@"%@%.4f",priceType, [str doubleValue]];//5
            }
        }
    }
}
/**
 * 截取字符串：(倒序截取：开始位置,位数)
 @param endNum 开始位置 
 @param widthNum 位数
 */
- (NSString *)cutStringByEndNum:(int)endNum widthNum:(int)widthNum str:(NSString *)str {
    return [str substringWithRange:NSMakeRange(str.length-endNum-widthNum, widthNum)];
}



void strConvertToFlag(){
    
    //最多保留8位，小数点的0后保留两位    
    // 123456789.00000000   length-8    123456789.00        保留2位
    // 123456789.10000000   length-7    123456789.10        保留2位
    // 123456789.01000000   length-6    123456789.01        保留2位
    // 0.00100000           length-5= 5    123456789.0010      保留4位   共10位
    // 0.00010000           length-4= 6    123456789.00010     保留5位
    // 0.00001000           length-3= 7    123456789.000010    保留6位
    // 0.00000100           length-2= 8    123456789.0000010   保留7位
    // 0.00000010           length-1= 9    123456789.00000010  保留8位
    // 0.00000001           length-0= 10   123456789.00000001  保留8位
//    NSString *str8 = @"123456789.00000000";
//    NSString *str7 = @"123456789.10000000";
//    NSString *str6 = @"123456789.01000000";
//    NSString *str5 = @"0.00100000";
//    NSString *str4 = @"0.00010000";
//    NSString *str3 = @"0.00001000";
//    NSString *str2 = @"0.00000100";
//    NSString *str1 = @"0.00000010";
//    NSString *str0 = @"0.00000001";
//    NSLog(@"---str8= %@",[ZM_MarketTool convertToFlagIsNull8f:str8 priceType:@"$"]);
//    NSLog(@"---str7= %@",[ZM_MarketTool convertToFlagIsNull8f:str7 priceType:@"$"]);
//    NSLog(@"---str6= %@",[ZM_MarketTool convertToFlagIsNull8f:str6 priceType:@"$"]);
//    NSLog(@"---str5= %@",[ZM_MarketTool convertToFlagIsNull8f:str5 priceType:@"￥"]);
//    NSLog(@"---str4= %@",[ZM_MarketTool convertToFlagIsNull8f:str4 priceType:@"￥"]);
//    NSLog(@"---str3= %@",[ZM_MarketTool convertToFlagIsNull8f:str3 priceType:@"￥"]);
//    NSLog(@"---str2= %@",[ZM_MarketTool convertToFlagIsNull8f:str2 priceType:@"￥"]);
//    NSLog(@"---str1= %@",[ZM_MarketTool convertToFlagIsNull8f:str1 priceType:@"￥"]);
//    NSLog(@"---str0= %@",[ZM_MarketTool convertToFlagIsNull8f:str0 priceType:@"￥"]);

}

void if_else_Test() {
    
    BOOL aaa = YES;
    int bb = 0;
    if (aaa) {
        NSLog(@"---aaa ");
    } else  bb = 1+1; NSLog(@"---bb= %d ",bb);
    
    //else 后面不加括号{}，只执行else 后面的第一句代码
    if (aaa) {
    } else {
    }NSLog(@"---bb ");
}

void openUDIDString() {
}
void deviceIDSelector() {
}
- (void)openUDIDString {
}
- (void)deviceIDSelector {
}


@end
