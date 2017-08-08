//
//  Rectangle.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Rectangle : UIView
{
    
}
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat bottom;

@property (nonatomic) CGRect frame;
@property (nonatomic) CGSize size;
@property (nonatomic) CGPoint origin;



@end
