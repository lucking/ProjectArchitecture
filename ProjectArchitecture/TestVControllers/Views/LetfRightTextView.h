//
//  LetfRightTextView.h
//  ZMArchitecture
//
//  Created by ZM on 16/9/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetfRightTextView : UIView
{
   	CGFloat myWidth;
    CGFloat myHeight;
    
}
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
// 顶线的x坐标
@property (nonatomic, assign) float topLineX;
// 底线的x坐标
@property (nonatomic, assign) float bottomLineX;


@end
