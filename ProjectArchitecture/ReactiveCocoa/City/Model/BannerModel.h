//
//  BannerModel.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject
/** 
 banner跳转地址 */
@property (copy, nonatomic) NSString *html_url;
/**
 banner图地址  */
@property (copy, nonatomic) NSString *image_url;

@end
