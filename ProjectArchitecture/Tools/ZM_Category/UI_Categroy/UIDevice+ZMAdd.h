//
//  UIDevice+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef SystemVersion
#define SystemVersion [UIDevice systemVersion]
#endif

#ifndef iOS6LaterSV
#define iOS6LaterSV (SystemVersion >= 6)
#endif

#ifndef iOS7LaterSV
#define iOS7LaterSV (SystemVersion >= 7)
#endif

#ifndef iOS8LaterSV
#define iOS8LaterSV (SystemVersion >= 8)
#endif

#ifndef iOS9LaterSV
#define iOS9LaterSV (SystemVersion >= 9)
#endif


@interface UIDevice (ZMAdd)

@end
