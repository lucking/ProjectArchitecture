//
//  HMNewsModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface ZM_HomeNewsModel : ZMBaseObject
PProperty_String(retFlag); //请求是否正确
PProperty_String(retCode); //反馈码
PProperty_String(retMsg);  //返回信息

PProperty_MutArray(newsList);
@end



@interface NewsListModel : ZMBaseObject

PProperty_String(newsId);		// 新闻编号
PProperty_String(newsTitle);	// 新闻标题
PProperty_String(newsImgUrl);	// 新闻广告图地址
@end
