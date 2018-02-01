//
//  ServerURL.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/15.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ServerURL.h"

//@implementation ServerURL
//
//@end

// #pragma mark ======================="  网络请求_异常处理  "=========================
// 请求超时
NSString *const  LocalError_timedOut    = @"The request timed out.";
// 无法连接到服务器
NSString *const  LocalError_notConnect	= @"Could not connect to the server.";
// 互联网连接似乎是离线的
NSString *const  LocalError_offline     = @"The Internet connection appears to be offline.";
// 数据无法读取,因为它不在正确的格式
NSString *const  LocalError_notRead		= @"The data couldn’t be read because it isn’t in the correct format.";
// 取消网络请求
NSString *const  LocalError_cancelRequest   = @"cancelled";
// 没有网络的错误码
int const  WithoutNetworkErrorCode    = 1001;




/********** 网络请求地址 ***********/
/**
 * 服务地址  IP环境
 */
// 生产环境
NSString *const  AIPURL_Distribution = @"http://api.breadtrip.com";
// 测试环境
NSString *const  AIPURL_Development  = @"http://api.breadtrip.com";
// 服务器：折扣宜家
NSString *const	 YiJia_APIURL        = @"http://zhekou.yijia.com/lws/view/ichuanyi";
// 网易新闻 （可用）
NSString *const  WangYi_APIURL	=	@"http://c.m.163.com/";
NSString *const	 WangYi_URlstr  =   @"/nc/article/headline/T1348647853363/0-20.html";



//服装列表（可用）
NSString *const  Suit_list          = @"/suit_list_data_get.php";
// 获取验证码
NSString *const  SmsCode = @"";
// 注册
NSString *const  Register = @"";
// 登录
NSString *const  Login_URL = @"";
// 退出登录
NSString *const  Logout_URL = @"";
// 投资项目列表
NSString *const  AppFinance = @"";
// 广告
NSString *const  AdList = @"";
// 新闻资讯列表查询
NSString *const  News_URl = @"";


/**
 * 请求码
 */
// 首页
NSString *const  CityTravel_URL = @"/v2/index/";
// 发现
NSString *const  Find_URL = @"/hunter/feeds/";
// 更多视频
NSString *const  ExploreMore_URL = @"/hunter/videos/";

/********** Project Key ***********/

// 首页banner数据key
NSString *const  BannerDatakey = @"BannerDatakey";
// 首页热门游记数据key
NSString *const  TravelDatakey = @"TravelDatakey";
// 发现视频数据key
NSString *const  FindVideoDatakey = @"FindVideoDatakey";
// 发现feed数据key
NSString *const  FindFeedDatakey = @"FindFeedDatakey";
// 经度key
NSString *const  Longitudekey = @"Longitudekey";
// 纬度key
NSString *const  Latitudekey = @"Latitudekey";
// 城市名key
NSString *const  CityNamekey = @"CityNamekey";
// 网页标题key
NSString *const  ViewTitlekey = @"ViewTitlekey";
// 网页请求地址key
NSString *const  RequestURLkey = @"RequestURLkey";
// ViewNav的导航类型key
NSString *const  NavBarStyleTypekey = @"NavBarStyleTypekey";
// ViewNav的导航类型key
NSString *const  NetWorkStatusTypekey = @"NetWorkStatusTypekey";
// Web页面key
NSString *const  WebViewTypekey = @"WebViewTypekey";
// model下标key
NSString *const DataIndex = @"DataIndex";














