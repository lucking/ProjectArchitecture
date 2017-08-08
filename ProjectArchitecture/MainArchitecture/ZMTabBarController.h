//
//  ZMTabBarController.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/20.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMTabBar.h"
#import "ZMNavController.h"

@interface ZMTabBarController : UITabBarController
{
    
}
@property (nonatomic, assign) NSInteger upperIndex; //突出项的索引
@property (nonatomic, strong) ZMTabBar *zmTabBar;
//重写选择器
//@property(nonatomic) NSUInteger selectedIndex;

@end



