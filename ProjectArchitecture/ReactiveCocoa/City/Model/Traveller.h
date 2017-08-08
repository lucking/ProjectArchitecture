//
//  Traveller.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Traveller : NSObject
/**
 *  用户头像*/
@property (copy, nonatomic) NSString *avatar_m;
/**
 *  用户名*/
@property (copy, nonatomic) NSString *name;
/**
 *  用户id*/
@property (strong, nonatomic) NSNumber *userID;

@end
