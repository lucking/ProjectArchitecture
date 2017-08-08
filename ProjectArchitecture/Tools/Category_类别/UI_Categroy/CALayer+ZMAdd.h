//
//  CALayer+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/23.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (ZMAdd)

//@property (nonatomic,strong) UIColor* borderCGColor;
@property(nonatomic, assign) UIColor* borderUIColor;
//setting background for UIView
@property(nonatomic, assign) UIColor* contentsUIImage;

@end

//http://www.gfzj.us/tech/2015/06/18/set-uiview-bordercolor-and-backgroundimage-in-interface-builder.html
//http://stackoverflow.com/a/27986696/3825920
