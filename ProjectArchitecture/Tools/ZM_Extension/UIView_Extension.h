//
//  UIView_Extension.h
//  ZMArchitecture
//
//  Created by ZM on 16/1/27.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView ()
{

	int iextension;

}

@property (nonatomic,assign, readonly) float value;

-(void)testInExtension;// 类的mainimplementation不实现的话，有编译警告。
@end



#import "UIView_Extension.h"
//@implementation UIView_Extension : NSObject
//
//-(void)testInExtension {
//
//}

//@end



////一般的时候，Extension都是放在.m文件中@implementation的上方。
//@interface MyClass ()
//
//@property (retain, readwrite) float value;
//
//@end




