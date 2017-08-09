//
//  Network_VController.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/26.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Network_VController.h"
#import "NetworkSession.h"
#import "HTConst.h"
#import "ServerConfig.h"
#import "ServerURL.h"

@interface Network_VController ()
//@property (nonatomic, copy) NSString *type;
@end

@implementation Network_VController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];

    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) Tag:i];
    }

    //映客主播
   // [self loadData];
}

/** 映客主播
 
 抓了很多直播app的数据，发现映客主播的质量是最高的。
 映客主播url:http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1
 uid=账号ID，这里是我的账号ID
 interest=兴趣 ，1表示只查看女生
 上下拉刷新的接口没抓到，就一下加载200条数据
 */
- (void)loadData
{
    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        NSLog(@"---> responseObject: %@", responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//例一：AFNetworking 原始请求方式 没有封装
- (void)case1 {
    __block NSURLSessionDataTask *dataTask = nil;
    NSDictionary *params = @{@"cid":@"remen",};
    NSString *urlStr = @"http://zhekou.yijia.com/lws/view/ichuanyi/suit_list_data_get.php";
    
    dataTask = [[NetworkSession sharedSessionManager] GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"---> responseObject: %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"---> error: %@", error);
        NSLog(@"---> description: %@", [error description]);
    }];
    //必要时：取消请求任务
    //[dataTask cancel];

}

//例二： Get Post 请求方式：需要完整URL，带参数（对AFNetworking封装）
- (void)case2 {
    __block NSURLSessionDataTask *dataTask = nil;
    NSDictionary *params = @{@"cid":@"remen",};
    NSString *urlStr = @"http://zhekou.yijia.com/lws/view/ichuanyi/suit_list_data_get.php";
    
    dataTask = [NetworkManager GetURL:urlStr withParameters:params hudShow:YES success:^(id data) {
        NSLog(@"---> data = %@ \n \n", data);
        
    } failure:^(NSError *error) {
    }];
    //必要时：取消请求任务
    //[dataTask cancel];

}

//例三：Get Post 请求方式：API固定 需要拼接URL，带参数（对AFNetworking封装）
- (void)case3 {
    
    [ServerConfig configServer:@"02"];

    __block NSURLSessionDataTask *dataTask = nil;
    NSDictionary *params = @{@"cid":@"remen",};
    dataTask = [NetworkManager requestGetURL:Suit_list withParameters:params hudShow:NO success:^(id data) {
        NSLog(@"---> data = %@ \n \n", data);
        
    } failure:^(NSError *error) {
    }];
  
}

//例四：带菊花
- (void)case4 {
    
    [ServerConfig configServer:@"01"];

    __block NSURLSessionDataTask *dataTask = nil;
    NSDictionary *params = @{@"cid":@"remen",};
    dataTask = [NetworkManager requestGetURL:CityTravel_URL withParameters:params hudShow:YES success:^(id data) {
        NSLog(@"---> data = %@ \n \n", data);
        
    } failure:^(NSError *error) {
    }];
    
    
    //NSString *const  CityTravel_URL = @"/v2/index/";
    // http://api.breadtrip.com/v2/index/
    // http://api.breadtrip.com/v2/index/?cid=remen
}


static NSString *type = @"";


//例五：
- (void)case5 {
//    switch (index) {
//        case 0:{ type = @"1min";
//        }break;
//        case 1:{ type = @"1min";
//        }break;
//        case 2:{ type = @"1min";
//        }break;
//        case 3:{ type = @"5min";
//        }break;
//        case 4:{ type = @"30min";
//        }break;
//        case 5:{ type = @"1hour";
//        }break;
//        case 6:{ type = @"1day";
//        }break;
//        case 7:{ type = @"1week";
//        }break;
//        default:
//            break;
//    }    
    
    __block NSURLSessionDataTask *dataTask = nil;
    NSDictionary *params = @{@"cid":@"remen",
                             @"type":@"1day",
                             @"symbol":@"huobibtccny",
                             @"size":@"300",};
    
    dataTask = [NetworkManager PostURL:@"https://www.btc123.com/kline/klineapi" withParameters:params hudShow:YES success:^(id data) {
        NSLog(@"---> data = %@ \n \n", data);
        
    } failure:^(NSError *error) {
    }];
    
    

}

//例六： 我的阿里云股票测试
- (void)case6 {
    
    //
/*
 AppKey：24568374
 AppSecret：1210385660c401d86b49a160a0fbd765
 AppCode：a1bb20a436404ce894a06dad76bfa5c7
 
 
 //股票K线数据：
 //https://market.aliyun.com/products/57000002/cmapi010845.html?spm=5176.2020520132.101.22.JNMy2D#sku=yuncode484500003
 appcode：你自己的AppCode
 code：股票编码（例如腾讯控股的是：txkg）
 time： 5 = 5分k线(默认) ，
        30 = 30分k线，
        60 = 60分k线，
        day = 日k线，
        week = 周k线，
        month = 月k线。注意港股不支持5分、30分和60分k线。
 
 {"min":"12.860",       //时间区间内最小的价格
 "open":"18.500",       //时间区间开始的价格
 "volumn":"3762769.000",//时间区间成交手数总合
 "time":"20170731",     //时间点，5分|30分|60分k线时，此时间返回到分钟级别。day|week|month的k线时，时间返回到天级别
 "max":"20.050",        //时间区间内最高的价格
 "close":"13.510"       //时间区间结束的价格
 },
 
*/
    
    NSString *appcode = @"a1bb20a436404ce894a06dad76bfa5c7";
    NSString *host = @"https://ali-stock.showapi.com";
    NSString *path = @"/realtime-k";
    NSString *method = @"GET";
    NSString *querys = @"?beginDay=20161101&code=600004&time=day&type=bfq";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSLog(@"Response object: %@" , response);
        NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
        //打印应答中的body
        NSLog(@"Response body: %@" , bodyString);
        
        
    }];[task resume];
    
    
    
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


+ (void)xmlGetRequest
{
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    //自己生成一个响应的序列化对象,不使用系统给的方式
    //xml的地址
#define kXMLUrlString @"http://wiapi.hexun.com/news/getlist4.0.php?pid=100234721&pc=20&pn=1&st=0"
    NSString *urlStr= @"http://TaoBeiService.soonku.me/ProudctWebService.asmx/GetHomePageAdContentList";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    //申明返回的结果的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/javascript",@"text/html",@"text/plain",@"text/xml",nil];
    
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    
    [[NetworkSession sharedSessionManager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //progress
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [HHudProgress hudHidden];
        //请求成功返回数据
        NSLog(@"--->请求_responseObject: %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //处理_请求错误
        [NetworkManager errorDealWithLocalError:error];
    }];
    
}



- (void)myBtnClick:(UIButton *)Btn{
    if (Btn.tag==1) {       [self case1];
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }
}



@end
