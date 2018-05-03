//
//  Finance.h
//  ZMArchitecture
//
//  Created by ZM on 16/2/29.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@class PageBean;
@class Page;

@interface Finance : ZMBaseObject

@property (nonatomic, copy) NSString*(retCode);      //返回码
@property (nonatomic, copy) NSString*(retFlag);      //返回正确、错误的标志
@property (nonatomic, copy) NSString*(retMsg);       //返回信息
//PPropertyObject(Finance, finance);//可用也可不用

//模型：mapLogo
@property (nonatomic, strong) NSMutableArray *(mapLogo);
//模型：provinceList
@property (nonatomic, strong) NSMutableArray *(provinceList);
//模型：PageBean
@property (nonatomic, strong) PageBean *pageBean;
//模型：Page
//@property (nonatomic, strong) NSMutableArray *(pageArray);

#pragma mark -首页产品
+ (void)getFinance:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data,NSMutableArray* mutArray))successHandle failure:(void (^)(NSError *error))failureHandle;

#pragma mark -首页产品：返回数组
+ (void)getFinanceParams:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(NSMutableArray* Arr11, NSMutableArray* Arr22, NSMutableArray* Arr33))successHandle failure:(void (^)(NSError *error))failureHandle;

@end


//------------------  新类：MapLogo   ------------------
@interface MapLogo : ZMBaseObject

@property (nonatomic, copy) NSString*(borrow_type);
@property (nonatomic, copy) NSString*(details);
@property (nonatomic, copy) NSString*(ID); //id
@property (nonatomic, copy) NSString*(imagpath);
@property (nonatomic, copy) NSString*(mark);
@property (nonatomic, copy) NSString*(name);
@property (nonatomic, copy) NSString*(nid);
@property (nonatomic, copy) NSString*(status);
@end

//------------------  新类：PageBean   ------------------
@interface PageBean : ZMBaseObject

@property (nonatomic, copy) NSString*(pageNum);
@property (nonatomic, copy) NSString*(pageSize);
@property (nonatomic, copy) NSString*(startOfPage);
@property (nonatomic, copy) NSString*(totalNum);
@property (nonatomic, copy) NSString*(totalPageNum);
/**
 *  里面是Page模型
 */
@property (strong, nonatomic) NSMutableArray *page;//不可以写成这个样子 pageArray，必须和请求的数据数组一致
@end

//------------------  新类：Page   ------------------
@interface Page : ZMBaseObject

@property (nonatomic, copy) NSString*(annualRate);
@property (nonatomic, copy) NSString*(auditStatus);
@property (nonatomic, copy) NSString*(borrowAmount);
@property (nonatomic, copy) NSString*(borrowLogo);
@property (nonatomic, copy) NSString*(borrowShow);

@property (nonatomic, copy) NSString*(borrowStatus);
@property (nonatomic, copy) NSString*(borrowTitle);
@property (nonatomic, copy) NSString*(borrowWay);
@property (nonatomic, copy) NSString*(credit);
@property (nonatomic, copy) NSString*(creditrating);
@property (nonatomic, copy) NSString*(deadline);
@property (nonatomic, copy) NSString*(excitationSum);
@property (nonatomic, copy) NSString*(excitationType);

@property (nonatomic, copy) NSString*(hasPWD);
@property (nonatomic, copy) NSString*(idstan);
@property (nonatomic, copy) NSString*(imgPath);
@property (nonatomic, copy) NSString*(investNum);
@property (nonatomic, copy) NSString*(isDayThe);

@property (nonatomic, copy) NSString*(minTenderedSum);
@property (nonatomic, copy) NSString*(purpose);
@property (nonatomic, copy) NSString*(schedules);
@property (nonatomic, copy) NSString*(t_b_region);
@property (nonatomic, copy) NSString*(username);
@property (nonatomic, copy) NSString*(vip);
@property (nonatomic, copy) NSString*(vipStatus);
@end

//------------------  新类：ProvinceList   ------------------
@interface ProvinceList : ZMBaseObject

@property (nonatomic, copy) NSString*(agencyId);
@property (nonatomic, copy) NSString*(parentId);
@property (nonatomic, copy) NSString*(regionId);
@property (nonatomic, copy) NSString*(regionName);
@property (nonatomic, copy) NSString*(regionType);
@end



