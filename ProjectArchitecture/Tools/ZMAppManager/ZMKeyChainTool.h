//
//  ZMKeyChainTool.h
//  ZM_APP
//
//  Created by ZM on 2017/11/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMKeyChainTool : NSObject


+ (void)zm_save:(NSString *)service data:(id)data;
+ (id)zm_load:(NSString *)service;
+ (void)zm_deleteKeyData:(NSString *)service;


@end
