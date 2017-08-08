//
//  Collect.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/29.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collect : NSObject

@property (nonatomic, copy) NSString *newsId; //id
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, copy) NSString *skimNum;
@property (nonatomic, copy) NSString *createtime;

@property (nonatomic, assign) BOOL isSelect;
//@property (nonatomic, assign) NSInteger index;

@end
