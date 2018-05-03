//
//  HMNewsModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface ZM_HomeNewsModel : ZMBaseObject
@property (nonatomic, copy) NSString*(retFlag); //请求是否正确
@property (nonatomic, copy) NSString*(retCode); //反馈码
@property (nonatomic, copy) NSString*(retMsg);  //返回信息

@property (nonatomic, strong) NSMutableArray *(newsList);
@end



@interface NewsListModel : ZMBaseObject

@property (nonatomic, copy) NSString*(newsId);		// 新闻编号
@property (nonatomic, copy) NSString*(newsTitle);	// 新闻标题
@property (nonatomic, copy) NSString*(newsImgUrl);	// 新闻广告图地址
@end
