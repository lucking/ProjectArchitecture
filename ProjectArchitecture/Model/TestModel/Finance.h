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

PProperty_String(retCode);      //返回码
PProperty_String(retFlag);      //返回正确、错误的标志
PProperty_String(retMsg);       //返回信息
//PPropertyObject(Finance, finance);//可用也可不用

//模型：mapLogo
PProperty_MutArray(mapLogo);
//模型：provinceList
PProperty_MutArray(provinceList);
//模型：PageBean
PProperty_Object(PageBean, pageBean);
//模型：Page
//PProperty_MutArray(pageArray);

#pragma mark -首页产品
+ (void)getFinance:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data,NSMutableArray* mutArray))successHandle failure:(void (^)(NSError *error))failureHandle;

#pragma mark -首页产品：返回数组
+ (void)getFinanceParams:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(NSMutableArray* Arr11, NSMutableArray* Arr22, NSMutableArray* Arr33))successHandle failure:(void (^)(NSError *error))failureHandle;

@end


//------------------  新类：MapLogo   ------------------
@interface MapLogo : ZMBaseObject

PProperty_String(borrow_type);
PProperty_String(details);
PProperty_String(ID); //id
PProperty_String(imagpath);
PProperty_String(mark);
PProperty_String(name);
PProperty_String(nid);
PProperty_String(status);
@end

//------------------  新类：PageBean   ------------------
@interface PageBean : ZMBaseObject

PProperty_String(pageNum);
PProperty_String(pageSize);
PProperty_String(startOfPage);
PProperty_String(totalNum);
PProperty_String(totalPageNum);
/**
 *  里面是Page模型
 */
@property (strong, nonatomic) NSMutableArray *page;//不可以写成这个样子 pageArray，必须和请求的数据数组一致
@end

//------------------  新类：Page   ------------------
@interface Page : ZMBaseObject

PProperty_String(annualRate);
PProperty_String(auditStatus);
PProperty_String(borrowAmount);
PProperty_String(borrowLogo);
PProperty_String(borrowShow);

PProperty_String(borrowStatus);
PProperty_String(borrowTitle);
PProperty_String(borrowWay);
PProperty_String(credit);
PProperty_String(creditrating);
PProperty_String(deadline);
PProperty_String(excitationSum);
PProperty_String(excitationType);

PProperty_String(hasPWD);
PProperty_String(idstan);
PProperty_String(imgPath);
PProperty_String(investNum);
PProperty_String(isDayThe);

PProperty_String(minTenderedSum);
PProperty_String(purpose);
PProperty_String(schedules);
PProperty_String(t_b_region);
PProperty_String(username);
PProperty_String(vip);
PProperty_String(vipStatus);
@end

//------------------  新类：ProvinceList   ------------------
@interface ProvinceList : ZMBaseObject

PProperty_String(agencyId);
PProperty_String(parentId);
PProperty_String(regionId);
PProperty_String(regionName);
PProperty_String(regionType);
@end



