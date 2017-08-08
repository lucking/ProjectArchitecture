//
//  ZMCircleProgressView.h
//  LiCaiStandard
//
//  Created by ZM on 15/10/8.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseHeader.h"


@interface ZMCircleProgressView : UIView
{
    
}
//将角度转换为弧度：M_PI/180 = 0.017453
#define DEGREES_2_RADIANS(x) (0.0174532925 * (x))

//未填充轨迹颜色
@property (nonatomic, strong) UIColor *trackColor;
//内圆颜色
@property (nonatomic, strong) UIColor *innerColor;

//进度条颜色
@property (nonatomic, strong) UIColor *progressColor;
//进度条宽度
@property (nonatomic,assign) float pathWidth;
//进度系数
@property (nonatomic,assign) float progress;

//开始角度
@property (nonatomic,assign) float startAngle;

/*
 * 标题
 */
@property(nonatomic,strong)UILabel *titleLabel;
/*
 * 利率
 */
@property(nonatomic,strong)UILabel* rateLable;



@end
