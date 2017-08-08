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
- (UIViewController *)visibleViewController {
	UIViewController *rootViewController = self.rootViewController;
	return [UIWindow getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {

	if ([vc isKindOfClass:[UINavigationController class]]) {
		return [UIWindow getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];

	} else if ([vc isKindOfClass:[UITabBarController class]]) {
		return [UIWindow getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
	} else {
		if (vc.presentedViewController) {
			return [UIWindow getVisibleViewControllerFrom:vc.presentedViewController];
		} else {
			return vc;
		}
	}
}


@end
