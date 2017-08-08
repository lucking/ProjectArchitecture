//
//  TopBottomTextView.h
//  Architecture
//
//  Created by ZM on 16/9/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBottomTextView : UIView
{
   	CGFloat myWidth;
    CGFloat myHeight;
    
}
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) float interval; // 两个控件之间的距离

@end
