//
//  User.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/7/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;
/**
 *  判断字符串中是否有中文
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isChinese:(NSString *)string;

@end
