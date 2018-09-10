//
//  ZM_ThirdLoginManager.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/8/27.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_ThirdLoginManager.h"
//#import "UMMobClick/MobClick.h"

@implementation ZM_ThirdLoginManager


+ (NSString *)QQ_getSex:(NSString *)sex {
    if ([sex isEqualToString:@"男"]) {
        return @"1";
    }else {
        return @"0";
    }
}
+ (NSString *)Sina_getSex:(NSString *)sex {
    if ([sex isEqualToString:@"m"]) {
        return @"1";
    }else {
        return @"0";
    }
}

+ (NSDictionary *)dealInfoDicWithResult:(id )result error:(NSError *)error 
                 platformType:(UMSocialPlatformType)platformType {
    
    UMSocialUserInfoResponse *resp = result;  
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:resp.originalResponse];
    NSLog(@"---result= %@",result);
    NSLog(@"---dic= %@",dic); 
    NSLog(@"---error= %@",error); 
    NSLog(@"---unionId= %@",resp.unionId); 
    NSLog(@"---usid= %@",resp.usid); 

    NSMutableDictionary *infoDic = [[NSMutableDictionary alloc] init];
    if (platformType==UMSocialPlatformType_WechatSession) {        
        //微信 
        [infoDic setObject:@"1" forKey:@"type"];
        [infoDic setObject:resp.usid forKey:@"openId"];
        [infoDic setObject:dic[@"nickname"] forKey:@"nickname"];
        [infoDic setObject:dic[@"headimgurl"] forKey:@"headImgURL"];
        [infoDic setObject:dic[@"sex"]      forKey:@"sex"];
    }else if (platformType==UMSocialPlatformType_QQ) {   
        //QQ
        [infoDic setObject:@"2" forKey:@"type"];
        [infoDic setObject:resp.usid forKey:@"openId"];
        [infoDic setObject:dic[@"nickname"] forKey:@"nickname"];
        [infoDic setObject:dic[@"figureurl_2"] forKey:@"headImgURL"];
        [infoDic setObject:[ZM_ThirdLoginManager QQ_getSex:dic[@"gender"]] forKey:@"sex"];
    }else if (platformType==UMSocialPlatformType_Sina) {   
        //新浪微博
        [infoDic setObject:@"3" forKey:@"type"];
        [infoDic setObject:resp.usid forKey:@"openId"];
        [infoDic setObject:dic[@"screen_name"] forKey:@"nickname"];
        [infoDic setObject:dic[@"profile_image_url"] forKey:@"headImgURL"];
        [infoDic setObject:[ZM_ThirdLoginManager Sina_getSex:dic[@"gender"]] forKey:@"sex"];
    }else{
        //未知
        NSString *imgURL = @"http://imgsrc.baidu.com/imgad/pic/item/9213b07eca806538f1fef0359ddda144ad348284.jpg";
        [infoDic setObject:@"0" forKey:@"type"];
        [infoDic setObject:@"123456789" forKey:@"openId"];
        [infoDic setObject:@"发财了" forKey:@"nickname"];
        [infoDic setObject:imgURL forKey:@"headImgURL"];
        [infoDic setObject:@"0" forKey:@"sex"];
    }
    
    return infoDic;
}


@end
