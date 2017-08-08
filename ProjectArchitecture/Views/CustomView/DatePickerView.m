//
//  DatePickerView.m
//  ZM_NSDataNSTimer
//
//  Created by ZM on 2016/12/19.
//  Copyright © 2016年 ZhangM. All rights reserved.
//

#import "DatePickerView.h"


#define UIColorWithRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]

#define     Clear_COLOR         [UIColor clearColor]    // 透明色
#define     White_COLOR         [UIColor whiteColor]    // 白色

#define     Color_FF9800    UIColorWithRGB(255,152,0)   //橘黄   #FF9800


@interface DatePickerView()
{
    float myWidth;
    float myHeight;
}
@property (nonatomic, strong) UIDatePicker *datePick;
@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end

@implementation DatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];

        myWidth = self.frame.size.width;
        myHeight = self.frame.size.height;
        
        //时间日期选择器
        _datePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, myWidth, myHeight-30)];
        [self addSubview:_datePick];

        
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.frame=CGRectMake(0,  CGRectGetMaxY(_datePick.frame), myWidth-0, 30);
        _selectBtn.backgroundColor = Color_FF9800;
        [_selectBtn setTitle:@"确    定" forState:UIControlStateNormal];
        [_selectBtn setTitleColor:White_COLOR forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selectBtn];
//        _selectBtn.layer.cornerRadius = 2.f;
//        _selectBtn.clipsToBounds = YES;
    }
    return self;
}

- (void)BtnClick {
    
    // 为日期格式器设置格式字符串
    [self.dateFormatter setDateFormat:self.dateFormatterString];
    // 使用日期格式生成器
    NSString *destDateString = [self.dateFormatter stringFromDate:[_datePick date]];
    
        //block 回调
    self.dateStringBlock(destDateString);
    
    [self dismissView];
    
}

//设置时间模式
- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode {
    
    _datePick.datePickerMode= datePickerMode;
}

//创建一个日期格式器
- (NSDateFormatter *)dateFormatter {
    if (_dateFormatter==nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}


// 显示 View
- (void)showView {
    self.hidden = NO;
//    self.datePick.hidden = NO;
}

// 隐藏 View
- (void)dismissView {
    self.hidden = YES;
//    self.datePick.hidden = YES;
}

// 移除：
- (void)removeAllView {
    //遍历所有子试图subviews
    for (UIView *subViews in self.subviews) {
        [subViews removeFromSuperview];
    }
    [self removeFromSuperview];
}

@end
