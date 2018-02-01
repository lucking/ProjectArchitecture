//
//  UISearchBar+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/7.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (ZMAdd)
{
    
}
- (void)zm_setTextFont:(UIFont *)font;
- (void)zm_setTextColor:(UIColor *)textColor;
- (void)zm_setCancelButtonTitle:(NSString *)title;
/**
 *  设置取消按钮字体
 *  @param font 字体
 */
- (void)zm_setCancelButtonFont:(UIFont *)font;

@end
