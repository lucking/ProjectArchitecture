//
//  BLAreaPickerView.m
//  AreaPicker
//
//  Created by boundlessocean on 2016/11/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import "BLDatePickerView.h"

@interface BLDatePickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
/** pickView */
@property (nonatomic, strong) UIPickerView *pickView;
/** 顶部视图 */
@property (nonatomic, strong) UIView *topView;
/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelButton;
/** 确定按钮 */
@property (nonatomic, strong) UIButton *sureButton;
/** 选择日期 */
@property (nonatomic, strong) UILabel *chooseDateLabel;
@end

static const CGFloat topViewHeight = 38;
static const CGFloat buttonWidth = 60;
static const CGFloat animationDuration = 0.3;
static const NSInteger buttonFontSize = 13;
#define BL_ScreenW  [[UIScreen mainScreen] bounds].size.width
#define BL_ScreenH  [[UIScreen mainScreen] bounds].size.height
typedef enum : NSUInteger {
    BLComponentTypeYear = 0, // 年
    BLComponentTypeMonth,    // 月
    BLComponentTypeDay,      // 日
} BLComponentType;

@implementation BLDatePickerView
{
    NSInteger _yearSelectedRow;
    NSInteger _monthSelectedRow;
    NSInteger _daySelectedRow;
    
    NSString *_selectedYearTitle;
    NSString *_selectedMonthTitle;
    NSString *_selectedDayTitle;
    
    CGRect _pickViewFrame;
    
    NSMutableArray *_yearArray;
    NSMutableArray *_monthArray;
    NSMutableArray *_dayArray;
}

#pragma mark - - load

- (instancetype)init{
    self = [super init];
    if (self) {
        self = [self initWithFrame:CGRectMake(0, 0, BL_ScreenW, 150)];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self bl_initData:frame];
        [self bl_initSubviews];
    }
    return self;
}

/** 初始化子视图 */
- (void)bl_initSubviews{
    
    [self addSubview:self.topView];
    [self addSubview:self.pickView];
    [self.topView addSubview:self.cancelButton];
    [self.topView addSubview:self.sureButton];
    [self.topView addSubview:self.chooseDateLabel];
}

/** 初始化数据 */
- (void)bl_initData:(CGRect)frame{
    _pickViewFrame = frame;
    
    self.frame = CGRectMake(0, 0, BL_ScreenW, BL_ScreenH);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    _yearSelectedRow = 0;
    _monthSelectedRow = 0;
    _daySelectedRow = 0;
    
    [self setUpYMDateDic];
    
}
/** 初始化年月数据 */
- (void)setUpYMDateDic{
    
    _yearArray = [NSMutableArray arrayWithCapacity:0];
    _monthArray = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 1950; i<=2050; i++) {
        [_yearArray addObject:[NSString stringWithFormat:@"%ld年",(long)i]];
    }
    for (NSInteger i = 1; i <= 12; i++) {
        [_monthArray addObject:[NSString stringWithFormat:@"%ld月",(long)i]];
    }
    
}

#pragma mark - - get

/** 获取每月的天数 */
- (NSMutableArray *)dayArray{
    
    _dayArray = [NSMutableArray arrayWithCapacity:0];
    NSInteger year = [[_yearArray objectAtIndex:_yearSelectedRow] integerValue];
    NSInteger month = [[_monthArray objectAtIndex:_monthSelectedRow] integerValue];
    NSInteger maxDay = 31;
    if (year % 400 == 0 && month == 2) {
        maxDay = 29;
    } else if ((year % 100 != 0) && (year % 4 == 0) && month == 2){
        maxDay = 29;
    } else if (month == 2){
        maxDay = 28;
    } else if ((month % 2 != 0 && month < 8) || month == 8 || (month % 2 == 0 && month > 8)){
        maxDay = 31;
    } else {
        maxDay = 30;
    }
    for (NSInteger i = 1; i <= maxDay; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%ld日",(long)i]];
    }
    return _dayArray;
}



- (UIPickerView *)pickView{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), BL_ScreenW, _pickViewFrame.size.height)];
        _pickView.dataSource = self;
        _pickView.delegate = self;
        _pickView.backgroundColor = [UIColor colorWithRed:244.0/255 green:244.0/255 blue:244.0/255 alpha:1];
    }
    return _pickView;
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, BL_ScreenH, BL_ScreenW, topViewHeight)];
        _topView.backgroundColor = [UIColor orangeColor];
    }
    return _topView;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(0, 0, buttonWidth, topViewHeight);
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont systemFontOfSize:buttonFontSize]];
        [_cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(self.frame.size.width - buttonWidth, 0, buttonWidth, topViewHeight);
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton.titleLabel setFont:[UIFont systemFontOfSize:buttonFontSize]];
        [_sureButton addTarget:self action:@selector(sureButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

- (UILabel *)chooseDateLabel{
    if (!_chooseDateLabel) {
        _chooseDateLabel = [[UILabel alloc] initWithFrame:CGRectMake((BL_ScreenW - 100)/2, 0, 100, topViewHeight)];
        _chooseDateLabel.font = [UIFont systemFontOfSize:buttonFontSize];
        _chooseDateLabel.textColor = [UIColor whiteColor];
        _chooseDateLabel.textAlignment = NSTextAlignmentCenter;
        _chooseDateLabel.text = @"选择日期";
    }
    return _chooseDateLabel;
}

#pragma mark - - set
- (void)setPickViewBackgroundColor:(UIColor *)pickViewBackgroundColor{
    self.pickView.backgroundColor = pickViewBackgroundColor;
}

- (void)setTopViewBackgroundColor:(UIColor *)topViewBackgroundColor{
    self.topView.backgroundColor = topViewBackgroundColor;
}

- (void)setCancelButtonColor:(UIColor *)cancelButtonColor{
    [self.cancelButton setTitleColor:cancelButtonColor forState:UIControlStateNormal];
}

- (void)setSureButtonColor:(UIColor *)sureButtonColor{
    [self.sureButton setTitleColor:sureButtonColor forState:UIControlStateNormal];
}

- (void)setBackGAlpha:(CGFloat)backGAlpha{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:backGAlpha];
}
#pragma mark - show,dismiss

- (void)bl_show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect tempRect = _topView.frame;
        tempRect.origin.y = BL_ScreenH - topViewHeight - _pickViewFrame.size.height;
        _topView.frame = tempRect;
        tempRect = _pickViewFrame;
        tempRect.origin.y = CGRectGetMaxY(_topView.frame);
        _pickView.frame = tempRect;
    }];
}

- (void)bl_dismiss{
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect tempRect = _topView.frame;
        tempRect.origin.y = BL_ScreenH;
        _topView.frame = tempRect;
        tempRect = _pickViewFrame;
        tempRect.origin.y = CGRectGetMaxY(_topView.frame);
        _pickView.frame = tempRect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}

- (void)bl_setUpDefaultDateWithYear:(NSInteger)year
                              month:(NSInteger)month
                                day:(NSInteger)day{
    NSString *yearTitle = [NSString stringWithFormat:@"%ld年",(long)year];
    NSString *monthTitle = [NSString stringWithFormat:@"%ld月",(long)month];
    NSString *dayTitle = [NSString stringWithFormat:@"%ld日",(long)day];
    
    _yearSelectedRow = [_yearArray indexOfObject:yearTitle];
    _monthSelectedRow = [_monthArray indexOfObject:monthTitle];
    _daySelectedRow = [[self dayArray] indexOfObject:dayTitle];
    
    [self.pickView selectRow:_yearSelectedRow
                 inComponent:BLComponentTypeYear
                    animated:NO];
    [self.pickView selectRow:_monthSelectedRow
                 inComponent:BLComponentTypeMonth
                    animated:NO];
    [self.pickView selectRow:_daySelectedRow
                 inComponent:BLComponentTypeDay
                    animated:NO];
    
}

#pragma mark - - Button Action
- (void)cancelButtonClicked:(UIButton *)sender{
    
    if (self.pickViewDelegate &&
        [self.pickViewDelegate respondsToSelector:@selector(bl_cancelButtonClicked)]) {
        [self.pickViewDelegate bl_cancelButtonClicked];
    }
    [self bl_dismiss];
}

- (void)sureButtonClicked:(UIButton *)sender{
    
    _selectedYearTitle = [self pickerView:_pickView
                              titleForRow:_yearSelectedRow
                             forComponent:BLComponentTypeYear];
    _selectedMonthTitle = [self pickerView:_pickView
                               titleForRow:_monthSelectedRow
                              forComponent:BLComponentTypeMonth];
    _selectedDayTitle = [self pickerView:_pickView
                             titleForRow:_daySelectedRow
                            forComponent:BLComponentTypeDay];
    
    if (self.pickViewDelegate &&
        [self.pickViewDelegate respondsToSelector:@selector(bl_selectedDateResultWithYear:month:day:)]) {
        [self.pickViewDelegate bl_selectedDateResultWithYear:_selectedYearTitle
                                                       month:_selectedMonthTitle
                                                         day:_selectedDayTitle];
    }
    
    !_sureButtonClickBlcok ? : _sureButtonClickBlcok(_selectedYearTitle, _selectedMonthTitle, _selectedDayTitle);
    [self bl_dismiss];
}

#pragma mark - - UIPickerViewDelegate,UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case BLComponentTypeYear:
            return _yearArray.count;
            break;
        case BLComponentTypeMonth:
            return _monthArray.count;
            break;
        case BLComponentTypeDay:
            return [self dayArray].count;
            break;
        default:
            return _monthArray.count;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case BLComponentTypeYear:
            return _yearArray[row];
            break;
        case BLComponentTypeMonth:
            return _monthArray[row];
            break;
        case BLComponentTypeDay:
            return [self dayArray][row];
            break;
        default:
            return _monthArray[row];
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case BLComponentTypeYear:{
            _yearSelectedRow = row;
            _monthSelectedRow = 0;
            _daySelectedRow = 0;
            [pickerView selectRow:0 inComponent:1 animated:NO];
            [pickerView selectRow:0 inComponent:2 animated:NO];
            break;
        }
        case BLComponentTypeMonth:{
            _monthSelectedRow = row;
            _daySelectedRow = 0;
            [pickerView selectRow:0 inComponent:2 animated:NO];
            break;
        }
        case BLComponentTypeDay:
            _daySelectedRow = row;
            break;
        default:
            _yearSelectedRow = row;
            break;
    }
    [pickerView reloadAllComponents];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.frame.size.width / 3;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:_titleFont ? _titleFont : [UIFont systemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


@end
