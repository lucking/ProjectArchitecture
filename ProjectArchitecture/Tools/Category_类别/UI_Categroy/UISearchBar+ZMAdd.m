//
//  UISearchBar+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UISearchBar+ZMAdd.h"

#define IS_IOS9 [[UIDevice currentDevice].systemVersion doubleValue] >= 9


@implementation UISearchBar (ZMAdd)

- (void)zm_setTextFont:(UIFont *)font {
    if (IS_IOS9) {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].font = font;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setFont:font];
    }
}

- (void)zm_setTextColor:(UIColor *)textColor {
    if (IS_IOS9) {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].textColor = textColor;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:textColor];
    }
}

- (void)zm_setCancelButtonTitle:(NSString *)title {
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:title];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:title];
    }
}

- (void)zm_setCancelButtonFont:(UIFont *)font {
    NSDictionary *textAttr = @{NSFontAttributeName : font};
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }
}


@end
