//
//  UICollectionView_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UICollectionView_VC.h"
#import "ItemCollectionView.h"
#import "SelectDayView.h"
#import "NSDate+ZMAdd.h"

@interface UICollectionView_VC ()
{
    
}
@property (nonatomic, strong) ItemCollectionView *itemView;
@property (nonatomic, strong) NSMutableArray *itemTitleArray;

@property (nonatomic, strong) SelectDayView *selectDayView;
@property (nonatomic, strong) NSMutableArray *dayArray;
@property (nonatomic, strong) NSMutableArray *lastDayArray;
@property (nonatomic, strong) NSMutableArray *timeArray;
@property (nonatomic, strong) NSMutableArray *dateilTimeArray;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *dateStr;
@end

@implementation UICollectionView_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮
//    [self backBtnNoNavBar:NO normalBack:YES];
    NSString *title=@"";
    CGFloat width = 120;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 120+ (35+10)*(i-1), width, 35) Tag:i];
    }

}

//例一：
- (void)case1 {
    
    [self.view addSubview:self.itemView];
    
    _itemTitleArray = [[NSMutableArray alloc] init];
    for (int i=1 ; i<31; i++) {
        [_itemTitleArray addObject:[NSString stringWithFormat:@"标题%d",i]];
    }
    //刷新
    [self.itemView setTitleArr:_itemTitleArray showIndex:3];
    
//    [self.itemView reloadTitleArray:_itemTitleArray showIndex:6];
    
    //__weak typeof(self) weakSf = self;
    self.itemView.selectDayBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath, NSString* selectTitle) {
        NSLog(@"-----> selectTitle= %@ \n ",selectTitle);
    };
    
    
}
//例二：
- (void)case2 {
    
    [self.view addSubview:self.selectDayView];
    
    _dayArray = [[NSMutableArray alloc] init];
    _lastDayArray = [[NSMutableArray alloc] init];
    _timeArray = [[NSMutableArray alloc] init];
    _dateilTimeArray = [[NSMutableArray alloc] init];
    //获取时间
    _year =  [NSDate getCurrentDateWithFormatter:@"yyyy"];
    _month =  [NSDate getCurrentDateWithFormatter:@"MM"];
    _day =  [NSDate getCurrentDateWithFormatter:@"dd"];
    _dayArray = [NSDate dayArrayWithYear:_year month:_month isAddZero:YES];
    //    [_dayArray addObjectsFromArray:[NSDate dayArrayWithYear:_year month:_month isAddZero:YES]];
    _dateStr = [NSString stringWithFormat:@"%@-%@-%@",_year, _month, _day];
    NSLog(@"--> _dateStr= %@",_dateStr);
    //NSLog(@"--> _dayArray= %@",_dayArray);
    
    __block int cutNum = 7;
    __block NSString* LastMonth = @"";
    __block NSString* getYear = @"";
    if ([_month isEqualToString:@"1"]) {
        LastMonth = @"12";
        getYear = [NSString stringWithFormat:@"%d",[_year intValue]-1];
    }else{
        if ([LastMonth intValue] < 10) {
            LastMonth =[NSString stringWithFormat:@"0%d",[_month intValue]-1];
        }else{
            LastMonth =[NSString stringWithFormat:@"%d",[_month intValue]-1];
        }
        getYear= _year;
    }
    //    [_lastDayArray addObjectsFromArray:[NSDate dayArrayWithYear:getYear month:LastMonth isAddZero:YES]];
    _lastDayArray= [NSDate dayArrayWithYear:getYear month:LastMonth isAddZero:YES];
    NSUInteger LastMonthDayCount = [_lastDayArray count];
    [_lastDayArray removeObjectsInRange:NSMakeRange(0, LastMonthDayCount-cutNum)];
    
    NSMutableArray *allDayArray = [[NSMutableArray alloc] init];
    [allDayArray addObjectsFromArray:_lastDayArray];
    [allDayArray addObjectsFromArray:_dayArray];

    for (int i=0; i<10; i++) {
        [_timeArray addObject:[NSString stringWithFormat:@"我%d",i]];
        [_dateilTimeArray addObject:[NSString stringWithFormat:@"详情内容_%d",i]];
    }
    
    NSLog(@"--> _timeArray= %@",_timeArray);
    NSLog(@"--> _dateilTimeArray= %@",_dateilTimeArray);
    
    //    [_selectDayView setTimeArray:_timeArray detailTimeArray:_dateilTimeArray currentMonth:_month currentDay:_day];
    [self.selectDayView setTimeArray:self.timeArray
                     detailTimeArray:self.dateilTimeArray
                        currentMonth:self.month
                          currentDay:self.day];
    //    [self performSelector:@selector(delayAction) withObject:@"abc" afterDelay:1.5];
    
    
}



//例三：
- (void)case3 {
}
//例四：
- (void)case4 {
}
//例五：
- (void)case5 {
}
//例六：
- (void)case6 {
}
//例七：
- (void)case7 {
}
//例八：
- (void)case8 {
}
//例九：
- (void)case9 {
}
//
- (ItemCollectionView *)itemView {
    if (!_itemView) {
        _itemView= [[ItemCollectionView alloc] initWithFrame:CGRectMake(0, 70, SSWIDTH, 40)];
        _itemView.backgroundColor = BgGrayColor;
    }
    return _itemView;
}
//日期
- (SelectDayView *)selectDayView {
    if (!_selectDayView) {
        _selectDayView= [[SelectDayView alloc] initWithFrame:CGRectMake(0, 70, SSWIDTH, 40)];
        _selectDayView.backgroundColor = White_COLOR;
    }
    return _selectDayView;
}

- (void)myBtnClick:(UIButton *)Btn{
    if (Btn.tag==1) {       [self case1];
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }
}

@end
