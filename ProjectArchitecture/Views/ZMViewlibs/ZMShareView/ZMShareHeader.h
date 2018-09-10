//
//  ZMShareHeader.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/3/13.
//  Copyright © 2018年 ZM. All rights reserved.
//

#ifndef ZMShareHeader_h
#define ZMShareHeader_h


#define sColorRGB(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
#define sColorRGBA(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define sColorWithRGBA(r,g,b,a)  [UIColor colorWithRed:r green:g blue:b alpha:a]
#define sBlack_COLOR         [UIColor blackColor]    // 黑色


static NSString *const Identifier = @"ShareCellId";

// 取消按钮的高度
static CGFloat const CancelBtnH = 44;
// 文本编辑View的高度
//static CGFloat const ShareViewHeight = (134+ 6+ CancelBtnH);
static CGFloat BottomViewH    = (200+ CancelBtnH);
static CGFloat const ItemHeight     = 90;
static CGFloat const LineSpace      = 10;
static CGFloat const VerticalSpace  = 0;







#endif /* ZMShareHeader_h */
