//
//  HomeDataTool.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataTool : NSObject


-(void)getDataWithParameters:(NSDictionary *)params dataBlock:(void (^)(id json,id param))block;



@end
