//
//  Itemlable.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/9.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Itemlable : UILabel
{
    float WWidth ;
    float HHeight;
}
//比例
@property (nonatomic,assign) CGFloat scale;
//竖线
@property (nonatomic,strong) UIView* verticalLine;
//横线
@property (nonatomic,strong) UIView* horizontallLine;

@end
