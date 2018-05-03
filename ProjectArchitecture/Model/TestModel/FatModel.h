//
//  FatModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/2/24.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface FatModel : ZMBaseObject
{

}
// Raw Data：timestamp:1234567

@property (nonatomic, assign) CGFloat timestamp;
/**
 *  含弱业务：弱业务相对稳定，所以弱业务塞进Model里面是没问题的。
 */
- (NSString *)ymdDateString;// 2015-04-20 15:16
- (NSString *)gapString;	// 3分钟前、1小时前、一天前、2015-3-13 12:34


@end
