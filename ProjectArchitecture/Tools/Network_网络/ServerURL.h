//
//  ServerURL.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/15.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface ServerURL : NSObject
//
//@end
// #pragma mark ======================="  网络请求_异常处理  "=========================
FOUNDATION_EXTERN NSString *const LocalError_timedOut;
FOUNDATION_EXTERN NSString *const LocalError_notConnect;
FOUNDATION_EXTERN NSString *const LocalError_offline; // 互联网连接似乎是离线的
FOUNDATION_EXTERN NSString *const LocalError_notRead;
FOUNDATION_EXTERN NSString *const LocalError_cancelRequest;
FOUNDATION_EXTERN int const WithoutNetworkErrorCode;



/********************  网络请求地址  *********************/
/**
 * 服务地址 IP环境  API_URL
 */
// 生产环境
FOUNDATION_EXTERN NSString *const AIPURL_Distribution;
// 测试环境
FOUNDATION_EXTERN NSString *const AIPURL_Development;
// 折扣宜家 (服务器)
FOUNDATION_EXTERN NSString *const YiJia_APIURL;
// 网易新闻 （可用）
FOUNDATION_EXTERN NSString *const WangYi_APIURL;
FOUNDATION_EXTERN NSString *const WangYi_URlstr;



// 服装列表（可用）
FOUNDATION_EXTERN NSString *const Suit_list;
// 获取验证码
FOUNDATION_EXTERN NSString *const SmsCode;
// 注册
FOUNDATION_EXTERN NSString *const Register;
// 登录
FOUNDATION_EXTERN NSString *const Login_URL;
// 退出登录
FOUNDATION_EXTERN NSString *const Logout_URL;
// 投资项目列表
FOUNDATION_EXTERN NSString *const AppFinance;
// 广告
FOUNDATION_EXTERN NSString *const AdList;
// 新闻资讯列表查询
FOUNDATION_EXTERN NSString *const News_URl;


/**
 * 请求码
 */
// 首页
FOUNDATION_EXTERN NSString *const CityTravel_URL;
// 发现
FOUNDATION_EXTERN NSString *const Find_URL;
// 更多视频
FOUNDATION_EXTERN NSString *const ExploreMore_URL;



/********** Project Key ***********/

// 首页banner数据key
FOUNDATION_EXTERN NSString *const BannerDatakey;
// 首页热门游记数据key
FOUNDATION_EXTERN NSString *const TravelDatakey;
// 发现视频数据key
FOUNDATION_EXTERN NSString *const FindVideoDatakey;
// 发现feed数据key
FOUNDATION_EXTERN NSString *const FindFeedDatakey;
// 经度key
FOUNDATION_EXTERN NSString *const Longitudekey;
// 纬度key
FOUNDATION_EXTERN NSString *const Latitudekey;
// 城市名key
FOUNDATION_EXTERN NSString *const CityNamekey;
// 网页标题key
FOUNDATION_EXTERN NSString *const ViewTitlekey;
// 网页请求地址key
FOUNDATION_EXTERN NSString *const RequestURLkey;
// WebViewNav的导航类型key
FOUNDATION_EXTERN NSString *const NavBarStyleTypekey;
// 网络状态类型key
FOUNDATION_EXTERN NSString *const NetWorkStatusTypekey;
// Web页面key
FOUNDATION_EXTERN NSString *const WebViewTypekey;
// model下标key
FOUNDATION_EXTERN NSString *const DataIndex;








