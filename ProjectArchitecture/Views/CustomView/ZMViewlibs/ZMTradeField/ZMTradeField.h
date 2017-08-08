//
//  ZMTradeField.h
//  LiCaiStandard
//
//  Created by ZM on 15/10/14.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "BaseHeader.h"

#define kSelfWidth   self.bounds.size.width
#define kSelfHeght   self.bounds.size.height

#define kDotCount 6
#define kDotwidth   8
#define kDotheight  kDotwidth
#define kInterval   kSelfWidth/6


@interface ZMTradeField : UITextField< UITextFieldDelegate >
{
    NSMutableArray *dotImgvArrary;
}

#pragma mark  密码圆点：显示、隐藏
#pragma
- (void)setDotWithCount:(NSInteger)count;






@end
