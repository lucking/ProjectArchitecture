//
//  ZMSpaceLabel.h
//  TestApp
//
//  Created by ZM on 16/4/7.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMSpaceLabel : UILabel
{
 //@private
//	long      _characterSpacing;       //字间距
//	CGFloat   linesSpacing_;           //行间距
}
@property (nonatomic, assign) long      characterSpace;	//字间距
@property (nonatomic, assign) CGFloat   linesSpace;		//行间距
@property (nonatomic, assign) CGFloat   paragraphSpace;	//段间距 用换行符\n后，段落间的距离


/*
 *绘制前获取label高度
 */
- (CGFloat)getAttributedStringHeightWidthValue:(CGFloat)width;




@end
