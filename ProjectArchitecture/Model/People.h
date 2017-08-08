//
//  People.h
//  ZMArchitecture
//
//  Created by ZM on 16/9/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "BaseObject.h"

@interface People : BaseObject

PProperty_String(name);
PProperty_String(age);
PProperty_String(sex);
PProperty_String(salary);

@end
