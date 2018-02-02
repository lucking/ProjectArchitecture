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

PProperty_String(imgURL);      //图片网址
PProperty_String(imgName);     //图片名称
PProperty_String(imgWidth);    //宽度
PProperty_String(imgHeight);   //高度
/**
 *  ......
 */

@end
