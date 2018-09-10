//
//  UIWindow+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/10.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIWindow+ZMAdd.h"

@implementation UIWindow (ZMAdd)


//获取当前屏幕显示的：viewController
- (UIViewController *)zm_visibleViewController {
	UIViewController *rootViewController = self.rootViewController;
	return [UIWindow zm_getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *)zm_getVisibleViewControllerFrom:(UIViewController *) vc {

	if ([vc isKindOfClass:[UINavigationController class]]) {
		return [UIWindow zm_getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];

	} else if ([vc isKindOfClass:[UITabBarController class]]) {
		return [UIWindow zm_getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
	} else {
		if (vc.presentedViewController) {
			return [UIWindow zm_getVisibleViewControllerFrom:vc.presentedViewController];
		} else {
			return vc;
		}
	}
}


@end
