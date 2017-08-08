//
//  SelectDayView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^SelectDayBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);
//typedef void(^ArrowBtnBlock) (id data);
typedef void(^SelectDayBlock)(UICollectionView *collectionView, NSIndexPath *indexPath, NSString* dateString);

@interface SelectDayView : UIView
{
    
}
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *detailTimeArray;

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, assign) BOOL readType; //皮肤模式：夜间、白天

@property (nonatomic, copy) SelectDayBlock selectDayBlock;

//- (void)setTitleArr:(NSArray *)titleArr month:(NSString *)month day:(NSString *)day;

- (void)setTimeArray:(NSMutableArray *)timeArray detailTimeArray:(NSMutableArray *)detailTimeArray
        currentMonth:(NSString *)month
          currentDay:(NSString *)day;

@end
