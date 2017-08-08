//
//  ZMCircleProgressView.m
//  LiCaiStandard
//
//  Created by ZM on 15/10/8.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "ZMCircleProgressView.h"
#import "AppMacro.h"

@implementation ZMCircleProgressView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        // self.backgroundColor = [UIColor yellowColor];
        
        //初始化
        self.startAngle = 180;
        self.pathWidth = 10;
        self.progress = 0.6;
        self.progressColor = [UIColor cyanColor];
        self.trackColor = [UIColor lightGrayColor];
        
        
        float myWidth = self.frame.size.width;
        float myHeight = myWidth;
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, myWidth/4, myWidth, 40)];
        titleLab.font = [UIFont systemFontOfSize:16];
        if (IS_IPHONE6p) {
            titleLab.font = [UIFont systemFontOfSize:18];
        }
        titleLab.textColor = Gray_999999;
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLab];
        
        
        UILabel *rateLab = [[UILabel alloc] initWithFrame:CGRectMake(0, myHeight/2-10, myWidth, 60)];
		rateLab.center = CGPointMake(myWidth/2, myHeight/2);
        rateLab.backgroundColor = [UIColor clearColor];
        rateLab.font = [UIFont systemFontOfSize:50];
        rateLab.textColor = [UIColor orangeColor];;
        rateLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:rateLab];
        if (IS_IPHONE6p) {
            rateLab.font = [UIFont systemFontOfSize:60];
        }
        
        self.titleLabel = titleLab;
        self.rateLable = rateLab;

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint centerPoint = CGPointMake(rect.size.height/2, rect.size.width/2);
    CGFloat radius = MIN(rect.size.height, rect.size.width) / 2;
    
    //创建画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //未填充轨迹颜色 (背景大圆)
    [self.trackColor setFill];
    CGMutablePathRef trackPath = CGPathCreateMutable();//M_PI
    CGPathMoveToPoint(trackPath, NULL, centerPoint.x, centerPoint.y);
    CGPathAddArc(trackPath, NULL, centerPoint.x, centerPoint.y, radius, DEGREES_2_RADIANS(0), DEGREES_2_RADIANS(360), NO);
    CGPathCloseSubpath(trackPath);
    CGContextAddPath(context, trackPath);
    CGContextFillPath(context);
    CGPathRelease(trackPath);
    
    
    //进度条颜色 (大圆：与背景大圆重合)
    [self.progressColor setFill];
    CGMutablePathRef progressPath = CGPathCreateMutable();
    CGPathMoveToPoint(progressPath, NULL, centerPoint.x, centerPoint.y);
    /*
     //创建Arc（弧形）
     CGPathAddArc( path,
     NULL,
     CGFloat x,         //中心点x
     CGFloat y,         //中心点y
     CGFloat radius,    //半径
     CGFloat startAngle,//开始弧度
     CGFloat endAngle,  //结束弧度
     bool clockwise)
     */
    //结束弧度
    CGFloat endAngle = DEGREES_2_RADIANS((self.progress*359.9)-(360-self.startAngle));
                                                                  //半径    开始弧度                             结束弧度
    CGPathAddArc(progressPath, NULL, centerPoint.x, centerPoint.y, radius, DEGREES_2_RADIANS(self.startAngle), endAngle, NO);
    CGPathCloseSubpath(progressPath);
    CGContextAddPath(context, progressPath);
    CGContextFillPath(context);
    CGPathRelease(progressPath);
    
    
    //内圆
    [self.innerColor set];
    //CGContextSetBlendMode(context, kCGBlendModeClear);//透明背景模式
    CGFloat innerRadius = radius - self.pathWidth;//内圆半径
    CGPoint newCenterPoint = CGPointMake(centerPoint.x - innerRadius, centerPoint.y - innerRadius);
    CGContextAddEllipseInRect(context, CGRectMake(newCenterPoint.x, newCenterPoint.y, innerRadius*2, innerRadius*2));
    CGContextFillPath(context);
    
    
}

#pragma mark - Property Methods
#pragma mark 背景轨道颜色
- (UIColor *)trackColor
{
    if (!_trackColor){
        _trackColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.3f];
    }
    return _trackColor;
}
#pragma mark 内圆颜色
- (UIColor *)innerColor{
    
    if (!_innerColor) {
        _innerColor = [UIColor whiteColor];
    }
    return _innerColor;
}
#pragma mark 进度条颜色
- (UIColor *)progressColor{
    
    if (!_progressColor){
        _progressColor = [UIColor whiteColor];
    }
    return _progressColor;
}
- (void)setProgress:(float)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end


