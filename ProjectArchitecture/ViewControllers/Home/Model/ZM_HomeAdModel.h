//
//  HMAdModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface ZM_HomeAdModel : ZMBaseObject

//@property (nonatomic,copy, readonly) NSString *Name;
//@property (nonatomic,assign,readonly) NSInteger age;

@property (nonatomic, copy) NSString*(imgURL);      //图片网址
@property (nonatomic, copy) NSString*(imgName);     //图片名称
@property (nonatomic, copy) NSString*(imgWidth);    //宽度
@property (nonatomic, copy) NSString*(imgHeight);   //高度
/**
 *  ......
 */

@end
