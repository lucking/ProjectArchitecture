//
//  AAObject.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAObject : NSObject
{
    
}
@property(nonatomic,assign)int pId;
@property(nonatomic,copy)NSString *pDescription;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (id)orderWithDictionary:(NSDictionary *)dictionary;


@end
