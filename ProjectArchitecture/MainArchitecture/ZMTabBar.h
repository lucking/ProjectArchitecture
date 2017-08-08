//
//  ZMTabBar.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMUpperButton.h"

@interface ZMTabBar : UITabBar

@property (nonatomic, strong) ZMUpperButton *UpperBtn;

/**
 *  原始方式：单例
 *  @return 返回一个实例
 */
+ (ZMTabBar *)singleton;

@end
