//
//  InputTextField.h
//  HuiFang
//
//  Created by ZM on 15/12/12.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageTextField.h"

@interface InputTextField : UIView
{
	CGFloat myWidth;
	CGFloat myHeight;

	CGFloat ImgvWidth;
	CGFloat ImgvHeight;

}
/*
 * 输入框
 */
@property(nonatomic,retain)UITextField* mainText;
/*
 * 右图片
 */
@property(nonatomic,retain)UIImageView* rightImgView;

- (void)reloadUIwithType:(NSString *)type;


@end


